<template>
  <div class="login" style="font-weight: bold;font-size: 20px">

    <el-row :gutter="20" style="margin-right: 20px;">
      <el-col :span="12">
        <el-statistic :value="todayPatrol" title="今日巡更任务"></el-statistic>
      </el-col>
      <el-col :span="12">
        <el-statistic :value="Personnel" title="今日巡更人员"></el-statistic>
      </el-col>
    </el-row>

    <el-row :gutter="20" style="margin-right: 20px">
      <el-col :span="12">
        <el-statistic :value="unCompletePatrol" title="未完成巡更任务"></el-statistic>
      </el-col>
      <el-col :span="12">
        <el-statistic :value="completePatrol" title="已完成巡更任务"></el-statistic>
      </el-col>
    </el-row>

    <el-row>
      <el-col :span="24">
        <el-statistic :value="repair" title="报警维修"></el-statistic>
      </el-col>
      <!--<el-col :span="12">-->
      <!--  <div>-->
      <!--    <el-statistic :value="todayPatrol" title="今日巡更人员"></el-statistic>-->
      <!--  </div>-->
      <!--</el-col>-->
    </el-row>
  </div>
</template>

<script lang="ts" setup>
import {getCount} from "../api/system/patrol.js";

export default {
  name: "Index",
  data() {
    return {
      todayPatrol: 0,
      Personnel: 0,
      unCompletePatrol: 0,
      completePatrol: 0,
      repair: 0,
      // 版本号
      version: "3.8.5"
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询巡更任务管理列表 */
    getList() {
      getCount().then(response => {
        this.todayPatrol = response.todayPatrol;
        this.Personnel = response.Personnel;
        this.unCompletePatrol = response.unCompletePatrol;
        this.completePatrol = response.completePatrol;
        this.repair = response.repair;
      });
    },
  }
};
</script>
<style rel="stylesheet/scss" lang="scss">
.login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  text-align: center;
  border-radius: 6px;
  background-image: url('../assets/images/background.jpg');
  background-size: 100% 100%;
  padding: 25px 25px 5px 25px;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
}

.title {
  font-size: 20px;
  margin: 0px auto 30px auto;
  text-align: center;
  color: #707070;
}
.el-statistic .con .number {
  font-size: 30px;
  padding: 0 4px;
}
</style>

