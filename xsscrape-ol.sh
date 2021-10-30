#!/bin/bash

# Run this script after getting all urls from waybackarchive
# Also install all required tools, waybackurls, kxss, dalfox

while read FILE1;do grep -aiE $FILE1 waybackurls.txt > filtered.txt;done < filter-1.txt; while read FILE2;do grep -viE $FILE2 filtered.txt;done < filter-2.txt | sort -u | kxss | awk '{print $2}' | dalfox pipe --custom-payload xss-payload-list.txt --mining-dict params.txt --skip-bav -S
