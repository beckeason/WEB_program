<template>
    <div>
      <!--    功能-->
      <div v-if="user.role===2" style="margin:10px 0">
        <el-button type="primary" @click="add">新增</el-button>
      </div>
      <!--    搜索区域-->
      <div style="margin:10px 0">
        <el-input v-model="search" placeholder="请输入商品名称" style="width: 50%" clearable></el-input>
        <el-button type="primary" style="margin-left:  5px" @click="load">查询</el-button>
      </div>
      <el-table :data="category" border stripe style="width: 100%">
        <el-table-column label="类别ID" prop="cateId"></el-table-column>
        <el-table-column label="类别名称" prop="catename" />
        <el-table-column label="操作">
          <template #default="scope">
            <el-button size="mini" @click="handleEdit(scope.row)"
            >编辑</el-button
            >
            <el-popconfirm title="你确定要删除嘛？" @confirm="handleDelete(scope.row.cateId)">
              <template #reference>
                <el-button
                    size="mini"
                    type="danger"
                >删除</el-button
                >
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
      <div class="demo-pagination-block">
        <!--    以下是显示页面码-->
        <!-- <el-pagination
            v-model:current-page="currentPage"
            :page-sizes="[5, 10, 20, 25]"
            :page-size="10"
            layout="total, sizes, prev, pager, next, jumper"
            :total="total"
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
        >
        </el-pagination> -->
  
  
        <!-- Form -->
  
        <el-dialog v-model="dialogFormVisible" title="添加">
          <el-form :model="form" label-width="120px">
            <el-form-item label="名称" >
              <el-input v-model="form.catename" autocomplete="off" style="width: 80%"></el-input>
            </el-form-item>
          </el-form>
          <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取消</el-button>
          <el-button type="primary" @click="save">确认</el-button>
        </span>
          </template>
        </el-dialog>
      </div>
    </div>
  </template>

<script>
import request from "../../utils/request";
import { UploadFilled } from '@element-plus/icons'

export default {
  name: 'goods' ,
  components:{
    UploadFilled,
  },
  data() {
    return {
      dialogFormVisible:false,
      currentPage :1,
      category:[
      ],
      form:{},
      search: '',
      dialogImageUrl: '',
      user:{},
    }
  },
  created() {
    let str = sessionStorage.getItem("user")
    this.user = JSON.parse(str)
    this.load()
  },
  methods: {
    load(){
      if(this.user.role===3){
        request.get("/category",{
        }).then(res=>{
          console.log(res)
          this.category=res.data
        })
      }else{
        request.get("/category",{
        }).then(res=>{
          console.log(res)
          this.category=res.data
        })
      }
    },
    add(){
      this.dialogFormVisible = true;
      this.form={};
    },
    save(){
      console.log(this.user)
      if(this.form.cateId){
        //update
        console.log(this.form)
        request.put("/category",this.form).then(res =>{
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
          this.dialogFormVisible =false
        })
      }else{
        request.post("/category",this.form).then(res =>{
          console.log(res)
          if(res.code==='0'){
            this.$message({
              type:"success",
              message:"新增成功"
            })
          }else {
            this.$message({
              type:"error",
              message:res.msg
            })
          }
          this.load()
          this.dialogFormVisible=false
        })
      }
    },

    handleEdit(row) {
      this.form=JSON.parse(JSON.stringify(row))
      this.dialogFormVisible=true
      this.$nextTick(()=>{
        this.$refs['upload'].clearFiles()
      })
    },
    handleDelete(id) {
      console.log(id)
      request.delete("/category/"+id).then(res=>{
        if(res.code==='0'){
          this.$message({
            type:"success",
            message:"删除成功"
          })
        }else {
          this.$message({
            type: "error",
            message: res.msg
          })
        }
        this.load()
      })
    },
    
  },
}
</script>