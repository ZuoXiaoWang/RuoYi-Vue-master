<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
    >
      <!--<el-form-item label="巡更任务名称" prop="patrolName">-->
      <!--  <el-input-->
      <!--    v-model="queryParams.patrolName"-->
      <!--    placeholder="请输入巡更任务名称"-->
      <!--    clearable-->
      <!--    @keyup.enter.native="handleQuery"-->
      <!--  />-->
      <!--</el-form-item>-->
      <!--<el-form-item label="巡更任务负责人" prop="patrolPrincipal">-->
      <!--  <el-input-->
      <!--    v-model="queryParams.patrolPrincipal"-->
      <!--    placeholder="请输入巡更任务负责人"-->
      <!--    clearable-->
      <!--    @keyup.enter.native="handleQuery"-->
      <!--  />-->
      <!--</el-form-item>-->
      <!--<el-form-item label="负责人联系方式" prop="patrolPhone">-->
      <!--  <el-input-->
      <!--    v-model="queryParams.patrolPhone"-->
      <!--    placeholder="请输入负责人联系方式"-->
      <!--    clearable-->
      <!--    @keyup.enter.native="handleQuery"-->
      <!--  />-->
      <!--</el-form-item>-->
      <el-form-item label="任务状态" prop="patrolStatus">
        <el-select
          v-model="queryParams.patrolStatus"
          placeholder="请选择巡更任务状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.sys_patrol_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="巡更人" prop="PersonnelId">
        <el-select
          v-model="queryParams.personnelId"
          placeholder="请选择巡更人员"
        >
          <el-option
            v-for="item in personnelOptions"
            :key="item.personnelId"
            :label="item.personnelName"
            :value="item.personnelId"
            :disabled="item.status == 1"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="指定日期内任务">
        <el-date-picker
          v-model="timePickerValue"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          @change="dateChange"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="计划开始时间" prop="patrolStartTime">
        <el-date-picker
          clearable
          v-model="queryParams.patrolStartTime"
          type="datetime"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择计划开始时间"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="计划结束时间" prop="patrolEndTime">
        <el-date-picker
          clearable
          v-model="queryParams.patrolEndTime"
          type="datetime"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择计划结束时间"
        >
        </el-date-picker>
      </el-form-item>
      <!--<el-form-item label="任务创建时间" prop="patrolCreateTime">-->
      <!--  <el-date-picker clearable-->
      <!--                  v-model="queryParams.patrolCreateTime"-->
      <!--                  type="date"-->
      <!--                  value-format="yyyy-MM-dd"-->
      <!--                  placeholder="请选择任务创建时间">-->
      <!--  </el-date-picker>-->
      <!--</el-form-item>-->
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
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
          v-hasPermi="['system:patrol:add']"
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
          v-hasPermi="['system:patrol:edit']"
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
          v-hasPermi="['system:patrol:remove']"
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
          v-hasPermi="['system:patrol:export']"
          >导出
        </el-button>
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="patrolList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!--<el-table-column label="巡更任务编号" align="center" prop="patrolId"/>-->
      <el-table-column
        label="巡更任务名称"
        align="center"
        prop="patrolName"
        width="200"
      />
      <el-table-column
        label="巡更任务描述"
        align="center"
        prop="patrolDescribe"
        width="200"
      />
      <!--<el-table-column label="巡更任务负责人" align="center" prop="patrolPrincipal"/>-->
      <!--<el-table-column label="负责人联系方式" align="center" prop="patrolPhone"/>-->
      <el-table-column
        label="巡更任务状态"
        align="center"
        prop="patrolStatus"
        width="100"
      >
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.sys_patrol_status"
            :value="scope.row.patrolStatus"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="计划开始时间"
        align="center"
        prop="patrolStartTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{
            parseTime(scope.row.patrolStartTime, "{y}-{m}-{d} {h}:{i}:{s}")
          }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="计划结束时间"
        align="center"
        prop="patrolEndTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{
            parseTime(scope.row.patrolEndTime, "{y}-{m}-{d} {h}:{i}:{s}")
          }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="任务发布时间"
        align="center"
        prop="patrolCreateTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="实际开始时间"
        align="center"
        prop="patrolActualStartTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{
            parseTime(
              scope.row.patrolActualStartTime,
              "{y}-{m}-{d} {h}:{i}:{s}"
            )
          }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="实际结束时间"
        align="center"
        prop="patrolActualEndTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{
            parseTime(scope.row.patrolActualEndTime, "{y}-{m}-{d} {h}:{i}:{s}")
          }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column
        label="任务更新时间"
        align="center"
        prop="updateTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column> -->
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="seeInfo(scope.row)"
            >查看
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:patrol:edit']"
            >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:patrol:remove']"
            >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 查看详情 -->
    <el-dialog title="巡更点信息" :visible.sync="dialogTableVisible">
      <el-table :data="gridData">
        <el-table-column
          property="patrolPointName"
          align="center"
          label="巡更点名称"
        ></el-table-column>
        <el-table-column align="center" label="巡检状态">
          <template slot-scope="scope">
            <el-tag
              :type="
                scope.row.patrolPatrolPointStatus == 1 ? 'success' : 'warning'
              "
              >{{
                scope.row.patrolPatrolPointStatus == 1 ? "已巡" : "未巡"
              }}</el-tag
            >
          </template>
        </el-table-column>
        <el-table-column
          property="createTime"
          align="center"
          label="巡检时间"
        ></el-table-column>
      </el-table>
    </el-dialog>

    <!-- 添加或修改巡更任务管理对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="500px"
      append-to-body
      :close-on-click-modal="false"
    >
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="巡更任务名称" prop="patrolName">
          <el-input
            v-model="form.patrolName"
            placeholder="请输入巡更任务名称"
          />
        </el-form-item>
        <el-form-item label="巡更任务描述" prop="patrolDescribe">
          <el-input
            v-model="form.patrolDescribe"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <!--<el-form-item label="巡更任务负责人" prop="patrolPrincipal">-->
        <!--  <el-select v-model="form.patrolPrincipal" placeholder="请输入巡更任务负责人">-->
        <!--    <el-option-->
        <!--      v-for="item in personnelOptions"-->
        <!--      :key="item.personnelId"-->
        <!--      :label="item.personnelName"-->
        <!--      :value="item.personnelName"-->
        <!--      :disabled="item.status == 1"-->
        <!--    ></el-option>-->
        <!--  </el-select>-->
        <!--</el-form-item>-->
        <!--<el-form-item label="负责人联系方式" prop="patrolPhone">-->
        <!--  <el-input v-model="form.patrolPhone" placeholder="请输入巡更任务负责人联系方式"/>-->
        <!--</el-form-item>-->
        <!--<el-form-item label="巡更任务状态" prop="patrolStatus">-->
        <!--  <el-radio-group v-model="form.patrolStatus">-->
        <!--    <el-radio-->
        <!--      v-for="dict in dict.type.sys_patrol_status"-->
        <!--      :key="dict.value"-->
        <!--      :label="dict.value"-->
        <!--    >{{ dict.label }}-->
        <!--    </el-radio>-->
        <!--  </el-radio-group>-->
        <!--</el-form-item>-->
        <el-form-item
          label="区域"
          prop="regionId"
          v-if="title == '添加巡更任务管理'"
        >
          <el-select v-model="form.regionId" placeholder="请选择区域" clearable>
            <el-option
              v-for="item in regionList"
              :key="item.regionId"
              :label="item.name"
              :value="item.regionId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="巡更人员" prop="PersonnelId">
          <el-select
            v-model="form.personnelIds"
            multiple
            placeholder="请选择巡更人员"
          >
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
          <el-select
            v-model="form.patrolPointIds"
            multiple
            placeholder="请选择点位"
          >
            <el-option
              v-for="item in patrolPointOptions"
              :key="item.patrolPointId"
              :label="item.patrolPointName"
              :value="item.patrolPointId"
              :disabled="item.status == 1"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="计划开始时间" prop="patrolStartTime">
          <el-date-picker
            clearable
            v-model="form.patrolStartTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择计划开始时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="计划结束时间" prop="patrolEndTime">
          <el-date-picker
            clearable
            v-model="form.patrolEndTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择计划结束时间，不能早于当前时间"
          >
          </el-date-picker>
        </el-form-item>
        <!--<el-form-item label="任务创建时间" prop="patrolCreateTime">-->
        <!--  <el-date-picker clearable-->
        <!--                  v-model="form.patrolCreateTime"-->
        <!--                  type="date"-->
        <!--                  value-format="yyyy-MM-dd"-->
        <!--                  placeholder="请选择任务创建时间">-->
        <!--  </el-date-picker>-->
        <!--</el-form-item>-->
        <el-form-item label="备注" prop="remark">
          <el-input
            v-model="form.remark"
            type="textarea"
            placeholder="请输入内容"
          />
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
  listPatrol,
  getPatrol,
  delPatrol,
  addPatrol,
  updatePatrol,
  getPotinStatusByPatrolId,
} from "@/api/system/patrol";
import {listRegion, listRegionAll} from "@/api/system/region";
import item from "@/layout/components/Sidebar/Item.vue";

