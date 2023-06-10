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
      <el-form-item label="报修位置" prop="location">
        <el-input
          v-model="queryParams.location"
          placeholder="请输入报修位置"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="报修描述" prop="describe">
        <el-input
          v-model="queryParams.describe"
          placeholder="请输入报修描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="区域分类" prop="regionalClassification">
        <el-select
          v-model="queryParams.regionalClassification"
          placeholder="请选择区域分类"
          clearable
        >
          <el-option
            v-for="dict in dict.type.regional_classification"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="维修分类" prop="maintenanceClassification">
        <el-select
          v-model="queryParams.maintenanceClassification"
          placeholder="请选择维修分类"
          clearable
        >
          <el-option
            v-for="dict in dict.type.maintenance_classification"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="state">
        <el-select
          v-model="queryParams.state"
          placeholder="请选择状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.repair_from_state"
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
      <!-- <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:newRepairFrom:add']"
          >新增</el-button
        >
      </el-col> -->
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:newRepairFrom:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:newRepairFrom:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:newRepairFrom:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="newRepairFromList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="报修单id" align="center" prop="repairFromId" />
      <el-table-column label="报修位置" align="center" prop="location" />
      <el-table-column label="报修描述" align="center" prop="describe" />
      <el-table-column
        label="区域分类"
        align="center"
        prop="regionalClassification"
      >
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.regional_classification"
            :value="scope.row.regionalClassification"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="维修分类"
        align="center"
        prop="maintenanceClassification"
      >
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.maintenance_classification"
            :value="scope.row.maintenanceClassification"
          />
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="state">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.repair_from_state"
            :value="scope.row.state"
          />
        </template>
      </el-table-column>
      <el-table-column label="类型" align="center" prop="paidType" />
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
            icon="el-icon-edit-outline"
            @click="seeInfo(scope.row, 1)"
            >派单</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="seeInfo(scope.row, 0)"
            >查看</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:newRepairFrom:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:newRepairFrom:remove']"
            >删除</el-button
          >
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

    <el-dialog :visible.sync="dialogVisible">
      <img width="100%" :src="dialogImageUrl" alt="" />
    </el-dialog>
    <!-- 添加或修改报修单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-upload
          class="upload-demo"
          :action="uploadUrl"
          ref="upload"
          name="file"
          list-type="picture-card"
          :headers="headers"
          :before-upload="beforeAvatarUpload"
          :on-preview="handlePictureCardPreview"
          :on-remove="handleRemove"
          :file-list="imgUrls"
          :on-success="handleAvatarSuccess"
        >
          <i class="el-icon-plus"></i>
        </el-upload>
        <el-form-item label="报修位置" prop="location">
          <el-input v-model="form.location" placeholder="请输入报修位置" />
        </el-form-item>
        <el-form-item label="报修描述" prop="describe">
          <el-input v-model="form.describe" placeholder="请输入报修描述" />
        </el-form-item>
        <el-form-item label="区域分类" prop="regionalClassification">
          <el-select
            v-model="form.regionalClassification"
            placeholder="请选择区域分类"
            clearable
          >
            <el-option
              v-for="dict in dict.type.regional_classification"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="维修分类" prop="maintenanceClassification">
          <el-select
            v-model="form.maintenanceClassification"
            placeholder="请选择维修分类"
            clearable
          >
            <el-option
              v-for="dict in dict.type.maintenance_classification"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="state">
          <el-select v-model="form.state" placeholder="请选择状态" clearable>
            <el-option
              v-for="dict in dict.type.repair_from_state"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
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

    <!-- 查看详情 -->
    <el-dialog
      :title="title2"
      :visible.sync="openOne"
      width="500px"
      append-to-body
    >
      <el-form ref="form1" :model="form1" label-width="80px">
        <div
          v-for="(i, index) in imgUrls"
          :key="index"
          style="display: inline-block; width: 100px; height: 100px"
        >
          <img :src="i" alt="" style="width: 100%; height: 100%" />
        </div>
        <el-form-item label="维修位置" prop="location">
          <el-input
            v-model="form1.location"
            placeholder="请输入维修位置"
            disabled
          />
        </el-form-item>
        <el-form-item label="维修描述" prop="describe">
          <el-input
            v-model="form1.describe"
            placeholder="请输入维修描述"
            disabled
          />
        </el-form-item>
        <el-form-item label="区域分类" prop="regionalClassification">
          <el-select
            v-model="form1.regionalClassification"
            placeholder="请选择区域分类"
            clearable
            disabled
          >
            <el-option
              v-for="dict in dict.type.regional_classification"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="维修分类" prop="maintenanceClassification">
          <el-select
            v-model="form1.maintenanceClassification"
            placeholder="请选择维修分类"
            clearable
            disabled
          >
            <el-option
              v-for="dict in dict.type.maintenance_classification"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="state">
          <el-select
            v-model="form1.state"
            placeholder="请选择状态"
            clearable
            disabled
          >
            <el-option
              v-for="dict in dict.type.repair_from_state"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="是否有偿" prop="paidType">
          <el-select
            v-model="form1.paidType"
            placeholder="请选择状态"
            clearable
            disabled
          >
            <el-option
              v-for="dict in dict.type.paid_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item
          label="维修人员"
          prop="personnelId"
          v-if="title2 == '派单'"
        >
          <el-select
            v-model="form1.personnelId"
            placeholder="请选择维修人员"
            clearable
          >
            <el-option
              v-for="dict in personnelList"
              :key="dict.personnelId"
              :label="dict.personnelName"
              :value="dict.personnelId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input
            v-model="form1.remark"
            type="textarea"
            placeholder="请输入内容"
            disabled
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel2">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listNewRepairFrom,
  getNewRepairFrom,
  delNewRepairFrom,
  addNewRepairFrom,
  updateNewRepairFrom,
  pickUpRepairFrom,
} from "@/api/system/newRepairFrom";
import { deptTreeSelect } from "@/api/system/user";
import { listPersonnel } from "@/api/system/personnel";
import { getToken } from "@/utils/auth";
// import { listArea} from "@/api/system/area";

