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
      <el-form-item label="名称" prop="itemTitle">
        <el-input
          v-model="queryParams.itemTitle"
          placeholder="请输入名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['system:title:add']"
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
          v-hasPermi="['system:title:edit']"
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
          v-hasPermi="['system:title:remove']"
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
          v-hasPermi="['system:title:export']"
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
      :data="titleList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="主键ID" align="center" prop="titleId" /> -->
      <el-table-column label="项目名称" align="center" prop="itemId">
        <template slot-scope="scope">
          <span>{{ idTopicName(scope.row.itemId) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="题目名称" align="center" prop="itemTitle" />
      <el-table-column label="题目类型" align="center" prop="titleType">
        <template slot-scope="scope">
          <span>{{ idTypeName(scope.row.titleType) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="区域名称" align="center" prop="regionId">
        <template slot-scope="scope">
          <span>{{ idRegionName(scope.row.regionId) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="显示顺序" align="center" prop="seq" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:title:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:title:remove']"
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

    <!-- 添加或修改题目对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="区域名称" prop="regionId">
          <el-select
            v-model="form.regionId"
            placeholder="请选择区域名称"
            clearable
            disabled
          >
            <el-option
              v-for="item in regionList"
              :key="item.regionId"
              :label="item.name"
              :value="item.regionId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="项目名称" prop="itemId">
          <el-select
            v-model="form.itemId"
            placeholder="请选择项目名称"
            clearable
            disabled
          >
            <el-option
              v-for="item in topicList"
              :key="item.itemId"
              :label="item.itemName"
              :value="item.itemId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="题目名称" prop="itemTitle">
          <el-input v-model="form.itemTitle" placeholder="请输入题目名称" />
        </el-form-item>
        <el-form-item label="题目类型" prop="titleType">
          <el-select
            v-model="form.titleType"
            placeholder="请选择题目类型"
            @change="titleTypeSele"
            clearable
          >
            <el-option
              v-for="item in titleTypeList"
              :key="item.id"
              :label="item.value"
              :value="item.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item
          v-for="(item, index) in form.inspectionItemTitleValue"
          :label="'选项' + (index + 1)"
          :key="item.key"
          v-if="form.titleType == '1001' || '2002'"
        >
          <el-input
            v-model="item.itemValue"
            placeholder="请输入内容"
          /><el-button @click="addDomain">新增选项</el-button
          ><el-button @click.prevent="removeDomain(item)">删除选项</el-button>
        </el-form-item>
        <el-form-item label="显示顺序" prop="seq">
          <el-input v-model="form.seq" placeholder="请输入显示顺序" />
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
  listTitle,
  getTitle,
  delTitle,
  addTitle,
  updateTitle,
} from "@/api/system/title";
import { listRegionAll } from "@/api/system/region";
import { listItem } from "@/api/system/item";
export default {
  name: "Title",
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
      // 题目表格数据
      titleList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        itemId: null,
        itemTitle: null,
        titleType: null,
        communityId: null,
        seq: null,
        statusCd: null,
      },
      // 表单参数
      form: { inspectionItemTitleValue: [] },
      // 表单校验
      rules: {
        itemId: [
          { required: true, message: "项目编号不能为空", trigger: "blur" },
        ],
        itemTitle: [
          { required: true, message: "名称不能为空", trigger: "blur" },
        ],
        // titleType: [
        //   {
        //     required: true,
        //     message: "题目类型 1001 单选 2002 多选 3003 简答题不能为空",
        //     trigger: "change",
        //   },
        // ],
        communityId: [
          { required: true, message: "小区ID不能为空", trigger: "blur" },
        ],
        seq: [{ required: true, message: "显示顺序不能为空", trigger: "blur" }],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" },
        ],
        statusCd: [
          {
            required: true,
            message:
              "数据状态，详细参考c_status表，S 保存，0, 在用 1失效不能为空",
            trigger: "blur",
          },
        ],
      },
      regionList: [], //区域列表
      topicList: [], //项目列表
      titleTypeList: [
        {
          id: "1001",
          value: "单选题",
        },
        {
          id: "2002",
          value: "多选题",
        },
        {
          id: "3003",
          value: "简答题",
        },
      ], //题目类型
    };
  },
  created() {
    this.getList();
    this.regionListQuery();
    this.topicListQuery();
  },
  methods: {
    removeDomain(item) {
      var index = this.form.inspectionItemTitleValue.indexOf(item);
      if (index !== -1) {
        this.form.inspectionItemTitleValue.splice(index, 1);
      }
    },
    addDomain() {
      console.log(this.form);
      this.form.inspectionItemTitleValue.push({
        itemValue: "",
        key: Date.now(),
      });
    },
    titleTypeSele() {
      this.form.inspectionItemTitleValue = [];
      if (this.form.titleType == "3003") {
      } else {
        this.addDomain();
      }
    },
    //返回题目类型
    idTypeName(index) {
      for (let i = 0; i < this.titleTypeList.length; i++) {
        if (this.titleTypeList[i].id == index) {
          return this.titleTypeList[i].value;
        }
      }
    },
    /** 查询巡更项目列表 */
    topicListQuery() {
      listItem(this.queryParams).then((response) => {
        this.topicList = response.rows;
      });
    },
    idTopicName(index) {
      for (let i = 0; i < this.topicList.length; i++) {
        if (this.topicList[i].itemId == index) {
          return this.topicList[i].itemName;
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
    /** 查询题目列表 */
    getList() {
      this.loading = true;
      let itemId = this.$route.query.id;
      this.queryParams.itemId = itemId;
      listTitle(this.queryParams).then((response) => {
        this.titleList = response.rows;
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
        titleId: null,
        itemId: this.$route.query.id,
        regionId: parseFloat(this.$route.query.regionId),
        itemTitle: null,
        titleType: null,
        communityId: null,
        seq: null,
        createTime: null,
        statusCd: null,
        inspectionItemTitleValue: [],
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
      this.ids = selection.map((item) => item.titleId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加题目";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      console.log(row);
      // this.form = row;
      const titleId = row.titleId || this.ids;
      getTitle(titleId).then((response) => {
        this.form = row;
        this.form.inspectionItemTitleValue = response.data;
        this.open = true;
        this.title = "修改题目";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.titleId != null) {
            updateTitle(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTitle(this.form).then((response) => {
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
      const titleIds = row.titleId || this.ids;
      this.$modal
        .confirm('是否确认删除题目编号为"' + titleIds + '"的数据项？')
        .then(function () {
          return delTitle(titleIds);
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
        "system/title/export",
        {
          ...this.queryParams,
        },
        `title_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
