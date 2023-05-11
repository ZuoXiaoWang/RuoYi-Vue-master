<template>
  <div class="login" style="font-weight: bold;font-size: 20px">
    <span style="width: 120px">{{nowDate}}</span>
    <div>
      <span><a v-on:click="redirect">今日任务</a></span>
      <el-table
        :data="dayTableData"
        height="380"
        border
        style="width: 100%;">
        <el-table-column
          prop="patrolName"
          label="姓名"
          width="180">
        </el-table-column>
        <el-table-column
          prop="patrolDescribe"
          label="描述"
          width="180">
        </el-table-column>
        <el-table-column
          prop="patrolStatus"
          label="状态"
          width="80">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.sys_patrol_status" :value="scope.row.patrolStatus"/>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div>
      <span><a v-on:click="redirect">本周内任务</a></span>
      <el-table
        :data="weekTableData"
        height="380"
        border
        style="width: 100%;">
        <el-table-column
          prop="patrolName"
          label="姓名"
          width="180">
        </el-table-column>
        <el-table-column
          prop="patrolDescribe"
          label="描述"
          width="180">
        </el-table-column>
        <el-table-column
          prop="patrolStatus"
          label="状态"
          width="80">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.sys_patrol_status" :value="scope.row.patrolStatus"/>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div>
      <span><a v-on:click="redirect">本月内任务</a></span>
      <el-table
        :data="monthTableData"
        height="380"
        border
        style="width: 100%;">
        <el-table-column
          prop="patrolName"
          label="姓名"
          width="180">
        </el-table-column>
        <el-table-column
          prop="patrolDescribe"
          label="描述"
          width="180">
        </el-table-column>
        <el-table-column
          prop="patrolStatus"
          label="状态"
          width="80">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.sys_patrol_status" :value="scope.row.patrolStatus"/>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <!--<el-row :gutter="20" style="margin-right: 20px;">-->
    <!--  <el-col :span="12">-->
    <!--    <el-statistic :value="todayPatrol" title="今日巡更任务"></el-statistic>-->
    <!--  </el-col>-->
    <!--  <el-col :span="12">-->
    <!--    <el-statistic :value="Personnel" title="今日巡更人员"></el-statistic>-->
    <!--  </el-col>-->
    <!--</el-row>-->

    <!--<el-row :gutter="20" style="margin-right: 20px">-->
    <!--  <el-col :span="12">-->
    <!--    <el-statistic :value="unCompletePatrol" title="未完成巡更任务"></el-statistic>-->
    <!--  </el-col>-->
    <!--  <el-col :span="12">-->
    <!--    <el-statistic :value="completePatrol" title="已完成巡更任务"></el-statistic>-->
    <!--  </el-col>-->
    <!--</el-row>-->

    <!--<el-row>-->
    <!--  <el-col :span="24">-->
    <!--    <el-statistic :value="repair" title="报警维修"></el-statistic>-->
    <!--  </el-col>-->
    <!--  &lt;!&ndash;<el-col :span="12">&ndash;&gt;-->
    <!--  &lt;!&ndash;  <div>&ndash;&gt;-->
    <!--  &lt;!&ndash;    <el-statistic :value="todayPatrol" title="今日巡更人员"></el-statistic>&ndash;&gt;-->
    <!--  &lt;!&ndash;  </div>&ndash;&gt;-->
    <!--  &lt;!&ndash;</el-col>&ndash;&gt;-->
    <!--</el-row>-->
  </div>
</template>

<script lang="ts" setup>
import {listPatrol} from "../api/system/patrol.js";

export default {
  dicts: ['sys_patrol_status'],
  name: "Index",
  data() {
    return {
      //表格数据
      dayTableData: [],
      weekTableData: [],
      monthTableData: [],
      nowDate: "",
      // todayPatrol: 0,
      // Personnel: 0,
      // unCompletePatrol: 0,
      // completePatrol: 0,
      // repair: 0,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 100,
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
      // 版本号
      version: "3.8.5"
    };
  },
  created() {
    this.getList();
    this.nowDate = this.getNowDate() +" "+ this.getNowWeek();
    console.log(this.nowDate)
  },
  methods: {
    //时间格式化
    dateFormat(date) {
      var seperator1 = "-";
      var year = date.getFullYear();
      var month = date.getMonth() + 1;
      var strDate = date.getDate();
      var monthStr = monthStr = month.toString();
      var strDateStr = strDateStr = strDate.toString();
      if (month >= 1 && month <= 9) {
        monthStr = "0" + monthStr;
      }
      if (strDate >= 1 && strDate <= 9) {
        strDateStr = "0" + strDateStr;
      }
      return year + seperator1 + monthStr + seperator1 + strDateStr;
    },
    //获取今日时间
    getNowDate() {
      //获取当前时间
      let myDate = new Date()
      return this.dateFormat(myDate);
    },
    //获取明天时间
    getTomorrow() {
      let myDate = new Date()
      myDate.setTime(myDate.getTime() + 3600 * 1000 * 24);
      return this.dateFormat(myDate);
    },
    //获取本周一日期
    getWeek() {
      //获取当前时间
      let myDate = new Date()
      let wk = myDate.getDay()
      let weeks = [7, 1, 2, 3, 4, 5, 6]
      myDate.setTime(myDate.getTime() - 3600 * 1000 * 24 * weeks[wk]);
      return this.dateFormat(myDate);
    },
    //获取星期
    getNowWeek() {
      //获取当前时间
      let myDate = new Date()
      let wk = myDate.getDay()
      let weeks = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六']
      return weeks[wk];
    },
    //获取本月第一天日期
    getMoth() {
      let myDate = new Date()
      myDate.setDate(1);
      return this.dateFormat(myDate);
    },
    redirect(){
      this.$router.push('/patrol')
    },
    /** 查询巡更任务管理列表 */
    getList() {


      // getCount().then(response => {
      //   this.todayPatrol = response.todayPatrol;
      //   this.Personnel = response.Personnel;
      //   this.unCompletePatrol = response.unCompletePatrol;
      //   this.completePatrol = response.completePatrol;
      //   this.repair = response.repair;
      // });

      //获取日任务
      this.queryParams.patrolStartTime = this.getNowDate();
      this.queryParams.patrolEndTime = this.getTomorrow();
      listPatrol(this.queryParams).then(response => {
        this.dayTableData = response.rows;
      });

      //获取周内任务
      this.queryParams.patrolStartTime = this.getWeek();
      this.queryParams.patrolEndTime = this.getTomorrow();
      listPatrol(this.queryParams).then(response => {
        this.weekTableData = response.rows;
      });

      //获取月内任务
      this.queryParams.patrolStartTime = this.getMoth();
      this.queryParams.patrolEndTime = this.getTomorrow();
      listPatrol(this.queryParams).then(response => {
        this.monthTableData = response.rows;
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
  padding: 25px 50px 5px 50px;
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

/*最外层透明*/
.el-table, .el-table__expanded-cell {
  background-color: transparent;
}

/* 表格内背景颜色 */
.el-table th,
.el-table tr,
.el-table td {
  background-color: transparent;
}
</style>

