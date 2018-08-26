#!/bin/bash
# number of days since start of year, zero indexed
# january 1st is "0"
dayofyear=$(printf "%d\n" $(($(date +%j)-1)))
# returns .5000 for noon
# fractionofday=$(echo $(date +%k) / 24 + $(date +%M) / 1440 + $(date +%S) / 86400 | bc -l | cut -c1-5 | sed 's/^1*//') # sed strips the leading 1, just in case

# returns 5000 for noon
fractionofday=$(echo $(date +%k) / 24 + $(date +%M) / 1440 + $(date +%S) / 86400 | bc -l | cut -c1-5 | sed 's/^1\.*//') # sed strips the leading 1 and decimal and replaces , just in case

echo $dayofyear$fractionofday


