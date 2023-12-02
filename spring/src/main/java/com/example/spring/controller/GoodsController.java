package com.example.spring.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.spring.common.Result;
import com.example.spring.entity.Goods;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

import com.example.spring.mapper.GoodsMapper;




@RestController
@RequestMapping("/goods")
public class GoodsController {

    @Resource
    GoodsMapper goodsMapper;

    @PostMapping
    public Result<?> save(@RequestBody Goods goods) {
        goodsMapper.insert(goods);
        return Result.success();
    }

    @PutMapping
    public Result<?> update(@RequestBody Goods goods) {
        goodsMapper.updateById(goods);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Integer id) {
        goodsMapper.deleteById(id);
        return Result.success();
    }

    @PostMapping("/deleteBatch")
    public Result<?> deleteBatch(@RequestBody List<Integer> ids) {
        goodsMapper.deleteBatchIds(ids);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> getById(@PathVariable Integer id) {
        return Result.success(goodsMapper.selectById(id));
    }
    @GetMapping("/type")
    public Result<?>findtype(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize,
                             @RequestParam Integer cateid)
    {
        return Result.success( goodsMapper.selectPage(new Page<>(pageNum,pageSize),Wrappers.<Goods>lambdaQuery().eq(Goods::getCateId, cateid).eq(Goods::getState,1)));
    }



    @GetMapping
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "10") Integer pageSize,
                              @RequestParam(defaultValue = "") String search ){
        return Result.success(goodsMapper.selectPage(new Page<>(pageNum,pageSize), Wrappers.<Goods>lambdaQuery().like(Goods::getName, search).eq(Goods::getState,1)));
    }

    @GetMapping("/getStore")
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "10") Integer pageSize,
                              @RequestParam(defaultValue = "") String search ,
                              @RequestParam Integer id){
        return Result.success(goodsMapper.selectPage(new Page<>(pageNum,pageSize), Wrappers.<Goods>lambdaQuery().like(Goods::getName, search).eq(Goods::getStoreId,id)));
    }

}
