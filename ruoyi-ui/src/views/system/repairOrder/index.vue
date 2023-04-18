<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="110px">
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
      <el-form-item label="员工编号" prop="personnelId">
        <el-input
          v-model="queryParams.personnelId"
          placeholder="请输入员工编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="员工姓名" prop="personnelName">
        <el-input
          v-model="queryParams.personnelName"
          placeholder="请输入员工姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="员工联系方式" prop="personnelPhone">
        <el-input
          v-model="queryParams.personnelPhone"
          placeholder="请输入员工联系方式"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="repairOrderStatus">
        <el-select v-model="queryParams.repairOrderStatus" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_repair_order_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="故障原因" prop="causeOfIssue">
        <el-input
          v-model="queryParams.causeOfIssue"
          placeholder="请输入故障原因"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="上报时间" prop="reportingTime">
        <el-date-picker clearable
                        v-model="queryParams.reportingTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择上报时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <!--<el-col :span="1.5">-->
      <!--  <el-button-->
      <!--    type="primary"-->
      <!--    plain-->
      <!--    icon="el-icon-plus"-->
      <!--    size="mini"-->
      <!--    @click="handleAdd"-->
      <!--    v-hasPermi="['system:repairOrder:add']"-->
      <!--  >新增</el-button>-->
      <!--</el-col>-->
      <!--<el-col :span="1.5">-->
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:repairOrder:edit']"
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
          v-hasPermi="['system:repairOrder:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="repairOrderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="报修工单编号" align="center" prop="repairOrderId" />
      <el-table-column label="巡更点编号" align="center" prop="patrolPointId" />
      <el-table-column label="巡更点名称" align="center" prop="patrolPointName" />
      <el-table-column label="员工编号" align="center" prop="personnelId" />
      <el-table-column label="员工姓名" align="center" prop="personnelName" />
      <el-table-column label="员工联系方式" align="center" prop="personnelPhone" />
      <el-table-column label="异常描述" align="center" prop="repairOrderDescribe" />
      <el-table-column label="状态" align="center" prop="repairOrderStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_repair_order_status" :value="scope.row.repairOrderStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="故障原因" align="center" prop="causeOfIssue" />
      <el-table-column label="上报时间" align="center" prop="reportingTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.reportingTime, '{y}-{m}-{d}') }}</span>
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
            v-hasPermi="['system:repairOrder:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:repairOrder:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleDetails(scope.row)"
            v-hasPermi="['system:patrolOrder:edit']"
          >查看</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-document-checked"
            @click="handleCreateRepair(scope.row)"
          >生成维修任务</el-button>
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

    <!-- 添加或修改维修工单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="110px">
        <!--<el-form-item label="巡更点编号" prop="patrolPointId">-->
        <!--  <el-input v-model="form.patrolPointId" placeholder="请输入巡更点编号" />-->
        <!--</el-form-item>-->
        <el-form-item label="巡更点名称" prop="patrolPointName">
          <el-input v-model="form.patrolPointName" placeholder="请输入巡更点名称" />
        </el-form-item>
        <el-form-item label="员工编号" prop="personnelId">
          <el-input v-model="form.personnelId" placeholder="请输入员工编号" />
        </el-form-item>
        <el-form-item label="员工姓名" prop="personnelName">
          <el-input v-model="form.personnelName" placeholder="请输入员工姓名" />
        </el-form-item>
        <el-form-item label="员工联系方式" prop="personnelPhone">
          <el-input v-model="form.personnelPhone" placeholder="请输入员工联系方式" />
        </el-form-item>
        <el-form-item label="异常描述" prop="repairOrderDescribe">
          <el-input v-model="form.repairOrderDescribe" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="状态" prop="repairOrderStatus">
          <el-radio-group v-model="form.repairOrderStatus">
            <el-radio
              v-for="dict in dict.type.sys_repair_order_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="故障原因" prop="causeOfIssue">
          <el-input v-model="form.causeOfIssue" placeholder="请输入故障原因" />
        </el-form-item>
        <el-form-item label="上报时间" prop="reportingTime">
          <el-date-picker clearable
                          v-model="form.reportingTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择上报时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" v-if="title!='查看详情'" @click="submitForm">确 定</el-button>
        <el-button v-if="title!='查看详情'" @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRepairOrder, getRepairOrder, delRepairOrder, addRepairOrder, updateRepairOrder } from "@/api/system/repairOrder";
import {createRepair} from "@/api/system/repairOrder";

export default {
  name: "RepairOrder",
  dicts: ['sys_repair_order_status'],
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
      // 维修工单表格数据
      repairOrderList: [],
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
        personnelId: null,
        personnelName: null,
        personnelPhone: null,
        repairOrderDescribe: null,
        repairOrderStatus: null,
        causeOfIssue: null,
        reportingTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        patrolPointName: [
          { required: true, message: "巡更点名称不能为空", trigger: "blur" }
        ],
        personnelId: [
          { required: true, message: "员工编号不能为空", trigger: "blur" }
        ],
        personnelName: [
          { required: true, message: "员工姓名不能为空", trigger: "blur" }
        ],
        reportingTime: [
          { required: true, message: "上报时间不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询维修工单列表 */
    getList() {
      this.loading = true;
      listRepairOrder(this.queryParams).then(response => {
        this.repairOrderList = response.rows;
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
        repairOrderId: null,
        patrolPointId: null,
        patrolPointName: null,
        personnelId: null,
        personnelName: null,
        personnelPhone: null,
        repairOrderDescribe: null,
        repairOrderStatus: null,
        causeOfIssue: null,
        reportingTime: null,
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
      this.ids = selection.map(item => item.repairOrderId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加维修工单";
    },
    /** 详情 */
    handleDetails(row){
      this.reset();
      const repairOrderId = row.repairOrderId || this.ids
      getRepairOrder(repairOrderId).then(response => {
        this.form = response.data;
        //图片回显
        this.open = true;
        this.title = "查看详情";
      });
    },
    /**
     * 生成维修任务按钮
     */
    handleCreateRepair(row){
      const repairOrderId = row.repairOrderId || this.ids
      createRepair(repairOrderId).then(response => {
        console.log(response.data)
        this.$router.push({
          path: '/repair',
          query:{
            param:response
          }
        })
      })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const repairOrderId = row.repairOrderId || this.ids
      getRepairOrder(repairOrderId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改维修工单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.repairOrderId != null) {
            updateRepairOrder(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRepairOrder(this.form).then(response => {
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
      const repairOrderIds = row.repairOrderId || this.ids;
      this.$modal.confirm('是否确认删除维修工单编号为"' + repairOrderIds + '"的数据项？').then(function() {
        return delRepairOrder(repairOrderIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/repairOrder/export', {
        ...this.queryParams
      }, `repairOrder_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
