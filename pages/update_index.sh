#!/bin/bash

echo """
*******************
This Program is used when you add a new page here, 
and you want a new Entry for it in index.html
*******************
"""
OUTPUT=index.html
if [ -f $OUTPUT ]
then
    echo  rm old index.html
    rm $OUTPUT
fi

echo """

<head>
<link rel="stylesheet" type="text/css" href="../css/peter.css" />
<title>PIKI</title>
</head>
<a  href="http://happypeter.github.com/piki/index.html">Go to Site Home</a>

<br><center><h1>Index</h1></center>

""">$OUTPUT
for file in `ls|grep md|sort`
do
    echo -n '<a href="' >>$OUTPUT
    echo -n $file|awk -F"." '{print $1}' >>$OUTPUT
    echo -n '.html' >>$OUTPUT
    echo '">' >>$OUTPUT
    title=`cat $file|grep "title:"|awk -F":" '{print $2}'`
    echo -n $title >>$OUTPUT
    echo '</a>' >>$OUTPUT
    echo '<br>'>>$OUTPUT

done
