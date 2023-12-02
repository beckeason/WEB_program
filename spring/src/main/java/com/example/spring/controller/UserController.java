package com.example.spring.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.spring.common.Result;
import com.example.spring.entity.Goods;
import com.example.spring.entity.User;
import com.example.spring.mapper.UserMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigDecimal;

@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    UserMapper userMapper;

    @PostMapping("/login")
    public Result<?> login(@RequestBody User user) {
        User res = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getUsername, user.getUsername()).eq(User::getPassword, user.getPassword()));
        if(res==null){
            return Result.error("-1","用户名或密码错误");
        }
        return Result.success(res);
    }

    @PostMapping("/register")
    public Result<?> register(@RequestBody User user) {
        User res = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getUsername, user.getUsername()));
        if(res!=null){
            return Result.error("-1","用户名重复！");
        }
        if(user.getPassword()==null){
            return Result.error("-1","密码不能为空！");
        }
        userMapper.insert(user);
        return Result.success();
    }


    @PostMapping
    public Result<?> save(@RequestBody User user){
        /*if(user.getPassword()==null){
            user.setPassword("123456");
        }*/
        userMapper.insert(user);
        return Result.success();
    }
    @PutMapping
    public Result<?> update(@RequestBody User user){
        userMapper.updateById(user);
        System.out.println("已更新");
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id){
        userMapper.deleteById(id);
        return Result.success();
    }

    @GetMapping
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize,@RequestParam(defaultValue = "") String search ){
        return Result.success(userMapper.selectPage(new Page<>(pageNum,pageSize), Wrappers.<User>lambdaQuery().like(User::getUsername, search)));
    }

    @GetMapping("/getCustomer")
    public Result<?> getCustomer(@RequestParam Integer id){
        User res = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getId,id));
        return Result.success(res);
    }
    @PutMapping("/chongzhi")
    public Result<?> chongzhi(@RequestBody User user,@RequestParam Integer money)
    {
        System.out.println(money);
       User user1=userMapper.selectById(user.getId());
        System.out.println("开始余额"+user1.getAccount());
        user1.setAccount(user1.getAccount().add(new BigDecimal(money+"")));
        userMapper.updateById(user1);
        System.out.println("充值余额"+user1.getAccount());
        System.out.println("余额已更新");
        return Result.success();
    }
}
