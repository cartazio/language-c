#!/bin/bash
source ./configuration

BASE_DIR=`pwd`
cd gcc.dg
DG_DIR=`pwd`

for cf in `find . -name '*.c'`; do
	cd $DG_DIR/`dirname $cf`
	f=`basename $cf`
        echo "Processing $f"
	grep -e "^$f" $BASE_DIR/dg-ignore.txt
	if [ $? -eq 0 ]; then echo " ... skipped"; continue; fi

	COMPLIANCE=
	gcc -fsyntax-only -ansi -pedantic-errors  $f 2>/dev/null
	if [ $? -eq 0 ] ; then COMPLIANCE=c89; fi
	if [ -z $COMPLIANCE ] ; then
		gcc -fsyntax-only -std=c99 -pedantic-errors  $f 2>/dev/null
		if [ $? -eq 0 ] ; then COMPLIANCE=c99; fi
	fi
	if [ -z $COMPLIANCE ] ; then
		gcc -fsyntax-only -std=gnu9x -pedantic-errors  $f 2>/dev/null
		if [ $? -eq 0 ] ; then COMPLIANCE=gnu99; fi
	fi
	if [ -z $COMPLIANCE ] ; then
		gcc -fsyntax-only -std=c11 -pedantic-errors  $f 2>/dev/null
		if [ $? -eq 0 ] ; then COMPLIANCE=c11; fi
	fi
	if [ -z $COMPLIANCE ] ; then
		gcc -fsyntax-only -std=gnu11 -pedantic-errors  $f 2>/dev/null
		if [ $? -eq 0 ] ; then COMPLIANCE=gnu11; fi
	fi
	if [ -z $COMPLIANCE ] ; then
		gcc -fsyntax-only -std=gnu9x $f 2>/dev/null
		if [ $? -eq 0 ] ; then COMPLIANCE=incompliant; fi
	fi
	if [ ! -z $COMPLIANCE ] ; then
	    echo "[INFO] Classified Test $f as ($COMPLIANCE)"
            mkdir -p "$BASE_DIR/gcc-dg-$COMPLIANCE"
            cp "$DG_DIR/$cf" "$BASE_DIR/gcc-dg-$COMPLIANCE/./"
	fi
done
