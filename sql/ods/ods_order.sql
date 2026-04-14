DROP TABLE IF EXISTS ods_order;
CREATE EXTERNAL TABLE ods_order (
    order_id STRING COMMENT '订单ID',
    user_id STRING COMMENT '用户ID',
    order_amount DECIMAL(10,2) COMMENT '订单金额',
    create_time STRING COMMENT '创建时间',
    order_status INT COMMENT '订单状态'
)
PARTITIONED BY (dt STRING COMMENT '日期分区')
STORED AS ORC
LOCATION '/user/hive/warehouse/ods.db/ods_order'
COMMENT 'ODS层订单原始数据表';
