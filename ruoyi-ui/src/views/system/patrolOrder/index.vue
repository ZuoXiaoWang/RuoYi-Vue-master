<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="巡更点编号" prop="patrolPointId">
        <el-input
          v-model="queryParams.patrolPointId"
          placeholder="请输入巡更点编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="巡更点名称" prop="patrolPointName">
        <el-input
          v-model="queryParams.patrolPointName"
          placeholder="请输入巡更点名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="巡更任务编号" prop="patrolId">
        <el-input
          v-model="queryParams.patrolId"
          placeholder="请输入巡更任务编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="巡更任务名称" prop="patrolName">
        <el-input
          v-model="queryParams.patrolName"
          placeholder="请输入巡更任务名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="巡更人编号" prop="personnelId">
        <el-input
          v-model="queryParams.personnelId"
          placeholder="请输入巡更人编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="巡更人姓名" prop="personnelName">
        <el-input
          v-model="queryParams.personnelName"
          placeholder="请输入巡更人姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="巡更结果" prop="patrolResult">
        <el-input
          v-model="queryParams.patrolResult"
          placeholder="请输入巡更结果"
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
          v-hasPermi="['system:patrolOrder:add']"
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
          v-hasPermi="['system:patrolOrder:edit']"
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
          v-hasPermi="['system:patrolOrder:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:patrolOrder:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="patrolOrderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="巡更工单编号" align="center" prop="patrolOrderId" />
      <el-table-column label="巡更点编号" align="center" prop="patrolPointId" />
      <el-table-column label="巡更点名称" align="center" prop="patrolPointName" />
      <el-table-column label="巡更任务编号" align="center" prop="patrolId" />
      <el-table-column label="巡更任务名称" align="center" prop="patrolName" />
      <el-table-column label="巡更人编号" align="center" prop="personnelId" />
      <el-table-column label="巡更人姓名" align="center" prop="personnelName" />
      <el-table-column label="巡更结果" align="center" prop="patrolResult">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_patrol_result" :value="scope.row.patrolResult"/>
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
            v-hasPermi="['system:patrolOrder:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:patrolOrder:remove']"
          >删除</el-button>
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

    <!-- 添加或修改巡更工单管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="巡更点编号" prop="patrolPointId">
          <el-input v-model="form.patrolPointId" placeholder="请输入巡更点编号" />
        </el-form-item>
        <el-form-item label="巡更点名称" prop="patrolPointName">
          <el-input v-model="form.patrolPointName" placeholder="请输入巡更点名称" />
        </el-form-item>
        <el-form-item label="巡更任务编号" prop="patrolId">
          <el-input v-model="form.patrolId" placeholder="请输入巡更任务编号" />
        </el-form-item>
        <el-form-item label="巡更任务名称" prop="patrolName">
          <el-input v-model="form.patrolName" placeholder="请输入巡更任务名称" />
        </el-form-item>
        <el-form-item label="巡更人编号" prop="personnelId">
          <el-input v-model="form.personnelId" placeholder="请输入巡更人编号" />
        </el-form-item>
        <el-form-item label="巡更人姓名" prop="personnelName">
          <el-input v-model="form.personnelName" placeholder="请输入巡更人姓名" />
        </el-form-item>
        <el-form-item label="巡更结果" prop="patrolResult">
          <el-input v-model="form.patrolResult" placeholder="请输入巡更结果" />
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
import { listPatrolOrder, getPatrolOrder, delPatrolOrder, addPatrolOrder, updatePatrolOrder } from "@/api/system/patrolOrder";

export default {
  name: "PatrolOrder",
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
      // 巡更工单管理表格数据
      patrolOrderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        patrolPointId: null,
        patrolPointName: null,
        patrolId: null,
        patrolName: null,
        personnelId: null,
        personnelName: null,
        patrolResult: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询巡更工单管理列表 */
    getList() {
      this.loading = true;
      listPatrolOrder(this.queryParams).then(response => {
        this.patrolOrderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        patrolOrderId: null,
        patrolPointId: null,
        patrolPointName: null,
        patrolId: null,
        patrolName: null,
        personnelId: null,
        personnelName: null,
        patrolResult: null,
        remark: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
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
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.patrolOrderId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加巡更工单管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const patrolOrderId = row.patrolOrderId || this.ids
      getPatrolOrder(patrolOrderId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改巡更工单管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.patrolOrderId != null) {
            updatePatrolOrder(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPatrolOrder(this.form).then(response => {
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
      const patrolOrderIds = row.patrolOrderId || this.ids;
      this.$modal.confirm('是否确认删除巡更工单管理编号为"' + patrolOrderIds + '"的数据项？').then(function() {
        return delPatrolOrder(patrolOrderIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/patrolOrder/export', {
        ...this.queryParams
      }, `patrolOrder_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
