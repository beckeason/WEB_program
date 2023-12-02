
<template>
  <div style="height:60px;line-height: 60px;background-color:#73767a;border-bottom: 1px solid #73767a;color: blue;display: flex">
    <div
        style="width: 1200px; padding-left:30px;font-weight: bold;color: #e9e9eb; font-size: 50px"
    >DEFF</div>
    <div style="flex: 1"></div>
    <div style="width: 80px;background-color:#73767a;color: blue;">
      <!-- <el-dropdown>
        <span class="el-dropdown-link" >
          设置
          <el-icon><arrow-down-bold /></el-icon>
        </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item @click="$router.push('/person')">个人信息</el-dropdown-item>
            <el-dropdown-item @click="$router.push('/chongzhi')">充值</el-dropdown-item>
            <el-dropdown-item @click="logout">退出系统</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown> -->
      <el-menu
    :default-active="activeIndex"
    class="el-menu-demo"
    mode="horizontal"
    @select="handleSelect"
  >
    <el-menu-item index="1" @click="$router.push('/person')">个人信息</el-menu-item>
    <el-menu-item index="2" @click="$router.push('/chongzhi')">充值</el-menu-item>
    <el-menu-item index="4" @click="logout">退出登录</el-menu-item>
  </el-menu>
    </div>
  </div> 
  
</template>

<script>
import {defineComponent} from "vue";
import {ArrowDownBold} from "@element-plus/icons";

export default defineComponent({
  name:"Header",
  props:['user'],
  data(){
    return{
      activeIndex: '1',
        activeIndex2: '1',
      user:{}
    }
  },
  created() {
    let str = sessionStorage.getItem("user") || "{}"
    this.user= JSON.parse(str)
  },
  components: {
    ArrowDownBold,
  },
  methods:{
    handleClick() {
        alert('button click');
      },
    logout(){
      sessionStorage.setItem("user", JSON.stringify(null))
      this.$router.push('/login')
    }
  }
})
</script>

<style scoped>
   .el-dropdown-link {
    cursor: pointer;
    color: blue;
  }
  .el-icon-arrow-down {
    font-size: 12px;}
</style>