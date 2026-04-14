DROP TABLE IF EXISTS dwd_order_detail;
CREATE EXTERNAL TABLE dwd_order_detail (
    order_id STRING COMMENT '订单ID',
    user_id STRING COMMENT '用户ID',
    order_amount DECIMAL(10,2) COMMENT '订单金额',
    create_time STRING COMMENT '标准化时间'
)
PARTITIONED BY (dt STRING)
STORED AS ORC
COMMENT 'DWD层订单清洗明细';

INSERT OVERWRITE TABLE dwd_order_detail PARTITION(dt='${dt}')
SELECT
    order_id,
    user_id,
    order_amount,
    from_unixtime(unix_timestamp(create_time, 'yyyy-MM-dd HH:mm:ss'), 'yyyy-MM-dd HH:mm:ss')
FROM ods_order
WHERE dt = '${dt}'
  AND order_id IS NOT NULL
  AND user_id IS NOT NULL
  AND order_amount > 0;
