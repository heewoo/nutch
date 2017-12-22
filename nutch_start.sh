#!/bin/bash
echo "############################################"
echo ">>>>>> NUTCH START"
echo "############################################"

echo ">>> memory clean <<<"
echo 3 > /proc/sys/vm/drop_caches


./runtime/local/bin/nutch inject ./urls/
echo ">>>>>> generate job"
./runtime/local/bin/nutch generate -Depth3 -topN 10
echo ">>>>>>>>> fetch job"
./runtime/local/bin/nutch fetch    -all
echo ">>>>>>>>>>>> parse job"
./runtime/local/bin/nutch parse    -all
echo ">>>>>>>>>>>>>>> updatedb job"
./runtime/local/bin/nutch updatedb -all
echo ">>>>>>>>>>>>>>>>>> index job"
./runtime/local/bin/nutch index    -all
echo ">>>>>>>>>>>>>>>>>>>>> clean job"
./runtime/local/bin/nutch clean    -all



echo "############################################"
echo ">>>>>> NUTCH END"
echo "############################################"

