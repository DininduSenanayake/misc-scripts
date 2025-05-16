#!/bin/bash

# Script to scan .RSYNC_FILTER files in /nesi/nobackup/ projects
# and identify those containing full paths instead of relative paths

# Define the base directory and filter file name
BASE_DIR="/nesi/nobackup"
FILTER_FILE=".RSYNC_FILTER"

# Define the problematic path prefixes to look for
PROBLEMATIC_PREFIXES=(
    "/nesi/nobackup/"
    "/scale_wlg_nobackup/filesets/nobackup/"
)

# Create array to store projects with issues
declare -a projects_with_issues

echo "=== Scanning RSYNC_FILTER files for problematic full paths ==="
echo "Base directory: $BASE_DIR"
echo "============================================================="
echo

# Find all project directories and check their RSYNC_FILTER files
for project_dir in "$BASE_DIR"/*; do
    # Check if it's a directory
    if [ -d "$project_dir" ]; then
        filter_path="$project_dir/$FILTER_FILE"
        
        # Check if the RSYNC_FILTER file exists
        if [ -f "$filter_path" ]; then
            project_name=$(basename "$project_dir")
            found_issues=false
            
            # Read each line of the RSYNC_FILTER file
            while IFS= read -r line || [ -n "$line" ]; do
                # Skip empty lines and comments
                [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
                
                # Check if the line contains any of the problematic prefixes
                for prefix in "${PROBLEMATIC_PREFIXES[@]}"; do
                    if [[ "$line" =~ $prefix ]]; then
                        if [ "$found_issues" = false ]; then
                            echo "⚠️  Issues found in: $project_name"
                            echo "   File: $filter_path"
                            echo "   Problematic entries:"
                            found_issues=true
                            projects_with_issues+=("$project_name")
                        fi
                        # Get the line number
                        line_num=$(grep -n -F "$line" "$filter_path" | cut -d: -f1 | head -1)
                        echo "     Line $line_num: $line"
                        
                        # Show what it should be (if we can extract the project code)
                        if [[ "$line" =~ ${prefix}(project[0-9]+) ]]; then
                            project_code="${BASH_REMATCH[1]}"
                            corrected_line=$(echo "$line" | sed "s|$prefix$project_code|/$project_code|")
                            echo "        Should be: $corrected_line"
                        fi
                    fi
                done
            done < "$filter_path"
            
            if [ "$found_issues" = true ]; then
                echo
            fi
        fi
    fi
done

# Summary report
echo "============================================================="
echo "=== SUMMARY ==="
echo
if [ ${#projects_with_issues[@]} -eq 0 ]; then
    echo "✓ No issues found. All RSYNC_FILTER files use correct relative paths."
else
    echo "❌ Issues found in ${#projects_with_issues[@]} project(s):"
    printf '%s\n' "${projects_with_issues[@]}" | sort | sed 's/^/   - /'
    echo
    echo "These projects have RSYNC_FILTER entries with full paths that should be relative."
    echo "Full paths like:"
    echo "  + /nesi/nobackup/project1/**"
    echo "  + /scale_wlg_nobackup/filesets/nobackup/project2/**"
    echo
    echo "Should be changed to:"
    echo "  + /project1/**"
    echo "  + /project2/**"
fi
echo "============================================================="

# Optional: Create a CSV report
if [ ${#projects_with_issues[@]} -gt 0 ]; then
    report_file="rsync_filter_issues_$(date +%Y%m%d_%H%M%S).csv"
    echo "Project,File_Path,Line_Number,Problematic_Entry,Suggested_Fix" > "$report_file"
    
    for project_dir in "$BASE_DIR"/*; do
        if [ -d "$project_dir" ]; then
            filter_path="$project_dir/$FILTER_FILE"
            if [ -f "$filter_path" ]; then
                project_name=$(basename "$project_dir")
                line_num=0
                while IFS= read -r line || [ -n "$line" ]; do
                    line_num=$((line_num + 1))
                    [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
                    
                    for prefix in "${PROBLEMATIC_PREFIXES[@]}"; do
                        if [[ "$line" =~ $prefix ]]; then
                            suggested_fix="$line"
                            if [[ "$line" =~ ${prefix}(project[0-9]+) ]]; then
                                project_code="${BASH_REMATCH[1]}"
                                suggested_fix=$(echo "$line" | sed "s|$prefix$project_code|/$project_code|")
                            fi
                            echo "\"$project_name\",\"$filter_path\",$line_num,\"$line\",\"$suggested_fix\"" >> "$report_file"
                        fi
                    done
                done < "$filter_path"
            fi
        fi
    done
    
    echo
    echo "📄 Detailed report saved to: $report_file"
fi
