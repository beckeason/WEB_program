package com.example.spring.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.spring.common.Result;
import com.example.spring.entity.Goods;
import com.example.spring.entity.Cart;
import com.example.spring.mapper.GoodsMapper;
import com.example.spring.mapper.CartMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;

@RestController
    @RequestMapping("/Cart")
public class CartController {


    @Resource
    CartMapper CartMapper;
    @Resource
    GoodsMapper GoodsMapper;

    @PostMapping
    public Result<?> save(@RequestBody Cart cart) {
        Cart res= CartMapper.selectOne(Wrappers.<Cart>lambdaQuery().eq(Cart::getUserId,cart.getUserId()).eq(Cart::getStorageId,cart.getStorageId()));

        if(res!=null){
            cart.setNum(cart.getNum()+res.getNum());
            UpdateWrapper<Cart> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("user_id",cart.getUserId());
            updateWrapper.eq("storage_id",cart.getStorageId());
            CartMapper.update(cart,updateWrapper);
        }else {
            CartMapper.insert(cart);
        }
        return Result.success();
    }

    @PutMapping
    public Result<?> update(@RequestBody Cart cart) {
        UpdateWrapper<Cart> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("user_id",cart.getUserId());
        updateWrapper.eq("storage_id",cart.getStorageId());
        CartMapper.update(cart,updateWrapper);
        return Result.success();
    }

    @PostMapping("/deleteEntity")
    public Result<?> deleteEntity(@RequestBody Cart cart) {
        System.out.println("删除以下记录：");
        System.out.println(cart);
        QueryWrapper<Cart> wrapper= new QueryWrapper<>(cart);
        CartMapper.delete(wrapper);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Integer id) {
        CartMapper.deleteById(id);
        return Result.success();
    }

    @PostMapping("/deleteBatch")
    public Result<?> deleteBatch(@RequestBody List<Integer> ids) {
        CartMapper.deleteBatchIds(ids);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> getById(@PathVariable Integer id) {
        return Result.success(CartMapper.selectById(id));
    }

    @GetMapping
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize,@RequestParam(defaultValue = "") String search,@RequestParam Integer id){
//        Page<Storage> storagePage = StorageMapper.selectPage(new Page<>(1,100), Wrappers.<Storage>lambdaQuery().like(Storage::getName, search));
        Page<Cart> UserStoragePage = CartMapper.selectPage(new Page<>(pageNum, pageSize), Wrappers.<Cart>lambdaQuery().eq(Cart::getUserId, id));
        List<Cart> USlist=UserStoragePage.getRecords();
        List<Goods> Slist=new LinkedList<Goods>();
        for(int i=0;i<USlist.size();i++){
            Goods s;
            s=GoodsMapper.selectById(USlist.get(i).getStorageId());
            s.setNum(USlist.get(i).getNum());
            s.setCustomerId(USlist.get(i).getUserId());
            Slist.add(s);
        }
        Page<Goods> storagePage=new Page<>(pageNum, pageSize);
        storagePage.setRecords(Slist);
        return Result.success(storagePage);
    }
}
