#!/bin/bash

end_hour=17
end_minute=0

current_hour=$(date +%H)
current_minute=$(date +%M)

current_total_minutes=$((current_hour * 60 + current_minute))
end_total_minutes=$((end_hour * 60 + end_minute))

remaining_minutes=$((end_total_minutes - current_total_minutes))

if [ "$remaining_minutes" -le 0 ]; then
    echo "Current time: $(date +%H:%M). Work day has ended."
else
    hour_left=$((remaining_minutes / 60))
    minutes_left=$((remaining_minutes % 60))
    echo "Current time: $(date +%H:%M). Work day ends after $hour_left hours and $minutes_left minutes."
fi
