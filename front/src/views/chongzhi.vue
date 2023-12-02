<template>
  <el-card class="box-card">
    <ul class="msg-box">
      <li>
        <h4>我要充值</h4>
      </li>
      <span v-for="index in tableData">
      <li v-if="user_form.id===index.id">当前余额：{{index.account }}</li>
    </span>
      <li>
        <h4 style="margin-bottom: 15px">充值金额</h4>
        <el-radio-group v-model="money" >
          <el-radio border :label="100" value="100">充值100</el-radio>
          <el-radio border :label="500" value="500">充值500</el-radio>
          <el-radio border :label="1000" value="1000">充值1000</el-radio>
          <el-radio border :label="2000" value="2000">充值2000</el-radio>
          <el-radio border :label="5000" value="5000">充值5000</el-radio>
          <el-radio border :label="0" value="">自定义</el-radio>
        </el-radio-group>
      </li>

      <li>
        <h4 style="margin-bottom: 15px">充值金额</h4>
        <el-input
          :disabled="disabled"
          clearable
          v-model="money"
          placeholder="请输入金额"
          style="width: 150px"
        ></el-input>
      </li>
    </ul>
    <div style="text-align: center; margin-top: 30px">
      <el-button type="primary" @click="onSubmit">确认支付</el-button>
      <el-button type="info" @click="$router.push('/customer')">取消</el-button>
    </div>
  </el-card>
</template> 
<!-- <template>
  <ul>
  <li>
        <h4>我要充值</h4>
      </li>
      <li>
<el-form ref="form" :rules="rules" :model="user_form" label-width="80px">
  <el-form-item label="充值金额">
    <el-select v-model="amountVal" placeholder="请选择充值金额">
      <el-option label="50元" value="50"></el-option>
      <el-option label="100元" value="100"></el-option>
    </el-select>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" @click="onSubmit">充值</el-button>
    <el-button type="info" @click="$router.push('/customer')">取消</el-button>
  </el-form-item>
</el-form>
</li>
</ul>
</template> -->
<script>
import { runInThisContext } from "vm";
import request from "../../utils/request";

  export default {
    name:"chongzhi",
    data() {
      return {
        user_form:{
        },
        tableData:[],
        money:""
      }
    },
    created() {
    let str = sessionStorage.getItem("user") || "{}"
    this.user_form = JSON.parse(str)
    this.money=""
    this.load()
  },
    methods: {
      load(){
      request.get("/user",{

      }).then(res=>{
        console.log(res)
        this.tableData=res.data.records
        this.total=res.data.total

      })
    },
      onSubmit() {
      this.user_form.account+=this.money;
        console.log(this.user_form);
      request.put("/user/chongzhi",this.user_form,{params: {
        money:this.money
        }
        }).then(res =>{
        console.log(res)
        if(res.code==='0'){
          this.$message({
            type:"success",
            message:"更新成功"
          })
        }else {
          this.$message({
            type:"error",
            message:res.msg
          })
        }
        this.load()
      })
      },

     
    }
  }

</script> 

 
<style scoped>
	/* 信息列表样式 */
	.msg-box > li {
		list-style: none;
		border-bottom: 1px solid #c5c5c5;
		padding: 20px 10px;
	}
</style>