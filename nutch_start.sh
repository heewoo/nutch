#!/bin/bash
echo "############################################"
echo ">>>>>> NUTCH START"
echo "############################################"

echo ">>> memory clean <<<"
echo 3 > /proc/sys/vm/drop_caches


./nutch/runtime/local/bin/nutch inject ./nutchurls/
echo ">>>>>> generate job"
./nutch/runtime/local/bin/nutch generate -Depth3 -topN 10
echo ">>>>>>>>> fetch job"
./nutch/runtime/local/bin/nutch fetch    -all
echo ">>>>>>>>>>>> parse job"
./nutch/runtime/local/bin/nutch parse    -all
echo ">>>>>>>>>>>>>>> updatedb job"
./nutch/runtime/local/bin/nutch updatedb -all
echo ">>>>>>>>>>>>>>>>>> index job"
./nutch/runtime/local/bin/nutch index    -all
echo ">>>>>>>>>>>>>>>>>>>>> clean job"
./nutch/runtime/local/bin/nutch clean    -all



echo "############################################"
echo ">>>>>> NUTCH END"
echo "############################################"

