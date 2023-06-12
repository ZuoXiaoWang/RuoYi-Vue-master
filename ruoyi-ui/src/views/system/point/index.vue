<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
    >
      <el-form-item
        label="巡更点名称"
        prop="patrolPointName"
        label-width="100px"
      >
        <el-input
          v-model="queryParams.patrolPointName"
          placeholder="请输入巡更点名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!--<el-form-item label="巡更点纬度" prop="patrolPointLatitude">-->
      <!--  <el-input-->
      <!--    v-model="queryParams.patrolPointLatitude"-->
      <!--    placeholder="请输入巡更点纬度"-->
      <!--    clearable-->
      <!--    @keyup.enter.native="handleQuery"-->
      <!--  />-->
      <!--</el-form-item>-->
      <!--<el-form-item label="巡更点经度" prop="patrolPointLongitude">-->
      <!--  <el-input-->
      <!--    v-model="queryParams.patrolPointLongitude"-->
      <!--    placeholder="请输入巡更点经度"-->
      <!--    clearable-->
      <!--    @keyup.enter.native="handleQuery"-->
      <!--  />-->
      <!--</el-form-item>-->
      <!--<el-form-item label="巡更点高度" prop="patrolPointAltitude">-->
      <!--  <el-input-->
      <!--    v-model="queryParams.patrolPointAltitude"-->
      <!--    placeholder="请输入巡更点高度"-->
      <!--    clearable-->
      <!--    @keyup.enter.native="handleQuery"-->
      <!--  />-->
      <!--</el-form-item>-->
      <el-form-item label="状态" prop="patrolPointStatus">
        <el-select
          v-model="queryParams.patrolPointStatus"
          placeholder="请选择状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
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
          v-hasPermi="['system:point:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:point:edit']"
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
          v-hasPermi="['system:point:remove']"
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
          v-hasPermi="['system:point:export']"
          >导出点位表</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-download"
          size="mini"
          :disabled="multiple"
          @click="handelQRcode"
          >导出二维码(此操作很慢请耐心等待几分钟，建议选择30列以下数据导出)</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="pointList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="巡更点ID" align="center" prop="patrolPointId" />
      <el-table-column
        label="巡更点名称"
        align="center"
        prop="patrolPointName"
        width="200"
      />
      <el-table-column
        label="巡更点描述"
        align="center"
        prop="patrolPointDescribe"
        width="300"
      />
      <!--<el-table-column label="巡更点二维码" align="center" prop="patrolPointUrl"/>-->
      <el-table-column
        label="巡更点纬度"
        align="center"
        prop="patrolPointLatitude"
      />
      <el-table-column
        label="巡更点经度"
        align="center"
        prop="patrolPointLongitude"
      />
      <el-table-column
        label="巡更点高度"
        align="center"
        prop="patrolPointAltitude"
      />
      <el-table-column label="状态" align="center" prop="patrolPointStatus">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.sys_normal_disable"
            :value="scope.row.patrolPointStatus"
          />
        </template>
      </el-table-column>
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
            v-hasPermi="['system:point:edit']"
            >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:point:remove']"
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
    <el-dialog title="点位倒查" :visible.sync="dialogTableVisible">
      <el-table :data="gridData">
        <el-table-column
          property="personnelName"
          align="center"
          label="巡检人"
        ></el-table-column>
        <el-table-column
          property="createTime"
          align="center"
          label="巡检时间"
        ></el-table-column>
      </el-table>
    </el-dialog>

    <!-- 添加或修改巡更点管理对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="500px"
      append-to-body
      :close-on-click-modal="false"
    >
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="区域" prop="regionId" v-if="title == '添加巡更点管理'">
          <el-select v-model="form.regionId" placeholder="请选择区域" clearable>
            <el-option
              v-for="item in regionList"
              :key="item.regionId"
              :label="item.name"
              :value="item.regionId"
            />
          </el-select>
        </el-form-item>
        <!--<el-form-item label="巡更点编号" prop="patrolPointId">-->
        <!--  <el-input v-model="form.patrolPointId" placeholder="请输入巡更点编号"/>-->
        <!--</el-form-item>-->
        <el-form-item label="巡更点名称" prop="patrolPointName">
          <el-input
            v-model="form.patrolPointName"
            placeholder="请输入巡更点名称"
          />
        </el-form-item>
        <el-form-item label="巡更点描述" prop="patrolPointDescribe">
          <el-input
            v-model="form.patrolPointDescribe"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <!--<el-form-item label="巡更点二维码" prop="patrolPointUrl">-->
        <!--  <el-input v-model="form.patrolPointUrl" type="textarea" placeholder="请输入内容"/>-->
        <!--</el-form-item>-->
        <el-form-item label="巡更点纬度" prop="patrolPointLatitude">
          <el-input
            v-model="form.patrolPointLatitude"
            placeholder="请输入巡更点纬度"
          />
        </el-form-item>
        <el-form-item label="巡更点经度" prop="patrolPointLongitude">
          <el-input
            v-model="form.patrolPointLongitude"
            placeholder="请输入巡更点经度"
          />
        </el-form-item>
        <el-form-item label="巡更点高度" prop="patrolPointAltitude">
          <el-input
            v-model="form.patrolPointAltitude"
            placeholder="请输入巡更点高度"
          />
        </el-form-item>
        <el-form-item label="状态" prop="patrolPointStatus">
          <el-radio-group v-model="form.patrolPointStatus">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
              >{{ dict.label }}
            </el-radio>
          </el-radio-group>
        </el-form-item>
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
  listPoint,
  getPoint,
  delPoint,
  addPoint,
  updatePoint,
  zipDownloadVue,
  selectPersonnelAndPatrolOrderByPointId
} from "@/api/system/point";
import { listRegion } from "@/api/system/region";
import { saveAs } from "file-saver";

