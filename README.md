# XsScraper

A bash script to find XSS vulnerabilities in web applications. It's a combination of different tools. Like, kxss, dalfox and waybackurls. All these 3 tools are required to run this script.

# Required Installations

Kxss :
````
go get github.com/Emoe/kxss
````
Dalfox :
````
go install github.com/hahwul/dalfox/v2@latest
````
Waybackurls :
````
go get github.com/tomnomnom/waybackurls
````

XsScraper :

````
git clone https://github.com/zerodayrat/XsScraper.git

cd XsScraper
chmod +x *.sh
````
# Run the script

````
./xsscraper.sh site.com
````
<br><br>
Note : `xsscraper-ol.sh` is just an one liner you can run that script after getting all urls from waybackmachine
````shell
while read FILE1;do grep -aiE $FILE1 waybackurls.txt > filtered.txt;done < filter-1.txt; while read FILE2;do grep -viE $FILE2 filtered.txt;done < filter-2.txt | sort -u | kxss | awk '{print $2}' | dalfox pipe --custom-payload xss-payload-list.txt --mining-dict params.txt --skip-bav -S
````
<br>
For any queries ping me on <a href="https://twitter.com/ZeroDayRAT">Twitter</a>
