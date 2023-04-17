<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="110px">
      <el-form-item label="维修任务名称" prop="repairName">
        <el-input
          v-model="queryParams.repairName"
          placeholder="请输入维修任务名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="维修任务负责人" prop="repairPrincipal">
        <el-input
          v-model="queryParams.repairPrincipal"
          placeholder="请输入维修任务负责人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="负责人联系方式" prop="repairPhone">
        <el-input
          v-model="queryParams.repairPhone"
          placeholder="请输入负责人联系方式"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="维修任务状态" prop="repairStatus">
        <el-select v-model="queryParams.repairStatus" placeholder="请选择维修任务状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_patrol_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="计划开始时间" prop="repairStartTime">
        <el-date-picker clearable
                        v-model="queryParams.repairStartTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择计划开始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="实际开始时间" prop="repairActualStartTime">
        <el-date-picker clearable
                        v-model="queryParams.repairActualStartTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择实际开始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="实际结束时间" prop="repairActualEndTime">
        <el-date-picker clearable
                        v-model="queryParams.repairActualEndTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择实际结束时间">
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
          v-hasPermi="['system:repair:add']"
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
          v-hasPermi="['system:repair:edit']"
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
          v-hasPermi="['system:repair:remove']"
        >删除
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="repairList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="维修任务编号" align="center" prop="repairId"/>
      <el-table-column label="维修任务名称" align="center" prop="repairName"/>
      <el-table-column label="维修任务描述" align="center" prop="repairDescribe"/>
      <el-table-column label="维修任务负责人" align="center" prop="repairPrincipal"/>
      <el-table-column label="负责人联系方式" align="center" prop="repairPhone"/>
      <el-table-column label="维修任务状态" align="center" prop="repairStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_patrol_status" :value="scope.row.repairStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="计划开始时间" align="center" prop="repairStartTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.repairStartTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="实际开始时间" align="center" prop="repairActualStartTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.repairActualStartTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="实际结束时间" align="center" prop="repairActualEndTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.repairActualEndTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:repair:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:repair:remove']"
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

    <!-- 添加或修改维修任务对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="110px">
        <el-form-item label="维修任务名称" prop="repairName">
          <el-input v-model="form.repairName" placeholder="请输入维修任务名称"/>
        </el-form-item>
        <el-form-item label="维修任务描述" prop="repairDescribe">
          <el-input v-model="form.repairDescribe" type="textarea" placeholder="请输入内容"/>
        </el-form-item>
        <el-form-item label="维修任务负责人" prop="repairPrincipal">
          <el-select v-model="form.repairPrincipal" placeholder="请输入维修任务负责人">
            <el-option
              v-for="item in personnelOptions"
              :key="item.personnelId"
              :label="item.personnelName"
              :value="item.personnelName"
              :disabled="item.status == 1"
              form.
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="负责人联系方式" prop="repairPhone">
          <el-input v-model="form.repairPhone" placeholder="请输入负责人联系方式"/>
        </el-form-item>
        <el-form-item label="维修任务状态" prop="repairStatus">
          <el-radio-group v-model="form.repairStatus">
            <el-radio
              v-for="dict in dict.type.sys_patrol_status"
              :key="dict.value"
              :label="dict.value"
            >{{ dict.label }}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="维修人员" prop="PersonnelId">
          <el-select v-model="form.personnelIds" multiple placeholder="请选择维修人员">
            <el-option
              v-for="item in personnelOptions"
              :key="item.personnelId"
              :label="item.personnelName"
              :value="item.personnelId"
              :disabled="item.status == 1"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="点位" prop="PatrolPointId">
          <el-select v-model="form.patrolPointIds" multiple placeholder="请选择点位">
            <el-option
              v-for="item in patrolPointOptions"
              :key="item.patrolPointId"
              :label="item.patrolPointName"
              :value="item.patrolPointId"
              :disabled="item.status == 1"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="计划开始时间" prop="repairStartTime">
          <el-date-picker clearable
                          v-model="form.repairStartTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择计划开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="实际开始时间" prop="repairActualStartTime">
          <el-date-picker clearable
                          v-model="form.repairActualStartTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择实际开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="实际结束时间" prop="repairActualEndTime">
          <el-date-picker clearable
                          v-model="form.repairActualEndTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择实际结束时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"/>
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
import {listRepair, getRepair, delRepair, addRepair, updateRepair} from "@/api/system/repair";

export default {
  name: "Repair",
  dicts: ['sys_patrol_status'],
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
      // 维修任务表格数据
      repairList: [],
      // 员工选项
      personnelOptions: [],
      // 点位选项
      patrolPointOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        repairName: null,
        repairDescribe: null,
        repairPrincipal: null,
        repairPhone: null,
        repairStatus: null,
        repairStartTime: null,
        repairActualStartTime: null,
        repairActualEndTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        repairPrincipal: [
          {required: true, message: "巡更负责人不能为空", trigger: "change"}
        ],
        repairName: [
          { required: true, message: "维修任务名称不能为空", trigger: "blur" }
        ],
        repairStatus: [
          { required: true, message: "巡更任务状态不能为空", trigger: "change" }
        ],
        repairStartTime: [
          { required: true, message: "计划开始时间不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询维修任务列表 */
    getList() {
      this.loading = true;
      listRepair(this.queryParams).then(response => {
        this.repairList = response.rows;
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
        repairId: null,
        repairName: null,
        repairDescribe: null,
        repairPrincipal: null,
        repairPhone: null,
        repairStatus: null,
        repairStartTime: null,
        repairActualStartTime: null,
        repairActualEndTime: null,
        remark: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        personnelIds: [],
        patrolPointIds: []
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
      this.ids = selection.map(item => item.repairId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      getRepair().then(response => {
        this.personnelOptions = response.personnels;
        this.patrolPointOptions = response.patrolPoints;
        this.open = true;
        this.title = "添加维修任务";
      })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const repairId = row.repairId || this.ids
      getRepair(repairId).then(response => {
        this.form = response.data;
        this.personnelOptions = response.personnels;
        this.$set(this.form, "personnelIds", response.personnelIds);
        this.patrolPointOptions = response.patrolPoints;
        this.$set(this.form, "patrolPointIds", response.patrolPointIds);
        this.open = true;
        this.title = "修改维修任务";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.repairId != null) {
            updateRepair(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRepair(this.form).then(response => {
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
      const repairIds = row.repairId || this.ids;
      this.$modal.confirm('是否确认删除维修任务编号为"' + repairIds + '"的数据项？').then(function () {
        return delRepair(repairIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/repair/export', {
        ...this.queryParams
      }, `repair_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