export default {
  name: "Point",
  dicts: ["sys_normal_disable"],
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
      // 巡更点管理表格数据
      pointList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        patrolPointName: null,
        patrolPointDescribe: null,
        patrolPointUrl: null,
        patrolPointLatitude: null,
        patrolPointLongitude: null,
        patrolPointAltitude: null,
        patrolPointStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      // 表单校验
      rules: {
        // patrolPointId: [
        //   { required: true,message: "巡更点编号不能为空", trigger: "blur"}
        // ],
        patrolPointName: [
          { required: true, message: "巡更点名称不能为空", trigger: "blur" },
        ],
        patrolPointLatitude: [
          { required: true, message: "巡更点纬度不能为空", trigger: "blur" },
        ],
        patrolPointLongitude: [
          { required: true, message: "巡更点经度不能为空", trigger: "blur" },
        ],
        patrolPointAltitude: [
          { required: true, message: "巡更点高度不能为空", trigger: "blur" },
        ],
        patrolPointStatus: [
          { required: true, message: "状态不能为空", trigger: "change" },
        ],
      },
      dialogTableVisible: false, //查看弹框
      gridData: [], //点位倒查表格数据
      dialogVisible: false,
      regionList: [], //区域列表
    };
  },
  created() {
    this.getList();
    this.regionListQuery();
  },
  methods: {
    //查询区域列表
    regionListQuery() {
      listRegion().then((response) => {
        this.regionList = response.rows;
      });
    },
    //查看点位倒查信息
    seeInfo(row) {
      const patrolPointId = row.patrolPointId || this.ids;
      selectPersonnelAndPatrolOrderByPointId(patrolPointId).then((res) => {
        console.log(res);
        this.gridData = res.rows;
        this.dialogTableVisible = true;
      });
    },
    /** 查询巡更点管理列表 */
    getList() {
      this.loading = true;
      listPoint(this.queryParams).then((response) => {
        this.pointList = response.rows;
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
        patrolPointId: null,
        patrolPointName: null,
        patrolPointDescribe: null,
        patrolPointUrl: null,
        patrolPointLatitude: null,
        patrolPointLongitude: null,
        patrolPointAltitude: null,
        patrolPointStatus: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
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
      this.ids = selection.map((item) => item.patrolPointId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加巡更点管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const patrolPointId = row.patrolPointId || this.ids;
      getPoint(patrolPointId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改巡更点管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.patrolPointId != null) {
            updatePoint(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPoint(this.form).then((response) => {
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
      const patrolPointIds = row.patrolPointId || this.ids;
      this.$modal
        .confirm(
          '是否确认删除巡更点管理编号为"' + patrolPointIds + '"的数据项？'
        )
        .then(function () {
          return delPoint(patrolPointIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    handelQRcode(row) {
      const patrolPointIds = row.patrolPointId || this.ids;
      this.$download.QRcodeZip(
        "/system/point/qrcode/" + patrolPointIds,
        patrolPointIds
      );

      // // const patrolPointIds = row.patrolPointId || this.ids;
      // this.$modal.confirm('是否确认导出所有二维码？').then(function () {
      //   return
      //   zipDownloadVue().then(response => {
      //     const url = window.URL.createObjectURL(new Blob([response], {
      //       type: 'application/zip'
      //     }))
      //     const link = document.createElement('a')
      //     link.style.display = 'none'
      //     link.href = url
      //     link.setAttribute('download', 'QRcode.zip')
      //     document.body.appendChild(link)
      //     link.click()
      //     document.body.removeChild(link)
      //
      //   })
      // }).then(() => {
      //   this.getList();
      //   this.$modal.msgSuccess("导出成功");
      // }).catch(() => {
      // });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "system/point/export",
        {
          ...this.queryParams,
        },
        `点位表${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
