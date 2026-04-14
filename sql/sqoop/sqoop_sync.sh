#!/bin/bash

dt=$1
last_time=$2

sqoop import \
--connect jdbc:mysql://node1:3306/ecommerce \
--username root \
--password 123456 \
--table order_info \
--hive-table ods_order \
--hive-partition-key dt \
--hive-partition-value ${dt} \
--hive-import \
--incremental lastmodified \
--check-column create_time \
--last-value ${last_time} \
--fields-terminated-by ','
