#to download all files in range
for ((i=100;i<=750;i++)); do wget https://www.gutenberg.org/files/${i}/${i}-0.txt; done

# batch rename
for i in ./*.txt ; do mv "$i" "${i/-[0-9.]*.txt/.txt}" ; done

ls -v | cat -n | while read n f; do mv -n "$f" "$n.txt"; done 

#save as json while downloading
yourfilenames='ls *.txt'
for eachfile in $yourfilenames
do
   echo  "{ "id":"${eachfile:0:3}","link": "https://www.gutenberg.org/files/${eachfile:0:3}/${eachfile}" }," >> links.txt
done