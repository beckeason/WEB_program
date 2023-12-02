package com.example.spring.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@TableName("goods")
@Data
public class Goods {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private Integer storeId;
    private String name;
    private BigDecimal price;
    @TableField("cate_id")
    private Integer cateId;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createTime;
    @TableField(exist = false)
    private Integer customerId;//商家或者顾客
    @TableField(exist = false)
    private Integer num;//购买数量
    private String cover;//封面
    private Integer state;//上架1下架0
    private Integer salesVolume;//总销量
    @TableField(exist = false)
    private Integer ostate;//是否发货
    @TableField(exist = false)
    private Integer orderId;
    @TableField(exist = false)
    private String email;
    @TableField(exist = false)
    private String username;

}
