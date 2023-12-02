package com.example.spring.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@TableName("cart")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    @TableId(type= IdType.AUTO)
    private Integer userId;
    private Integer storageId;
    private Integer num;
}