export default {
  name: "NewRepairFrom",
  dicts: [
    "regional_classification",
    "maintenance_classification",
    "repair_from_state",
  ],
  data() {
    return {
      uploadUrl: process.env.VUE_APP_BASE_API + "/common/upload", // 上传的图片服务器地址
      headers: {
        Authorization: "Bearer " + getToken(),
      },
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
      // 报修单表格数据
      newRepairFromList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        location: null,
        describe: null,
        regionalClassification: null,
        maintenanceClassification: null,
        state: null,
        paidType: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      //区域列表
      // areaList:[]
      form1: {},
      imgUrls: [],
      imgUrl: [],
      openOne: false,
      title2: "",
      personnelList: [],
      dialogImageUrl: "",
      dialogVisible: false,
    };
  },
  created() {
    this.getList();
    this.personnelGetList();
  },
  methods: {
    handleAvatarSuccess(res, file) {
      let url = {
        url: res.fileName,
      };
      this.imgUrl.push(url);
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    },
    handleRemove(file, fileList) {
      this.imgUrl = fileList;
    },
    //查看大图
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },
    //查询维修人员列表
    personnelGetList() {
      deptTreeSelect().then((res) => {
        res.data[0].children.forEach((item, i) => {
          if (item.label.indexOf("维修") != -1) {
            let queryParams = {
              deptId: item.id,
            };
            listPersonnel(queryParams).then((response) => {
              this.personnelList = response.rows;
            });
          }
        });
      });
    },
    getImg(Url) {
      return process.env.VUE_APP_BASE_API + Url;
    },
    //查看详情
    seeInfo(row, val) {
      this.imgUrls = [];
      const repairFromId = row.repairFromId || this.ids;
      getNewRepairFrom(repairFromId).then((response) => {
        // console.log(this.dict.type.regional_classification);//区域分类
        // console.log(this.dict.type.maintenance_classification);//维修分类
        this.form1 = response.data;
        this.dict.type.regional_classification.forEach((item, index) => {
          if (this.form1.regionalClassification == item.label) {
            this.form1.regionalClassification = item.value;
          }
        });
        this.dict.type.maintenance_classification.forEach((item, index) => {
          if (this.form1.maintenanceClassification == item.label) {
            this.form1.maintenanceClassification = item.value;
          }
        });
        response.imgUrls.forEach((item, index) => {
          this.imgUrls[index] = this.getImg(item);
        });
        if (val == 0) {
          this.title2 = "查看";
        } else {
          this.title2 = "派单";
        }
        this.openOne = true;
      });
    },
    /** 查询报修单列表 */
    getList() {
      this.loading = true;
      listNewRepairFrom(this.queryParams).then((response) => {
        this.newRepairFromList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
      // listArea().then((res) => {
      //   this.areaList = res.rows;
      // })
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    cancel2() {
      if (this.title2 == "查看") {
        this.openOne = false;
      } else {
        pickUpRepairFrom(this.form1.repairFromId, this.form1.personnelId).then(
          (res) => {
            if (res.msg == "操作成功") {
              this.$modal.msgSuccess("派单成功");
              this.openOne = false;
              this.getList();
            }
          }
        );
      }
    },
    // 表单重置
    reset() {
      this.form = {
        repairFromId: null,
        location: null,
        describe: null,
        regionalClassification: null,
        maintenanceClassification: null,
        state: null,
        paidType: null,
        remark: null,
        createBy: null,
        createTime: null,
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
      this.ids = selection.map((item) => item.repairFromId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加报修单";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.imgUrls = [];
      this.imgUrl = [];
      this.reset();
      const repairFromId = row.repairFromId || this.ids;
      getNewRepairFrom(repairFromId).then((response) => {
        this.form = response.data;
        this.dict.type.regional_classification.forEach((item, index) => {
          if (this.form.regionalClassification == item.label) {
            this.form.regionalClassification = item.value;
          }
        });
        this.dict.type.maintenance_classification.forEach((item, index) => {
          if (this.form.maintenanceClassification == item.label) {
            this.form.maintenanceClassification = item.value;
          }
        });
        response.imgUrls.forEach((item, index) => {
          let aaa = {
            url: this.getImg(item),
          };
          this.imgUrls.push(aaa);
          this.imgUrl.push(aaa);
        });
        this.open = true;
        this.title = "修改报修单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.repairFromId != null) {
            this.form.imgUrls = [];
            this.imgUrl.forEach((item, index) => {
              this.form.imgUrls.push(item.url);
            });
            updateNewRepairFrom(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addNewRepairFrom(this.form).then((response) => {
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
      const repairFromIds = row.repairFromId || this.ids;
      this.$modal
        .confirm('是否确认删除报修单编号为"' + repairFromIds + '"的数据项？')
        .then(function () {
          return delNewRepairFrom(repairFromIds);
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
        "system/newRepairFrom/export",
        {
          ...this.queryParams,
        },
        `newRepairFrom_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>