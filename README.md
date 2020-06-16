# getMore
This script expands the attack surface by extracting all JS variables used in the website and creates a list of GET URLs with XSS payload. 

# Installation
**Pre-requisites:**
```
go get github.com/003random/getJS

go get -u github.com/tomnomnom/concurl

go get -u github.com/tomnomnom/comb
```
**Main:**
```
git clone https://github.com/rohit-sonii/getMore
```
# Usage
```
chmod +x getMore.sh

echo "https://website_to_check.com" > scanURL

./getMore.sh
```
# Note
Please don't change the name of files. 

# Special Thanks
This simple script uses various pre-built tools of different security researchers and bug bounty hunters.
https://github.com/003random/getJS

https://github.com/tomnomnom/concurl

https://github.com/tomnomnom/comb
