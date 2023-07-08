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
      <el-form-item label="巡检项目" prop="itemName">
        <el-input
          v-model="queryParams.itemName"
          placeholder="请输入巡检项目"
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
          v-hasPermi="['system:item:add']"
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
          v-hasPermi="['system:item:edit']"
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
          v-hasPermi="['system:item:remove']"
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
          v-hasPermi="['system:item:export']"
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
      :data="itemList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="巡检项目" align="center" prop="itemName" />
      <el-table-column label="区域名称" align="center" prop="regionId">
        <template slot-scope="scope">
          <span>{{ idRegionName(scope.row.regionId) }}</span>
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
            icon="el-icon-edit-outline"
            @click="addTopic(scope.row)"
            v-hasPermi="['system:item:edit']"
            >题目</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:item:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:item:remove']"
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

    <!-- 添加或修改巡更项目对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="巡更项目" prop="itemName">
          <el-input v-model="form.itemName" placeholder="请输入巡更项目" />
        </el-form-item>
        <el-form-item label="区域名称" prop="regionId">
          <el-select
            v-model="form.regionId"
            placeholder="请选择区域名称"
            clearable
          >
            <el-option
              v-for="item in regionList"
              :key="item.regionId"
              :label="item.name"
              :value="item.regionId"
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
  </div>
</template>

<script>
import { listItem, delItem, addItem, updateItem } from "@/api/system/item";
import { listRegionAll } from "@/api/system/region";
export default {
  name: "Item",
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
      // 巡更项目表格数据
      itemList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        itemName: null,
        regionId: null,
        statusCd: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        itemName: [
          { required: true, message: "巡检项目不能为空", trigger: "blur" },
        ],
        regionId: [
          { required: true, message: "小区ID不能为空", trigger: "blur" },
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
    };
  },
  created() {
    this.getList();
    this.regionListQuery();
  },
  methods: {
    //点击添加题目
    addTopic(row) {
      console.log(row);
      this.$router.push({
        path: "/system/title",
        query: { id: row.itemId, regionId: row.regionId },
      });
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
    /** 查询巡更项目列表 */
    getList() {
      this.loading = true;
      listItem(this.queryParams).then((response) => {
        this.itemList = response.rows;
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
        itemId: null,
        itemName: null,
        regionId: null,
        remark: null,
        statusCd: null,
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
      this.ids = selection.map((item) => item.itemId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加巡更项目";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.form = row;
      this.open = true;
      this.title = "修改巡更项目";
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.itemId != null) {
            updateItem(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addItem(this.form).then((response) => {
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
      const itemIds = row.itemId || this.ids;
      this.$modal
        .confirm('是否确认删除巡更项目编号为"' + itemIds + '"的数据项？')
        .then(function () {
          return delItem(itemIds);
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
        "system/item/export",
        {
          ...this.queryParams,
        },
        `item_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
