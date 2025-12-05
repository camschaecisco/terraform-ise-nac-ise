#!/usr/bin/env python3
'''
Validate nesting levels in ISE YAML configurations.
Ensures configurations don't exceed Terraform's runtime limits.
'''

import sys
import yaml
import json
from pathlib import Path

MAX_TERRAFORM_NESTING = 5
MAX_ISE_NESTING = 7

def count_nesting_depth(obj, current_depth=0):
    '''Recursively count the maximum nesting depth in a condition object.'''
    if not isinstance(obj, dict):
        return current_depth

    max_depth = current_depth

    # Check for children key which indicates nesting
    if 'children' in obj and isinstance(obj['children'], list):
        for child in obj['children']:
            child_depth = count_nesting_depth(child, current_depth + 1)
            max_depth = max(max_depth, child_depth)

    # Check nested conditions in other keys
    for key, value in obj.items():
        if key != 'children' and isinstance(value, dict):
            nested_depth = count_nesting_depth(value, current_depth)
            max_depth = max(max_depth, nested_depth)
        elif key == 'condition' and isinstance(value, dict):
            nested_depth = count_nesting_depth(value, current_depth)
            max_depth = max(max_depth, nested_depth)

    return max_depth

def validate_yaml_file(filepath):
    '''Validate a YAML file for nesting depth.'''
    try:
        with open(filepath, 'r') as f:
            data = yaml.safe_load(f)

        if not data:
            return True, 0, 'Empty file'

        max_depth = 0
        paths_checked = []

        # Check ISE configuration
        if 'ise' in data:
            ise_config = data['ise']

            # Check network access policy sets
            if 'network_access' in ise_config:
                na_config = ise_config['network_access']
                if 'policy_sets' in na_config:
                    for ps in na_config['policy_sets']:
                        if 'condition' in ps:
                            depth = count_nesting_depth(ps['condition'])
                            max_depth = max(max_depth, depth)
                            paths_checked.append(f"network_access.policy_sets.{ps.get('name', 'unnamed')}")

            # Check device admin policy sets
            if 'device_administration' in ise_config:
                da_config = ise_config['device_administration']
                if 'policy_sets' in da_config:
                    for ps in da_config['policy_sets']:
                        if 'condition' in ps:
                            depth = count_nesting_depth(ps['condition'])
                            max_depth = max(max_depth, depth)
                            paths_checked.append(f"device_admin.policy_sets.{ps.get('name', 'unnamed')}")

        # Determine validation result
        if max_depth > MAX_ISE_NESTING:
            return False, max_depth, f'Exceeds ISE maximum nesting ({MAX_ISE_NESTING} levels)'
        elif max_depth > MAX_TERRAFORM_NESTING:
            return True, max_depth, f'Warning: Exceeds Terraform runtime limit ({MAX_TERRAFORM_NESTING} levels), but within ISE limits'
        else:
            return True, max_depth, 'Valid'

    except Exception as e:
        return False, 0, f'Error: {str(e)}'

def main():
    '''Main validation function.'''
    if len(sys.argv) < 2:
        print('Usage: validate_nesting.py <yaml_file> [yaml_file ...]')
        sys.exit(1)

    all_valid = True
    warnings = []

    for filepath in sys.argv[1:]:
        path = Path(filepath)
        if not path.exists():
            print(f'✗ {filepath}: File not found')
            all_valid = False
            continue

        if path.suffix not in ['.yaml', '.yml']:
            continue  # Skip non-YAML files

        valid, depth, message = validate_yaml_file(filepath)

        if not valid:
            print(f'✗ {filepath}: {message} (depth: {depth})')
            all_valid = False
        elif depth > MAX_TERRAFORM_NESTING:
            print(f'⚠ {filepath}: {message} (depth: {depth})')
            warnings.append(filepath)
        else:
            print(f'✓ {filepath}: {message} (depth: {depth})')

    if warnings:
        print('\nWarning: Some files exceed Terraform runtime limit but are within ISE capabilities.')
        print('  Consider using condition references for deep nesting.')

    sys.exit(0 if all_valid else 1)

if __name__ == '__main__':
    main()
