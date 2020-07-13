#!/bin/bash
echo "======================"
echo "CPU USAGE"
echo "======================"
top -bn1 | grep load

echo "======================"
echo "MEMORY USAGE"
echo "======================"

free -h


echo "====================="
echo "DISK USAGE"
echo "====================="

df -hT

echo "====================="
echo "NETWORK USAGE"
echo "====================="

ifstat -t 1 5
