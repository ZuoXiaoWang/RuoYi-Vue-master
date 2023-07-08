<!--
 * @Author: your name
 * @Date: 2021-10-27 11:30:48
 * @LastEditTime: 2021-10-27 11:36:26
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \灰名单\src\components\time\index.vue
-->
<template>
  <span
    style="  display: inline-block;line-height: 50px;
    margin-left: 8px;"
    >{{ date }}</span
  >
</template>

<script>
Date.prototype.format = function(fmt) {
  var o = {
    "M+": this.getMonth() + 1, //月份
    "d+": this.getDate(), //日
    "H+": this.getHours(), //小时
    "m+": this.getMinutes(), //分
    "s+": this.getSeconds(), //秒
    "q+": Math.floor((this.getMonth() + 3) / 3), //季度
    "S+": this.getMilliseconds() //毫毛
  };
  if (/(y+)/.test(fmt))
    fmt = fmt.replace(
      RegExp.$1,
      (this.getFullYear() + "").substr(4 - RegExp.$1.length)
    );
  for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt))
      fmt = fmt.replace(
        RegExp.$1,
        RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length)
      );
  return fmt;
};
export default {
  props: {},
  data() {
    return { date: new Date().format("yyyy-MM-dd HH:mm:ss ") };
  },
  computed: {},
  created() {
  },
  mounted() {
    let _this = this; // 声明一个变量指向Vue实例this，保证作用域一致
    this.timer = setInterval(() => {
      _this.date = new Date().format("yyyy-MM-dd HH:mm:ss "); // 修改数据date
    }, 1000);
  },
  watch: {},
  methods: {},
  components: {},
  beforeDestroy() {
    if (this.timer) {
      clearInterval(this.timer); // 在Vue实例销毁前，清除我们的定时器
    }
  }
};
</script>

<style scoped lang="scss"></style>
