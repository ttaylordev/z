#!/usr/bin/env bash

mkdir Search
cd Search
wget -U msie -rl 1 -e robots=off -d http://www.google.com http://www.google.com/search?q=`cat`&num=2
