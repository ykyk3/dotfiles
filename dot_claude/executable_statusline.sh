#!/bin/bash
# Claude Code statusline script
# Displays: Model, Git branch, Cost, Context usage

input=$(cat)

# Extract values using jq
MODEL=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
CONTEXT_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')
USAGE=$(echo "$input" | jq '.context_window.current_usage // null')

# Format cost
if command -v bc &> /dev/null; then
    COST_FORMATTED=$(printf "%.4f" "$COST")
else
    COST_FORMATTED="$COST"
fi

# Calculate context usage percentage
if [ "$USAGE" != "null" ]; then
    INPUT_TOKENS=$(echo "$USAGE" | jq -r '.input_tokens // 0')
    CACHE_CREATION=$(echo "$USAGE" | jq -r '.cache_creation_input_tokens // 0')
    CACHE_READ=$(echo "$USAGE" | jq -r '.cache_read_input_tokens // 0')
    CURRENT_TOKENS=$((INPUT_TOKENS + CACHE_CREATION + CACHE_READ))
    PERCENT_USED=$((CURRENT_TOKENS * 100 / CONTEXT_SIZE))
else
    PERCENT_USED=0
fi

# Get git branch
GIT_BRANCH=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null)
    if [ -n "$BRANCH" ]; then
        GIT_BRANCH=" $BRANCH"
    fi
fi

# Output statusline
echo "[$MODEL]$GIT_BRANCH | \$$COST_FORMATTED | ctx:${PERCENT_USED}%"
