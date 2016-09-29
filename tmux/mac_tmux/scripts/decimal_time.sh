#!/bin/bash
# number of days since start of year
dayofyear=$(date +%j | sed 's/^0*//') # sed strips the leading 0
# returns .5000 for noon
fractionofday=$(echo $(date +%k) / 24 + $(date +%M) / 1440 + $(date +%S) / 86400 | bc -l | cut -c1-5 | sed 's/^1*//') # sed strips the leading 1, just in case

echo $dayofyear$fractionofday


