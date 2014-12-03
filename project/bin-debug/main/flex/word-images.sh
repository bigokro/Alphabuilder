#!/bin/bash

previous=''
for f in $( ls ../media/words )
do
	name=`echo $f | sed -r 's/_.*//'`
	index=`echo $f | sed -r 's/.*_([0-9]+)\..*/\1/'`
	extension=`echo $f | sed 's/.*\.//'`
	capname=`echo -n "${name:0:1}" | tr "[:lower:]" "[:upper:]"`
	capname=`echo -n "${capname}${name:1}"`
	
	if [[ $name != $previous ]]
	then
		previous=$name
		echo "public static var ${name}Images:Array = new Array();"
	fi
	echo "[Embed(source=\"../media/words/${f}\")]"
	echo "public static var WordImage${capname}${index}:Class;"
	echo "${name}Images.add(new WordImage${capname}${index}());"
	echo
done