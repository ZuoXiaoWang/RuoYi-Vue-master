<template>
  <div class="content">
    <div class="header">
      <div class="header_left">
        <el-tooltip placement="right" effect="light">
          <div slot="content">{{ textContent }}<br />{{ yesterdayText }}</div>
          <img
            src="../assets/images/trademark.png"
            alt=""
            class="header_trademark"
            @mouseenter="yesterday"
          />
        </el-tooltip>
      </div>
      <div class="header_right">
        <el-button type="text" class="header_right_text" @click="toHome"
          >后台管理</el-button
        >
        <Time class="header_right_time" />
      </div>
    </div>
    <div class="main">
      <div class="main_left">
        <div class="main_area_list">
          <el-table :data="areaList" style="width: 100%" max-height="108px">
            <el-table-column prop="regionId" label="ID"> </el-table-column>
            <el-table-column prop="name" label="区域名称" align="center">
            </el-table-column>
            <el-table-column prop="address" label="操作" align="right">
              <template slot-scope="scope">
                <el-button type="primary" @click="areaView(scope.row)"
                  >查看</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </div>
        <div class="main_patrol">
          <div class="main_patrol_number1">{{ routeListNum }}</div>
          <div class="main_patrol_number2">{{ pointListNum }}</div>
        </div>
        <div class="main_route">
          <el-table :data="routeList" style="width: 100%" max-height="108px">
            <el-table-column prop="patrolId" label="ID"> </el-table-column>
            <el-table-column prop="patrolDescribe" label="任务名称" width="150">
            </el-table-column>
            <el-table-column prop="patrolName" label="巡检人" width="200">
            </el-table-column>
            <el-table-column prop="address" label="操作" align="right">
              <template slot-scope="scope">
                <el-button type="primary" @click="routeView(scope.row)"
                  >查看</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </div>
        <div class="main_point">
          <el-table :data="pointList" style="width: 100%" max-height="108px">
            <el-table-column prop="patrolPointId" label="ID"> </el-table-column>
            <el-table-column
              prop="patrolPointName"
              label="点位名称"
              width="350"
            >
            </el-table-column>
            <el-table-column prop="address" label="操作" align="right">
              <template slot-scope="scope">
                <el-button type="primary" @click="pointView(scope.row)"
                  >查看</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
      <div class="main_center">
        <div class="main_map" id="map"></div>
        <div class="main_ranking">
          <el-table :data="rankingList" style="width: 100%" max-height="297px">
            <el-table-column type="index" label="排名" width="100">
              <template slot-scope="scope">
                <span>NO.{{ scope.$index + 1 }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="name" label="人员名称" align="center">
            </el-table-column>
            <el-table-column prop="quantity" label="数量" align="center">
            </el-table-column>
          </el-table>
        </div>
      </div>
      <div class="main_right">
        <div class="main_maintenance">
          <div class="main_maintenance_number1">{{ countRepairFrom }}</div>
          <div class="main_maintenance_number2">{{ countCompleteRepair }}</div>
        </div>
        <div class="main_repair_report">
          <el-table
            :data="repairReportList"
            style="width: 100%"
            max-height="108px"
          >
            <el-table-column prop="repairFromId" label="ID" width="50">
            </el-table-column>
            <el-table-column prop="personnelName" label="报修人" align="center">
            </el-table-column>
            <el-table-column
              prop="describe"
              label="报修描述"
              align="center"
              width="150"
            >
            </el-table-column>
            <el-table-column prop="state" label="状态" align="center">
              <template slot-scope="scope">
                <span>{{
                  scope.row.state == "0"
                    ? "开始维修"
                    : scope.row.state == "1"
                    ? "待料维修"
                    : "上报无法处理"
                }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="address" label="操作" align="right">
              <template slot-scope="scope">
                <el-button type="primary" @click="toNewRrepairFrom"
                  >查看</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </div>
        <div class="main_video"></div>
      </div>
    </div>
  </div>
</template>

<script>
import {
  regionList,
  patrolList,
  patrolInfo,
  countRepairFrom,
  countCompleteRepair,
  repairList,
  countLastWeekRepairAndFrom,
  getPersonnelWithQuantity,
  getPointsList,
  getEverydayComplete,
  getPotinStatusByPatrolId,
} from "@/api/visualization";
import Time from "../views/visualization/time.vue";
import * as echarts from "echarts";
//高德地图
import Map from "ol/Map";
import XYZ from "ol/source/XYZ";
import VectorTileLayer from "ol/layer/VectorTile";
import TileLayer from "ol/layer/Tile";
import TileWMS from "ol/source/TileWMS";
import VectorTile from "ol/source/VectorTile";
import View from "ol/View";
import "ol/ol.css";
//引入
import Feature from "ol/Feature";
import Polygon from "ol/geom/Polygon";
import geomCircle from "ol/geom/Circle";
import {
  Fill,
  Stroke,
  Style,
  Text,
  Icon,
  Circle as CircleStyle,
} from "ol/style";
import WMTS from "ol/tilegrid/WMTS";
import { createXYZ } from "ol/tilegrid";
import { MVT, GeoJSON } from "ol/format";
import VectorLayer from "ol/layer/Vector";
import Vector from "ol/source/Vector";
import { fromLonLat, Projection, transform, getTransform } from "ol/proj";
import Cluster from "ol/source/Cluster";
import Image from "ol/layer/Image";
import Point from "ol/geom/Point";
import LineString from "ol/geom/LineString";
//地图控件
import {
  defaults,
  ScaleLine,
  MousePosition,
  FullScreen,
  Control,
  OverviewMap,
  ZoomSlider,
} from "ol/control";
import { DoubleClickZoom } from "ol/interaction";
import {
  DragRotateAndZoom,
  defaults as defaultInteractions,
} from "ol/interaction";
export default {
  components: {
    Time,
  },
  data() {
    return {
      areaList: [], //区域列表
      countRepairFrom: "", //报修数量
      countCompleteRepair: "", //完成维修数量
      routeList: [], //巡更路线列表
      pointList: [], //巡更点列表
      rankingList: [], //巡更计划完成率排行
      routeListNum: "", //巡更任务数量
      pointListNum: "", //巡更点数量
      repairReportList: [], //报修列表
      positionLayer: null, //点位图层
      basicInfo: null, //聚合打点图层
      layer: null,
      textContent: "", //图标显示的信息
      repairReported: null, //昨日报修维修数量
      yesterdayText: "",
    };
  },
  mounted() {
    countLastWeekRepairAndFrom().then((res) => {
      this.repairReported = res;
      let weekBefore = [
        this.formatTime(new Date(new Date().getTime() - 86400000 * 7)),
        this.formatTime(new Date(new Date().getTime() - 86400000 * 6)),
        this.formatTime(new Date(new Date().getTime() - 86400000 * 5)),
        this.formatTime(new Date(new Date().getTime() - 86400000 * 4)),
        this.formatTime(new Date(new Date().getTime() - 86400000 * 3)),
        this.formatTime(new Date(new Date().getTime() - 86400000 * 2)),
        this.formatTime(new Date(new Date().getTime() - 86400000)),
      ];
      getEverydayComplete().then((data) => {
        this.videoChart(weekBefore, res, data);
      });
    });
    this.initMap();
  },
  created() {
    this.init();
  },
  methods: {
    yesterday() {
      this.textContent = `您好，该区域共有${this.pointListNum}个巡更点位、${this.routeListNum}项巡更任务；`;
      this.yesterdayText = `昨日共有${this.repairReported.repairFrom7}个报修，其中已完成维修数量为${this.repairReported.repair7}；
      详细情况请在系统中查看。`;
    },
    //点击查看区域
    areaView(row) {
      this.map.getView().animate({
        center: [
          row.regionLongitude + 0.00631647071057,
          row.regionLatitude + 0.00139113431802,
        ],
        zoom: 17,
        duration: "500",
      });
    },
    //点击查看巡更任务
    routeView(row) {
      this.map.removeLayer(this.positionLayer);
      if (this.basicInfo != null) {
        this.map.removeLayer(this.basicInfo.enterprise_cluster_layer);
      }
      if (this.layer != null) {
        this.map.removeLayer(this.layer);
      }
      patrolInfo(row.patrolId).then((res) => {
        let coordinateList = [];
        let ids = [];
        for (let i = 0; i < res.data.patrolPoints.length; i++) {
          coordinateList.push([
            res.data.patrolPoints[i].patrolPointLongitude + 0.00631647071057,
            res.data.patrolPoints[i].patrolPointLatitude + 0.00139113431802,
          ]);
        }
        getPotinStatusByPatrolId(row.patrolId).then((data) => {
          for (let i = 0; i < data.pointListStatus.length; i++) {
            const element = data.pointListStatus[i];
            ids.push(element.patrolPatrolPointStatus);
          }
        });
        this.markerCluster(coordinateList, ids);
        this.addLine(coordinateList);
      });
    },
    //绘制连线
    arrowLineStyles(feature, resolution) {
      console.log(resolution);
      let styles = [];
      // 线条样式
      let backgroundLineStyle = new Style({
        stroke: new Stroke({
          color: "rgba(67,142,219,0.5)",
          width: 5,
        }),
      });
      styles.push(backgroundLineStyle);
      let geometry = feature.getGeometry();
      // 获取线段长度
      const length = geometry.getLength();
      // 箭头间隔距离（像素）
      const step = 30;
      // 将间隔像素距离转换成地图的真实距离
      const StepLength = step * resolution;
      // 得到一共需要绘制多少个 箭头
      const arrowNum = Math.floor(length / StepLength);
      const rotations = [];
      const distances = [0];
      geometry.forEachSegment(function (start, end) {
        let dx = end[0] - start[0];
        let dy = end[1] - start[1];
        let rotation = Math.atan2(dy, dx);
        distances.unshift(Math.sqrt(dx ** 2 + dy ** 2) + distances[0]);
        rotations.push(rotation);
      });
      // 利用之前计算得到的线段矢量信息，生成对应的点样式塞入默认样式中
      // 从而绘制内部箭头
      for (let i = 1; i < arrowNum; ++i) {
        const arrowCoord = geometry.getCoordinateAt(i / arrowNum);
        const d = i * StepLength;
        const grid = distances.findIndex((x) => x <= d);

        styles.push(
          new Style({
            geometry: new Point(arrowCoord),
            image: new Icon({
              src: "/svg/jiantou.png",
              opacity: 0.8,
              anchor: [0.5, 0.5],
              rotateWithView: false,
              // 读取 rotations 中计算存放的方向信息
              rotation: -rotations[distances.length - grid - 1],
              scale: 0.11,
            }),
          })
        );
      }
      return styles;
    },
    addLine(arr) {
      let featureLine = new Feature({
        geometry: new LineString(arr),
      });
      let source = new Vector();
      source.addFeature(featureLine);
      this.layer = new VectorLayer({});
      this.layer.setStyle(this.arrowLineStyles);
      this.layer.setSource(source);
      this.map.addLayer(this.layer);
    },
    markerCluster(arr, ids) {
      let markerArr = [];
      // 聚合打点图层
      this.basicInfo = new Cluster({
        source: new Vector({
          features: [],
        }),
      });
      let style1 = new Style({
        image: new Icon({
          anchor: [0.5, 1],
          scale: 0.2,
          src: "/svg/fuwuqu.svg",
          color: "#52c41a",
        }),
      });
      this.basicInfo.enterprise_cluster_layer = new VectorLayer({
        source: this.basicInfo,
        style: style1,
        // zIndex: 7,
      });
      this.map.addLayer(this.basicInfo.enterprise_cluster_layer);
      arr.forEach(function (item) {
        var marker = new Feature({
          geometry: new Point(item),
        });
        // marker.setProperties({ type: "point", companyName: item.name });
        markerArr.push(marker);
      });
      this.basicInfo.getSource().addFeatures(markerArr);
    },
    //点击查看巡更点
    pointView(row) {
      this.map.removeLayer(this.positionLayer);
      if (this.basicInfo != null) {
        this.map.removeLayer(this.basicInfo.enterprise_cluster_layer);
      }
      if (this.layer != null) {
        this.map.removeLayer(this.layer);
      }
      this.positionIcon(
        [
          row.patrolPointLongitude + 0.00631647071057,
          row.patrolPointLatitude + 0.00139113431802,
        ],
        row.patrolPointId
      );
      this.map.getView().animate({
        center: [
          row.patrolPointLongitude + 0.00631647071057,
          row.patrolPointLatitude + 0.00139113431802,
        ],
        zoom: 18,
        duration: "500",
      });
    },
    positionIcon(center, patrolPointId) {
      var iconFeature = new Feature({
        geometry: new Point(center),
        custom: { id: patrolPointId },
      });
      var iconStyle = new Style({
        image: new Icon({
          anchor: [0.5, 1],
          scale: 0.2,
          anchorXUnits: "fraction",
          anchorYUnits: "pixels",
          src: "/svg/fuwuqu.svg",
          color: "#d4380d",
        }),
      });
      iconFeature.setStyle(iconStyle);
      var vectorSource = new Vector({
        features: [iconFeature],
      });
      this.positionLayer = new VectorLayer({
        source: vectorSource,
      });
      this.map.addLayer(this.positionLayer);
    },
    //时间格式
    formatTime(time) {
      let yesday =
        // time.getFullYear() +
        // "-" +
        (time.getMonth() > 9
          ? time.getMonth() + 1
          : "0" + (time.getMonth() + 1)) +
        "-" +
        (time.getDate() > 9 ? time.getDate() : "0" + time.getDate());
      return yesday;
    },
    //页面数据
    init() {
      regionList().then((res) => {
        this.areaList = res.sysRegions;
      });
      patrolList().then((res) => {
        this.routeList = res.sysPatrols;
        this.routeListNum = this.routeList.length;
      });
      countRepairFrom().then((res) => {
        this.countRepairFrom = res.countRepairFrom;
      });
      countCompleteRepair().then((res) => {
        this.countCompleteRepair = res.countCompleteRepair;
      });
      repairList().then((res) => {
        this.repairReportList = res.repairList;
      });
      getPersonnelWithQuantity().then((res) => {
        this.rankingList = res.data;
      });
      getPointsList().then((res) => {
        this.pointList = res.data;
        this.pointListNum = this.pointList.length;
      });
    },
    //跳转报修列表
    toNewRrepairFrom() {
      this.$router.push("/newRrepairFrom");
    },
    //跳转后台
    toHome() {
      this.$router.push("/dashboard/index");
    },
    //折线图
    videoChart(weekBefore, res, task) {
      var chartDom = document.getElementsByClassName("main_video")[0];
      var myChart = echarts.init(chartDom);
      var option;
      option = {
        title: {},
        tooltip: {
          trigger: "axis",
        },
        legend: {
          data: ["巡更任务完成量", "报修数量", "维修数量"],
          textStyle: {
            color: "#fff",
          },
        },
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          containLabel: true,
        },
        toolbox: {
          feature: {
            saveAsImage: {},
          },
        },
        xAxis: {
          type: "category",
          boundaryGap: false,
          data: weekBefore,
          axisLabel: {
            //修改坐标系字体颜色
            show: true,
            textStyle: {
              color: "#ffffff",
            },
            // interval: 0,
            // rotate: 20,
          },
        },
        yAxis: {
          type: "value",
          axisLabel: {
            //修改坐标系字体颜色
            show: true,
            textStyle: {
              color: "#ffffff",
            },
          },
        },
        series: [
          {
            name: "报修数量",
            type: "line",
            stack: "Total",
            data: [
              res.repairFrom7,
              res.repairFrom6,
              res.repairFrom5,
              res.repairFrom4,
              res.repairFrom3,
              res.repairFrom2,
              res.repairFrom1,
            ],
          },
          {
            name: "维修数量",
            type: "line",
            stack: "Total",
            data: [
              res.repair7,
              res.repair6,
              res.repair5,
              res.repair4,
              res.repair3,
              res.repair2,
              res.repair1,
            ],
          },
          {
            name: "巡更任务完成量",
            type: "line",
            stack: "Total",
            data: [
              task.date7,
              task.date6,
              task.date5,
              task.date4,
              task.date3,
              task.date2,
              task.date1,
            ],
          },
        ],
      };

      option && myChart.setOption(option);
    },
    // 初始化地图
    initMap() {
      let that = this;
      this.map = new Map({
        layers: [
          new TileLayer({
            visible: true,
            source: new XYZ({
              visible: true,
              url: "http://webrd01.is.autonavi.com/appmaptile?x={x}&y={y}&z={z}&lang=zh_cn&size=2&scale=1&style=8",
            }),
          }),
        ],
        target: "map",
        view: new View({
          center: [114.93505437071057, 40.75162492851887],
          zoom: 17,
          maxZoom: 18,
          projection: "EPSG:4326",
          constrainResolution: true, // 设置缩放级别为整数
          smoothResolutionConstraint: false, // 关闭无级缩放地图
        }),
      });
      // 删除默认的双击事件
      const dblClickInteraction = this.map
        .getInteractions()
        .getArray()
        .find((interaction) => {
          return interaction instanceof DoubleClickZoom;
        });
      this.map.removeInteraction(dblClickInteraction);
      //双击事件
      this.map.on("dblclick", (e) => {
        console.log(e.pixel, e.coordinate);
        if (e.dragging) {
          return;
        }
        var pixel = this.map.getEventPixel(e.originalEvent);
        this.map.forEachFeatureAtPixel(pixel, (ccc) => {
          this.map.getView().animate({
            center: e.coordinate, // 目标位置的坐标
            duration: "500", // 移动动画时长
            // zoom: 13, // 地图缩放层级
          });
        });
        // let featrue = this.positionLayer.getSource().getFeatures();
        // for(let i = 0;i< featrue.lengthl;i++){}
      });
      //鼠标移入事件
      this.map.on("pointermove", (e) => {
        var pixel = this.map.getEventPixel(e.originalEvent);
        var feature = this.map.forEachFeatureAtPixel(pixel, function (feature) {
          return feature;
        });
        if (feature == undefined) {
          that.map.getTargetElement().style.cursor = "auto";
        } else {
          that.map.getTargetElement().style.cursor = "pointer";
        }
      });
      //监听缩放
      this.map.on("moveend", function (e) {
        var zoom = that.map.getView().getZoom(); //获取当前地图的缩放级别
        // console.log(zoom);
      });
    },
  },
};
</script>

<style>
.content {
  /* width: 1920px;
  height: 969px; */
  width: 100%;
  height: calc(100%);
  background-image: url("../assets/images/visualization.jpg");
  background-size: 100% 100%;
  background-repeat: no-repeat;
  /* background-attachment: fixed; */
}
.header {
  width: 100%;
  height: 10%;
  display: flex;
  position: relative;
}
.header_left {
  width: 25%;
  height: 47%;
  position: absolute;
  left: 4%;
  top: 20%;
}
.header_trademark {
  position: relative;
  width: 9%;
  height: 81%;
  margin-left: 10%;
  margin-top: 1%;
  cursor: pointer;
}
.header_right {
  width: 25%;
  height: 47%;
  position: absolute;
  right: 4%;
  top: 20%;
  display: flex;
}
.header_right_text {
  color: #19edff;
  font-size: 16px;
  font-weight: bold;
  letter-spacing: 4px;
  cursor: pointer;
  margin-left: 36px;
  margin-right: 24px;
  padding-bottom: 6px;
}
.header_right_time {
  color: #19edff;
  font-size: 16px;
  font-weight: bold;
  letter-spacing: 2px;
}
.main {
  width: 100%;
  height: 90%;
  display: flex;
  position: relative;
}
.main_left {
  width: 33%;
  height: 100%;
  position: relative;
}
.main_area_list {
  width: 80%;
  height: 12%;
  position: absolute;
  right: 2%;
  top: 9.5%;
}
/* 改变表头背景色 */
.main_area_list .el-table .el-table__header-wrapper th,
.el-table .el-table__fixed-header-wrapper th {
  background: #000000;
  color: #ffe369;
  height: auto;
}
/* 去除表格边框 */
.main_area_list .el-table th.el-table__cell.is-leaf,
.el-table td.el-table__cell {
  border: none;
}
.main_area_list .el-table::before {
  background-color: #000;
}
/* 表格内边距，颜色，背景色 */
.main_area_list .el-table--medium .el-table__cell {
  padding: 2px 0;
}
.main_area_list .el-table {
  color: #ffe369;
}
.main_area_list .el-table tr {
  background: #000000;
}
/* 改变滚动条样式 */
.main_area_list .el-table__body-wrapper {
  background-color: #000000;
}
.main_area_list .el-table__body-wrapper::-webkit-scrollbar {
  width: 0 !important;
  height: 0 !important;
}
/* 鼠标移入表格背景色 */
.main_area_list .el-table .el-table__body tr:hover > td {
  background-color: rgba(255, 255, 255, 0.4) !important;
}
.main_area_list .el-table .el-table__body tr.current-row > td {
  background-color: rgba(255, 255, 255, 0.4) !important;
}
/* 按钮 */
.main_area_list .el-button--medium {
  padding: 2px;
  border-radius: 0;
  font-size: 14px;
}
.main_area_list .el-button--primary {
  background: #000000;
  background: -webkit-radial-gradient(#000000, #666666a6);
  border: 2px dashed #ffe369;
  color: #ffe369;
}
.main_patrol {
  width: 80%;
  height: 9.5%;
  position: absolute;
  right: 2%;
  top: 31%;
  display: flex;
}
.main_patrol_number1 {
  width: 30%;
  height: 50%;
  position: absolute;
  left: 10.5%;
  top: 45%;
  text-align: center;
  color: #33c5ff;
  font-size: 36px;
  font-weight: bold;
}
.main_patrol_number2 {
  width: 30%;
  height: 50%;
  position: absolute;
  right: 15.5%;
  top: 45%;
  text-align: center;
  color: #33c5ff;
  font-size: 36px;
  font-weight: bold;
}
.main_route {
  width: 80%;
  height: 12%;
  position: absolute;
  right: 2%;
  top: 51%;
}
/* 改变表头背景色 */
.main_route .el-table .el-table__header-wrapper th,
.el-table .el-table__fixed-header-wrapper th {
  background: #000000;
  color: #ffe369;
  height: auto;
}
/* 去除表格边框 */
.main_route .el-table th.el-table__cell.is-leaf,
.el-table td.el-table__cell {
  border: none;
}
.main_route .el-table::before {
  background-color: #000;
}
/* 表格内边距，颜色，背景色 */
.main_route .el-table--medium .el-table__cell {
  padding: 2px 0;
}
.main_route .el-table {
  color: #ffe369;
}
.main_route .el-table tr {
  background: #000000;
}
/* 改变滚动条样式 */
.main_route .el-table__body-wrapper {
  background-color: #000000;
}
.main_route .el-table__body-wrapper::-webkit-scrollbar {
  width: 0 !important;
  height: 0 !important;
}
/* 鼠标移入表格背景色 */
.main_route .el-table .el-table__body tr:hover > td {
  background-color: rgba(255, 255, 255, 0.4) !important;
}
.main_route .el-table .el-table__body tr.current-row > td {
  background-color: rgba(255, 255, 255, 0.4) !important;
}
/* 按钮 */
.main_route .el-button--medium {
  padding: 2px;
  border-radius: 0;
  font-size: 14px;
}
.main_route .el-button--primary {
  background: #000000;
  background: -webkit-radial-gradient(#000000, #666666a6);
  border: 2px dashed #ffe369;
  color: #ffe369;
}
.main_point {
  width: 80%;
  height: 12%;
  position: absolute;
  right: 2%;
  top: 72%;
}
/* 改变表头背景色 */
.main_point .el-table .el-table__header-wrapper th,
.el-table .el-table__fixed-header-wrapper th {
  background: #000000;
  color: #2eb2e7;
  height: auto;
}
/* 去除表格边框 */
.main_point .el-table th.el-table__cell.is-leaf,
.el-table td.el-table__cell {
  border: none;
}
.main_point .el-table::before {
  background-color: #000;
}
/* 表格内边距，颜色，背景色 */
.main_point .el-table--medium .el-table__cell {
  padding: 2px 0;
}
.main_point .el-table {
  color: #2eb2e7;
}
.main_point .el-table tr {
  background: #000000;
}
/* 改变滚动条样式 */
.main_point .el-table__body-wrapper {
  background-color: #000000;
}
.main_point .el-table__body-wrapper::-webkit-scrollbar {
  width: 0 !important;
  height: 0 !important;
}
/* 鼠标移入表格背景色 */
.main_point .el-table .el-table__body tr:hover > td {
  background-color: rgba(255, 255, 255, 0.4) !important;
}
.main_point .el-table .el-table__body tr.current-row > td {
  background-color: rgba(255, 255, 255, 0.4) !important;
}
/* 按钮 */
.main_point .el-button--medium {
  padding: 2px;
  border-radius: 0;
  font-size: 14px;
}
.main_point .el-button--primary {
  background: #000000;
  background: -webkit-radial-gradient(#000000, #666666a6);
  border: 2px dashed #2eb2e7;
  color: #2eb2e7;
}
.main_center {
  width: 36%;
  height: 100%;
  position: relative;
}
.main_map {
  width: 90%;
  height: 35.5%;
  position: absolute;
  top: 7%;
  left: 6%;
}
.main_ranking {
  width: 76%;
  height: 33%;
  position: absolute;
  top: 51%;
  left: 6%;
}
/* 改变表头背景色 */
.main_ranking .el-table .el-table__header-wrapper th,
.el-table .el-table__fixed-header-wrapper th {
  background: #000000;
  color: #ffe369;
  height: auto;
}
/* 去除表格边框 */
.main_ranking .el-table th.el-table__cell.is-leaf,
.el-table td.el-table__cell {
  border: none;
}
.main_ranking .el-table::before {
  background-color: #000;
}
/* 表格内边距，颜色，背景色 */
.main_ranking .el-table--medium .el-table__cell {
  padding: 2px 0;
}
.main_ranking .el-table {
  color: #ffe369;
}
.main_ranking .el-table tr {
  background: #000000;
}
/* 改变滚动条样式 */
.main_ranking .el-table__body-wrapper {
  background-color: #000000;
}
.main_ranking .el-table__body-wrapper::-webkit-scrollbar {
  width: 0 !important;
  height: 0 !important;
}
/* 鼠标移入表格背景色 */
.main_ranking .el-table .el-table__body tr:hover > td {
  background-color: rgba(255, 255, 255, 0.4) !important;
}
.main_ranking .el-table .el-table__body tr.current-row > td {
  background-color: rgba(255, 255, 255, 0.4) !important;
}
/* 按钮 */
.main_ranking .el-button--medium {
  padding: 2px;
  border-radius: 0;
  font-size: 14px;
}
.main_ranking .el-button--primary {
  background: #000000;
  background: -webkit-radial-gradient(#000000, #666666a6);
  border: 2px dashed #ffe369;
  color: #ffe369;
}
.main_right {
  width: 31%;
  height: 100%;
  position: relative;
}
.main_maintenance {
  width: 70%;
  height: 9%;
  position: absolute;
  right: 18%;
  top: 10.5%;
  display: flex;
}
.main_maintenance_number1 {
  width: 30%;
  height: 50%;
  position: absolute;
  left: 9%;
  top: 45%;
  text-align: center;
  color: #33c5ff;
  font-size: 36px;
  font-weight: bold;
}
.main_maintenance_number2 {
  width: 30%;
  height: 50%;
  position: absolute;
  right: 8.5%;
  top: 45%;
  text-align: center;
  color: #33c5ff;
  font-size: 36px;
  font-weight: bold;
}
.main_repair_report {
  width: 80%;
  height: 12%;
  position: absolute;
  right: 12%;
  top: 30%;
}
/* 改变表头背景色 */
.main_repair_report .el-table .el-table__header-wrapper th,
.el-table .el-table__fixed-header-wrapper th {
  background: #000000;
  color: #ffe369;
  height: auto;
}
/* 去除表格边框 */
.main_repair_report .el-table th.el-table__cell.is-leaf,
.el-table td.el-table__cell {
  border: none;
}
.main_repair_report .el-table::before {
  background-color: #000;
}
/* 表格内边距，颜色，背景色 */
.main_repair_report .el-table--medium .el-table__cell {
  padding: 2px 0;
}
.main_repair_report .el-table {
  color: #ffe369;
}
.main_repair_report .el-table tr {
  background: #000000;
}
/* 改变滚动条样式 */
.main_repair_report .el-table__body-wrapper {
  background-color: #000000;
}
.main_repair_report .el-table__body-wrapper::-webkit-scrollbar {
  width: 0 !important;
  height: 0 !important;
}
/* 鼠标移入表格背景色 */
.main_repair_report .el-table .el-table__body tr:hover > td {
  background-color: rgba(255, 255, 255, 0.4) !important;
}
.main_repair_report .el-table .el-table__body tr.current-row > td {
  background-color: rgba(255, 255, 255, 0.4) !important;
}
/* 按钮 */
.main_repair_report .el-button--medium {
  padding: 2px;
  border-radius: 0;
  font-size: 14px;
}
.main_repair_report .el-button--primary {
  background: #000000;
  background: -webkit-radial-gradient(#000000, #666666a6);
  border: 2px dashed #ffe369;
  color: #ffe369;
}
.main_video {
  width: 95%;
  height: 33%;
  position: absolute;
  right: 12%;
  top: 51%;
}
</style>
