#!/bin/bash

echo "CPU Usage: $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')"
echo "Memory Free: $(free -m | awk 'NR==2{printf "%.2f%%", $4*100/$2 }')"
echo "Memory Usage: $(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')"
echo "Disk Free: $(df -h / | awk 'NR==2{print $4}')"   
echo "Disk Usage: $(df -h / | awk 'NR==2{print $5}')"
echo "Uptime: $(uptime -p)"

echo "Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6   
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

