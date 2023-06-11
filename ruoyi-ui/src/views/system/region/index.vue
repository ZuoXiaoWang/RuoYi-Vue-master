<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="区域名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入区域名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="描述" prop="description">
        <el-input
          v-model="queryParams.description"
          placeholder="请输入描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:region:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:region:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:region:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:region:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="regionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="区域划分id" align="center" prop="regionId"/>
      <el-table-column label="区域名称" align="center" prop="name"/>
      <el-table-column label="描述" align="center" prop="description"/>
      <el-table-column label="上级区域id" align="center" prop="parentId"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-add"
            @click="editRegionWithUser(scope.row)"
            v-hasPermi="['system:region:add']"
          >添加许可管理员
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:region:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:region:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改区域管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="区域名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入区域名称"/>
        </el-form-item>
        <el-form-item label="描述" prop="description">
          <el-input v-model="form.description" placeholder="请输入描述"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


    <!-- 添加或修改区域管理对话框 -->
    <el-dialog title="添加许可管理员" :visible.sync="regionUserOpen" width="500px" append-to-body>
      <el-form ref="regionUserFrom" :model="regionUserFrom" :rules="regionUserRules" label-width="80px">
        <el-form-item label="区域名称" prop="name">
          <el-input v-model="regionUserFrom.name" :disabled="true"/>
        </el-form-item>
        <el-form-item label="描述" prop="userIds">
          <el-select v-model="regionUserFrom.userIds" multiple placeholder="请选择用户">
            <el-option
              v-for="item in userOptions"
              :key="item.userId"
              :label="item.nickName"
              :value="item.userId"
              :disabled="item.status == 1"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="regionUserSubmitForm">确 定</el-button>
        <el-button @click="regionUserCancel">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import { listRegion, getRegion, delRegion, addRegion, updateRegion, addRegionWithUser } from '@/api/system/region'
import { listUser } from '@/api/system/user'

export default {
  name: 'Region',
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 区域管理表格数据
      regionList: [],
      // 用户数据
      userOptions: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      //是否显示添加许可管理员弹出
      regionUserOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        description: null,
        parentId: null
      },
      // 表单参数
      form: {},
      // 许可管理员表单参数
      regionUserFrom: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: '区域名称不能为空', trigger: 'blur' }
        ],
        description: [
          { required: true, message: '描述不能为空', trigger: 'blur' }
        ]
      },
      regionUserRules: {
        name: [
          { required: true, message: '区域名称不能为空', trigger: 'blur' }
        ],
        description: [
          { required: true, message: '描述不能为空', trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    this.getList()
    this.getUser()
  },
  methods: {
    /** 查询区域管理列表 */
    getList() {
      this.loading = true
      listRegion(this.queryParams).then(response => {
        this.regionList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        regionId: null,
        name: null,
        description: null,
        parentId: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      }
      this.resetForm('form')
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm('queryForm')
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.regionId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = '添加区域管理'
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const regionId = row.regionId || this.ids
      getRegion(regionId).then(response => {
        this.form = response.data
        this.open = true
        this.title = '修改区域管理'
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          if (this.form.regionId != null) {
            updateRegion(this.form).then(response => {
              this.$modal.msgSuccess('修改成功')
              this.open = false
              this.getList()
            })
          } else {
            addRegion(this.form).then(response => {
              this.$modal.msgSuccess('新增成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const regionIds = row.regionId || this.ids
      this.$modal.confirm('是否确认删除区域管理编号为"' + regionIds + '"的数据项？').then(function() {
        return delRegion(regionIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/region/export', {
        ...this.queryParams
      }, `region_${new Date().getTime()}.xlsx`)
    },
    // 修改许可管理员按钮操作
    editRegionWithUser(row) {
      //查询原有许可管理员
      this.regionUserFrom.name = row.name
      this.regionUserFrom.regionId = row.regionId
      this.regionUserOpen = true
    },
    // 添加许可管理员按钮操作
    regionUserSubmitForm(){
      addRegionWithUser(this.regionUserFrom).then(response => {
        this.$modal.msgSuccess('修改成功')
        this.regionUserOpen = false
        this.getList()
      })
    },
    //取消按钮
    regionUserCancel(){
      this.regionUserOpen = false;
    },
    /** 查询用户列表 */
    getUser() {
      listUser().then(response => {
          this.userOptions = response.rows
        }
      )
    }
  }
}
</script>