export default {
  name: "Patrol",
  computed: {
    item() {
      return item;
    },
  },
  dicts: ["sys_patrol_status"],
  data() {
    return {
      timePickerValue: "",
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
      // 巡更任务管理表格数据
      patrolList: [],
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
        patrolName: null,
        patrolDescribe: null,
        patrolPrincipal: null,
        patrolPhone: null,
        patrolStatus: null,
        personnelId: null,
        patrolStartTime: null,
        patrolEndTime: null,
        patrolCreateTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        // PatrolPointId: [
        //   {required: true, massage: "巡更点位不能为空", trigger: "blur"}
        // ],
        // patrolPrincipal: [
        //   {required: true, message: "巡更负责人不能为空", trigger: "change"}
        // ],
        patrolName: [
          { required: true, message: "巡更任务名称不能为空", trigger: "blur" },
        ],
        // patrolStatus: [
        //   {required: true, message: "巡更任务状态不能为空", trigger: "change"}
        // ],
        // patrolStartTime: [
        //   {required: true, message: "计划开始时间不能为空", trigger: "blur"}
        // ],
        // patrolEndTime: [
        //   {required: true, message: "计划结束时间不能为空", trigger: "blur"}
        // ],
        // patrolCreateTime: [
        //   {required: true, message: "任务创建时间不能为空", trigger: "blur"}
        // ],
      },
      dialogTableVisible: false, //查看弹框
      gridData: [], //巡更点表格数据
      regionList: [], //区域列表
    };
  },
  created() {
    this.getList();
    this.getPersonnel();
    this.regionListQuery();
  },
  methods: {
    //查询区域列表
    regionListQuery() {
      listRegionAll().then((response) => {
        this.regionList = response.rows;
      });
    },
    //查看已巡点和未巡点
    seeInfo(row) {
      const patrolId = row.patrolId || this.ids;
      getPotinStatusByPatrolId(patrolId).then((res) => {
        console.log(res);
        this.gridData = res.pointListStatus;
        this.dialogTableVisible = true;
      });
    },
    //改变日期
    dateChange(val) {
      this.queryParams.patrolStartTime = val[0];
      this.queryParams.patrolEndTime = val[1];
      console.log(this.queryParams);
    },
    /**查询巡更人员*/
    getPersonnel() {
      getPatrol().then((response) => {
        this.personnelOptions = response.personnels;
        this.patrolPointOptions = response.patrolPoints;
      });
    },
    /** 查询巡更任务管理列表 */
    getList() {
      this.loading = true;
      listPatrol(this.queryParams).then((response) => {
        this.patrolList = response.rows;
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
        patrolId: null,
        patrolName: null,
        patrolDescribe: null,
        patrolPrincipal: null,
        patrolPhone: null,
        patrolStatus: null,
        patrolStartTime: null,
        patrolEndTime: null,
        patrolCreateTime: null,
        remark: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        personnelIds: [],
        patrolPointIds: [],
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
      this.ids = selection.map((item) => item.patrolId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加巡更任务管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const patrolId = row.patrolId || this.ids;
      getPatrol(patrolId).then((response) => {
        console.log(response);
        this.form = response.data;
        this.personnelOptions = response.personnels;
        this.$set(this.form, "personnelIds", response.personnelIds);
        this.patrolPointOptions = response.patrolPoints;
        this.$set(this.form, "patrolPointIds", response.patrolPointIds);
        this.open = true;
        this.title = "修改巡更任务管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.patrolId != null) {
            updatePatrol(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPatrol(this.form).then((response) => {
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
      const patrolIds = row.patrolId || this.ids;
      this.$modal
        .confirm('是否确认删除巡更任务管理编号为"' + patrolIds + '"的数据项？')
        .then(function () {
          return delPatrol(patrolIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "system/patrol/export",
        {
          ...this.queryParams,
        },
        `patrol_${new Date().getTime()}.xlsx`
      );
    },
    /**
     * 选择器选中状态
     */
    // choiceEvent(id) {
    //   //根据id查询电话返回赋值给form.patrolPhone
    //   getPersonnel(id).then(response => {
    //     console.log(id)
    //     console.log(response.data)
    //     this.form.patrolPhone = response.data.patrolPhone;
    //   });
    // }
  },
};
</script>
