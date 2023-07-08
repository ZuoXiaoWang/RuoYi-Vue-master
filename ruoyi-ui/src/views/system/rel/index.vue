<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
    </el-form>

    <el-row :gutter="10" class="mb8">
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="relList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="区域名称" align="center" prop="regionId">
        <template slot-scope="scope">
          <span>{{ idRegionName(scope.row.regionId) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="路线名称" align="center" prop="inspectionRouteId">
        <template slot-scope="scope">
          <span>{{ idRouteName(scope.row.inspectionRouteId) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="点位名称" align="center" prop="inspectionId">
        <template slot-scope="scope">
          <span>{{ idInspectionName(scope.row.patrolPointId) }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column
        label="巡检点开始时间"
        align="center"
        prop="pointStartTime"
      />
      <el-table-column
        label="巡检点结束时间"
        align="center"
        prop="pointEndTime"
      />
      <el-table-column label="排序" align="center" prop="sortNumber" /> -->
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改巡更点对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="区域名称" prop="regionId">
          <el-input v-model="form.regionId" placeholder="请输入区域名称" />
        </el-form-item>
        <el-form-item label="路线名称" prop="inspectionRouteId">
          <el-input
            v-model="form.inspectionRouteId"
            placeholder="请输入路线名称"
          />
        </el-form-item>
        <el-form-item label="巡检点" prop="inspectionId">
          <el-input v-model="form.inspectionId" placeholder="请输入巡检点" />
        </el-form-item>

        <el-form-item label="巡检点开始时间" prop="pointStartTime">
          <el-input
            v-model="form.pointStartTime"
            placeholder="请输入巡检点开始时间"
          />
        </el-form-item>
        <el-form-item label="巡检点结束时间" prop="pointEndTime">
          <el-input
            v-model="form.pointEndTime"
            placeholder="请输入巡检点结束时间"
          />
        </el-form-item>
        <el-form-item label="排序" prop="sortNumber">
          <el-input v-model="form.sortNumber" placeholder="请输入排序" />
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
  getRoutePoint,
  getRel,
  delRel,
  addRel,
  updateRel,
} from "@/api/system/rel";
import { listRoute } from "@/api/system/route";
import { getPatrol } from "@/api/system/patrol";
import { listRegionAll } from "@/api/system/region";

export default {
  name: "Rel",
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
      // 巡更点表格数据
      relList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        inspectionRouteId: null,
        inspectionId: null,
        regionId: null,
        statusCd: null,
        pointStartTime: null,
        pointEndTime: null,
        sortNumber: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        inspectionRouteId: [
          { required: true, message: "路线ID不能为空", trigger: "blur" },
        ],
        inspectionId: [
          { required: true, message: "巡检点ID不能为空", trigger: "blur" },
        ],
        regionId: [
          { required: true, message: "小区ID不能为空", trigger: "blur" },
        ],
        statusCd: [
          { required: true, message: "数据状态不能为空", trigger: "blur" },
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" },
        ],
      },
      regionList: [], //区域列表
      patrolPointOptions: [], //巡更点位列表
      routeListRow: [], //巡更路线列表
    };
  },
  created() {
    this.getList();
    this.regionListQuery();
    this.getPersonnel();
    this.routeList();
  },
  methods: {
    // 查询巡更路线列表
    routeList() {
      listRoute().then((response) => {
        this.routeListRow = response.rows;
      });
    },
    idRouteName(index) {
      for (let i = 0; i < this.routeListRow.length; i++) {
        if (this.routeListRow[i].inspectionRouteId == index) {
          return this.routeListRow[i].routeName;
        }
      }
    },
    /**查询巡更人员/点位*/
    getPersonnel() {
      getPatrol().then((response) => {
        // this.personnelOptions = response.personnels;
        this.patrolPointOptions = response.patrolPoints;
      });
    },
    idInspectionName(index) {
      console.log(index);
      for (let i = 0; i < this.patrolPointOptions.length; i++) {
        if (this.patrolPointOptions[i].patrolPointId == index) {
          return this.patrolPointOptions[i].patrolPointName;
        }
      }
    },
    //查询区域列表
    regionListQuery() {
      listRegionAll().then((response) => {
        this.regionList = response.rows;
      });
    },
    idRegionName(index) {
      for (let i = 0; i < this.regionList.length; i++) {
        if (this.regionList[i].regionId == index) {
          return this.regionList[i].name;
        }
      }
    },
    /** 查询巡更点列表 */
    getList() {
      this.loading = true;
      let inspectionRouteId = this.$route.query.id;
      getRoutePoint(inspectionRouteId).then((response) => {
        console.log(response);
        this.relList = response.rows;
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
        irpRelId: null,
        inspectionRouteId: null,
        inspectionId: null,
        regionId: null,
        statusCd: null,
        pointStartTime: null,
        pointEndTime: null,
        sortNumber: null,
        createTime: null,
        createBy: null,
        updateBy: null,
        updateTime: null,
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
      this.ids = selection.map((item) => item.irpRelId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加巡更点";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const irpRelId = row.irpRelId || this.ids;
      getRel(irpRelId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改巡更点";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.irpRelId != null) {
            updateRel(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRel(this.form).then((response) => {
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
      const irpRelIds = row.irpRelId || this.ids;
      this.$modal
        .confirm('是否确认删除巡更点编号为"' + irpRelIds + '"的数据项？')
        .then(function () {
          return delRel(irpRelIds);
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
        "system/rel/export",
        {
          ...this.queryParams,
        },
        `rel_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
