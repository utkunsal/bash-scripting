#!/bin/bash

logfile=log/sample.log

total=$(cat $logfile | wc -l)
echo "Total number of log entries: $total"

successful_requests=$(grep " 200$" $logfile | wc -l)
echo "Number of successful requests: $successful_requests"

echo "Top three IP addresses with the highest number of requests:"
grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}" $logfile | sort | uniq -c | sort -nr | head -3
