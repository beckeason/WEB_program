
package com.example.spring.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.spring.common.Result;
import com.example.spring.entity.Category;
import com.example.spring.entity.Goods;
import com.example.spring.entity.Log;
import com.example.spring.mapper.CategoryMapper;
import com.example.spring.mapper.GoodsMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;

@RestController
@RequestMapping("/category")
public class CategoryController {
    @Resource
    CategoryMapper categoryMapper;
    @Resource
    GoodsMapper GoodsMapper;
    @PostMapping
    public Result<?>save(@RequestBody Category category)
    {
        categoryMapper.insert(category);
        return Result.success();
    }
    @PutMapping
    public Result<?> update(@RequestBody Category category)
    {
        categoryMapper.updateById(category);
        return Result.success();
    }
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Integer id) {
        categoryMapper.deleteById(id);
        return Result.success();
    }
    @PostMapping("/deleteBatch")
    public Result<?> deleteBatch(@RequestBody List<Integer> ids) {
        categoryMapper.deleteBatchIds(ids);
        return Result.success();
    }
    @GetMapping("/{id}")
    public Result<?> getById(@PathVariable Integer id) {
        return Result.success(categoryMapper.selectById(id));
    }

    @GetMapping()
    public Result<?> findAll()
    {   List<Category> categories=categoryMapper.selectList(null);
        return Result.success(categories);
    }


}

