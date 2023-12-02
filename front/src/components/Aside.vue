
<template>
  <div style="background-color:#73767a">
    <el-menu
        style="min-height: calc(100vh - 50px);background-color:#73767a;color: blue;"
        default-active="path"
        router
        class="el-menu-vertical-demo"
        text-color="black"
    >
      <el-menu-item index="customer" v-if="user.role===1 ">
        <el-icon><goods /></el-icon>
        <template #title>商品</template>
      </el-menu-item>
       <el-menu-item index="cart" v-if="user.role===1 ">
        <el-icon><shopping-cart /></el-icon>
        <template #title>购物车</template>
      </el-menu-item> 
      <el-menu-item index="goods" v-if=" user.role===3||user.role===2">
        <el-icon><goods /></el-icon>
        <template #title>商品管理</template>
      </el-menu-item>
      <el-menu-item index="category" v-if=" user.role===3||user.role===2">
        <el-icon><Files /></el-icon>
        <template #title>类别管理</template>
      </el-menu-item>
      <el-menu-item index="order" v-if="user.role===1||user.role===2 ">
        <el-icon><list /></el-icon>
        <template #title>订单</template>
      </el-menu-item>
      <el-menu-item index="user" v-if="user.role===3">
        <el-icon><user-filled /></el-icon>
        <template #title>用户管理</template>
      </el-menu-item>
      <el-menu-item index="log" v-if=" user.role===3||user.role===2">
        <el-icon><timer /></el-icon>
        <template #title>日志记录</template>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script>
import { defineComponent, ref } from 'vue'
import {
    Location,
    Document,
    Menu as IconMenu,
    Setting,
    ShoppingCart,
    Goods,
    List,
    UserFilled,
    Timer,
    More,
    Files



} from '@element-plus/icons'
import request from "../../utils/request";
export default defineComponent({
  components: {
    Location,
    Document,
    Setting,
    IconMenu,
    ShoppingCart,
    Goods,
    List,
    UserFilled,
    Timer,
    More,
    Files
  },
  data(){
    return {
      user:{},
      path:this.$route.path.substr(1),
      cate:[
        {

        }
      ],
      tableData: [
      ],
    }
  },
  created() {
    let str = sessionStorage.getItem("user")
    this.user = JSON.parse(str)
    this.load()
  },
  methods: {
  load(){
    request.get("/category",{
      }).then(res=>{
        console.log(res)
        this.tableData=res.data
        this.total=res.data.total
      })
  }
  }
})
</script>

<style>
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}
</style>