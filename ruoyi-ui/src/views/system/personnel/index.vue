<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--部门数据-->
      <el-col :span="4" :xs="24">
        <div class="head-container">
          <el-input
            v-model="deptName"
            placeholder="请输入部门名称"
            clearable
            size="small"
            prefix-icon="el-icon-search"
            style="margin-bottom: 20px"
          />
        </div>
        <div class="head-container">
          <el-tree
            :data="deptOptions"
            :props="defaultProps"
            :expand-on-click-node="false"
            :filter-node-method="filterNode"
            ref="tree"
            node-key="id"
            default-expand-all
            highlight-current
            @node-click="handleNodeClick"
          />
        </div>
      </el-col>
      <!--用户数据-->
      <el-col :span="20" :xs="24">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="岗位" prop="postId">
        <el-select v-model="queryParams.postId" placeholder="请选择岗位">
          <el-option
            v-for="item in postOptions"
            :key="item.postId"
            :label="item.postName"
            :value="item.postId"
            :disabled="item.status == 1"
          ></el-option>
        </el-select>

        <!--<el-input-->
        <!--  v-model="queryParams.postId"-->
        <!--  placeholder="请输入岗位ID"-->
        <!--  clearable-->
        <!--  @keyup.enter.native="handleQuery"-->
        <!--/>-->
      </el-form-item>
      <el-form-item label="用户账号" prop="personnelLoginName">
        <el-input
          v-model="queryParams.personnelLoginName"
          placeholder="请输入用户账号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="员工名字" prop="personnelName">
        <el-input
          v-model="queryParams.personnelName"
          placeholder="请输入员工名字"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号码" prop="personnelPhone">
        <el-input
          v-model="queryParams.personnelPhone"
          placeholder="请输入手机号码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="personnelSex">
        <el-select v-model="queryParams.personnelSex" placeholder="请选择性别" clearable>
          <el-option
            v-for="dict in dict.type.sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="personnelStatus">
        <el-select v-model="queryParams.personnelStatus" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_staff_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="入职时间" prop="personnelEntryTime">
        <el-date-picker clearable
          v-model="queryParams.personnelEntryTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择入职时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="离职时间" prop="personnelResignationTime">
        <el-date-picker clearable
          v-model="queryParams.personnelResignationTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择离职时间">
        </el-date-picker>
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
          v-hasPermi="['system:personnel:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:personnel:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:personnel:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>


    <el-table v-loading="loading" :data="personnelList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="员工ID" align="center" prop="personnelId" />
      <el-table-column label="部门" align="center" prop="dept.deptName" />
      <el-table-column label="岗位" align="center" prop="posts[0].postName" />
      <el-table-column label="用户账号" align="center" prop="personnelLoginName" />
      <!--<el-table-column label="密码" align="center" prop="personnelPassword" />-->
      <el-table-column label="员工名字" align="center" prop="personnelName" />
      <el-table-column label="手机号码" align="center" prop="personnelPhone" />
      <el-table-column label="性别" align="center" prop="personnelSex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.personnelSex"/>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="personnelStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_staff_status" :value="scope.row.personnelStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="入职时间" align="center" prop="personnelEntryTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.personnelEntryTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="离职时间" align="center" prop="personnelResignationTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.personnelResignationTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:personnel:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:personnel:remove']"
          >删除</el-button>
          <el-dropdown size="mini" @command="(command) => handleCommand(command, scope.row)">
            <el-button size="mini" type="text" icon="el-icon-d-arrow-right">更多</el-button>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="handleResetPwd" icon="el-icon-key"
                                v-hasPermi="['system:personnel:resetPwd']">重置密码</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
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
      </el-col>
    </el-row>

    <!-- 添加或修改员工管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="归属部门" prop="deptId">
          <treeselect v-model="form.deptId" :options="deptOptions" :show-count="true" placeholder="请选择归属部门" />
        </el-form-item>
        <el-form-item label="岗位ID" prop="postId">
          <el-select v-model="form.postIds" multiple placeholder="请选择岗位">
            <el-option
              v-for="item in postOptions"
              :key="item.postId"
              :label="item.postName"
              :value="item.postId"
              :disabled="item.status == 1"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item v-if="form.personnelId == undefined" label="用户账号" prop="personnelLoginName">
          <el-input v-model="form.personnelLoginName" placeholder="请输入用户账号" />
        </el-form-item>
        <el-form-item v-if="form.personnelId == undefined" label="密码" prop="personnelPassword">
          <el-input v-model="form.personnelPassword" placeholder="请输入密码" type="password"
          maxlength="20" show-password/>
        </el-form-item>
        <el-form-item label="员工名字" prop="personnelName">
          <el-input v-model="form.personnelName" placeholder="请输入员工名字" />
        </el-form-item>
        <el-form-item label="手机号码" prop="personnelPhone">
          <el-input v-model="form.personnelPhone" placeholder="请输入手机号码" />
        </el-form-item>
        <el-form-item label="性别" prop="personnelSex">
          <el-select v-model="form.personnelSex" placeholder="请选择性别">
            <el-option
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="personnelStatus">
          <el-radio-group v-model="form.personnelStatus">
            <el-radio
              v-for="dict in dict.type.sys_staff_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="入职时间" prop="personnelEntryTime">
          <el-date-picker clearable
            v-model="form.personnelEntryTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择入职时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="离职时间" prop="personnelResignationTime">
          <el-date-picker clearable
            v-model="form.personnelResignationTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择离职时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listPersonnel,
  getPersonnel,
  delPersonnel,
  addPersonnel,
  updatePersonnel,
  resetPersonnelPwd
} from "@/api/system/personnel";
import {deptTreeSelect} from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Personnel",
  dicts: ['sys_staff_status', 'sys_user_sex'],
  components: { Treeselect },
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
      // 员工管理表格数据
      personnelList: [],
      // 部门树选项
      deptOptions: undefined,
      // 部门名称
      deptName: undefined,
      // 岗位选项
      postOptions: [],
      // 默认密码
      initPassword: undefined,
      // 日期范围
      dateRange: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deptId: null,
        postId: null,
        personnelLoginName: null,
        personnelPassword: null,
        personnelName: null,
        personnelPhone: null,
        personnelSex: null,
        personnelStatus: null,
        personnelEntryTime: null,
        personnelResignationTime: null,
      },
      // 表单参数
      form: {},
      defaultProps: {
        children: "children",
        label: "label"
      },
      // 表单校验
      rules: {
        personnelLoginName: [
          { required: true, message: "账号不能为空", trigger: "blur" },
          { min: 2, max: 20, message: '账号长度必须介于 2 和 20 之间', trigger: 'blur' }
        ],
        personnelName: [
          { required: true, message: "用户昵称不能为空", trigger: "blur" }
        ],
        personnelPassword: [
          { required: true, message: "用户密码不能为空", trigger: "blur" },
          { min: 5, max: 20, message: '用户密码长度必须介于 5 和 20 之间', trigger: 'blur' }
        ],
        personnelPhone: [
          {
            required: true,
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ]
      }
    };
  },
  watch: {
    // 根据名称筛选部门树
    deptName(val) {
      this.$refs.tree.filter(val);
    }
  },
  created() {
    this.getList();
    this.getDeptTree();
    this.getConfigKey("sys.user.initPassword").then(response => {
      this.initPassword = response.msg;
    });

  },
  methods: {
    /** 查询员工管理列表 */
    getList() {
      this.loading = true;
      listPersonnel(this.queryParams).then(response => {
        this.personnelList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询部门下拉树结构 */
    getDeptTree() {
      deptTreeSelect().then(response => {
        this.deptOptions = response.data;
        this.postOptions = response.posts;
      });
    },
    // 筛选节点
    filterNode(value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      this.queryParams.deptId = data.id;
      this.handleQuery();
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        personnelId: null,
        deptId: null,
        postId: null,
        personnelLoginName: null,
        personnelPassword: null,
        personnelName: null,
        personnelPhone: null,
        personnelSex: undefined,
        personnelStatus: "0",
        personnelEntryTime: null,
        personnelResignationTime: null,
        remark: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        postIdS: [],
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dataRange = [];
      this.resetForm("queryForm");
      this.queryParams.deptId = undefined;
      this.$refs.tree.setCurrentKey(null);
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.personnelId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    // 更多操作触发
    handleCommand(command, row) {
      switch (command) {
        case "handleResetPwd":
          this.handleResetPwd(row);
          break;
        case "handleAuthRole":
          this.handleAuthRole(row);
          break;
        default:
          break;
      }
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      getPersonnel().then(response => {
        this.postOptions = response.posts;
        this.open = true;
        this.title = "添加员工";
        this.form.personnelPassword = this.initPassword;
      })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const personnelId = row.personnelId || this.ids
      getPersonnel(personnelId).then(response => {
        this.form = response.data;
        this.postOptions = response.posts;
        this.$set(this.form, "postIds", response.postIds);
        this.open = true;
        this.title = "修改员工";
        this.form.personnelPassword = "";
      });
    },
    /** 重置密码按钮操作 */
    handleResetPwd(row) {
      this.$prompt('请输入"' + row.personnelLoginName + '"的新密码', "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        closeOnClickModal: false,
        inputPattern: /^.{5,20}$/,
        inputErrorMessage: "用户密码长度必须介于 5 和 20 之间"
      }).then(({ value }) => {
        resetPersonnelPwd(row.personnelId, value).then(response => {
          this.$modal.msgSuccess("修改成功，新密码是：" + value);
        });
      }).catch(() => {});
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.personnelId != null) {
            updatePersonnel(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPersonnel(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const personnelIds = row.personnelId || this.ids;
      this.$modal.confirm('是否确认删除员工管理编号为"' + personnelIds + '"的数据项？').then(function() {
        return delPersonnel(personnelIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/personnel/export', {
        ...this.queryParams
      }, `personnel_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
