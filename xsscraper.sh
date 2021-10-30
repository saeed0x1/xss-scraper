#!/bin/bash

# run this script after installing the required tools
# tools : waybackurls, kxss, dalfox
# wordlists : already provided
# Usage : ./xss-scrape.sh site.com

echo "[+] scraping $1 from waybackmachine"

echo "$1" | waybackurls > $1-waybackurls.txt


echo "[+] Filtering Urls"

while read FILE1;do
    grep -aiE $FILE1 $1-waybackurls.txt > $1-filtered.txt;
    done < filter-1.txt

echo "[+] Finding XSS"

ACTION=$(sort -u | kxss | awk '{print $2}' | dalfox pipe --custom-payload xss-payload-list.txt --mining-dict params.txt --skip-bav -w 200 --timeout 5)

while read FILE2;do
    grep -viE $FILE2 $1-filtered.txt;
    done < filter-2.txt | $ACTION
    
    
   
