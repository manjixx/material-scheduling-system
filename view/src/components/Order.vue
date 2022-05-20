<template>
  <div>
    <!--面包屑导航-->
    <el-breadcrumb separator="/">
      <el-breadcrumb-item><a href="/admin" @click="resetDefaultActivePath">首页</a></el-breadcrumb-item>
      <el-breadcrumb-item>工单管理</el-breadcrumb-item>
    </el-breadcrumb>
     <!--内容卡片区域-->
   <el-card >

     <el-row class="padding-xs" type="flex" :gutter="50" >
      <el-col :span="12" class="padding-xs" 
      v-show="this.searchData.roleid==2" >
        <div id="myChart-status"  class="echarts-view"></div>
      </el-col>
       <el-col :span="12" class="padding-xs" v-show="this.searchData.roleid==2">
          <div id="myChart-fenbu"  class="echarts-view" ></div>
       </el-col>
       <el-col :span="12" class="padding-xs" v-show="this.searchData.roleid==3">
         <div>
            <el-input
              placeholder="请输入地址"
              v-model="input3"
              class="input-with-select"
            >
              <el-button slot="append" icon="el-icon-search" @click="inputfz"
                >搜索</el-button
              >
            </el-input>
            <!-- 
          scroll-wheel-zoom是是否可以缩放
          @ready是图加载完后触发事件
          center是位置定位
          zoom是缩放大小限制
          inertial-dragging是允许惯性拖拽
        -->
            <baidu-map
              class="bm-view"
              :zoom="15"
              :center="center"
              inertial-dragging
              @ready="mapReady"
              :scroll-wheel-zoom="true"
            >
              <!-- 定位控件   anchor="BMAP_ANCHOR_BOTTOM_RIGHT"代表放在右下角 -->
              <bm-geolocation
                anchor="BMAP_ANCHOR_BOTTOM_RIGHT"
                :showAddressBar="true"
                :autoLocation="true"
              ></bm-geolocation>
              <!-- 地区检索  keyword：关键字搜索   @searchcomplete：检索完成后的回调函数   auto-viewport：检索结束后是否自动调整地图事业  -->
              <bm-local-search
                :keyword="keyword"
                :auto-viewport="true"
                class="search"
              ></bm-local-search>
              <!-- 缩放控件   anchor代表控件停靠位置   anchor="BMAP_ANCHOR_TOP_RIGHT"代表放在右上角-->
              <bm-navigation anchor="BMAP_ANCHOR_TOP_RIGHT"></bm-navigation>
                <bm-marker  v-for="marker of markers" :position="{lng: marker.lng, lat: marker.lat}" @click="lookDetail(marker)">
                  <bm-info-window :title="infoWindow.name" :position="{lng: infoWindow.lng, lat: infoWindow.lat}"   :show="marker.showFlag" @close="infoWindowClose(marker)" @open="infoWindowOpen(marker)">
                  </bm-info-window>
              </bm-marker>
            </baidu-map>
          </div>
       </el-col>
       <el-col :span="12" class="padding-xs" v-show="this.searchData.roleid==3">
            <el-table ref="resultTable"
        :data="storetableData"
        style="width: 100%"
        :border="true"
        :stripe="true" 
        highlight-current-row>
        <el-table-column label width="40">
				  <template slot-scope="scope">
            <el-radio :label="scope.$index" v-model="radio" @change.native="handleSelectionChange(scope.row)" >&nbsp;</el-radio>
				  </template>
			</el-table-column>
        <el-table-column type="index">
        </el-table-column>
        <el-table-column
          prop="storename"
          label="仓库名称">
        </el-table-column>
        <el-table-column
          prop="distance"
          label="距离">
        </el-table-column>
        <el-table-column
          prop="duration"
          label="预计时间">
        </el-table-column>
        <el-table-column
          prop="address"
          label="仓库地址">
        </el-table-column>
        <el-table-column
          prop="phone"
          label="联系电话">
        </el-table-column>
        <el-table-column
          prop="store_id"
          label="仓库id"
           v-if=false
          >
        </el-table-column>
      </el-table>
        </el-col>
      </el-row>
    </el-card>
    
    <!-- 表格区域 -->
   <el-card >
      <!--头部搜索区域-->
      <el-row>
        <el-col :span="22">
          <el-form :inline="true" :model="searchData" class="demo-form-inline">
            <el-form-item>
              <el-input v-model="searchData.goodsOutName"  placeholder="物资名称" clearable></el-input>
            </el-form-item>
            <el-form-item label="">
              <el-date-picker
                clearable
                v-model="searchData.goodsOutDate"
                type="date"
                format="yyyy 年 MM 月 dd 日"
                value-format="yyyy-MM-dd"
                placeholder="领用日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="onSubmit">查询</el-button>
            </el-form-item>
          </el-form>
        </el-col>
        <el-col :span="2">
        </el-col>
      </el-row>
      <!--中间表格区域-->
      <el-table
        :data="tableData"
        style="width: 100%"
        :border="true"
        :stripe="true">
        <el-table-column sortable prop="order_id"  align="center" width="50">
        </el-table-column>   
        <el-table-column sortable sort-by=status label="状态" align="center" width="80">
        <template slot-scope="scope">
            <el-tag type="warning" effect="dark" v-if="scope.row.status==0">待处理</el-tag>
            <el-tag type="danger" effect="dark" v-if="scope.row.status==1">配送中</el-tag>
            <el-tag type="success" effect="dark" v-if="scope.row.status==2">已完成</el-tag>
            <el-tag type="info" effect="dark" v-if="scope.row.status==3">已拒单</el-tag>
        </template>
    </el-table-column>
        <el-table-column  sortable prop="expected_at" label="预约日期"> </el-table-column>
        <el-table-column prop="goodsName" label="物资"> </el-table-column>
        <el-table-column  prop="quantity" label="数量"> </el-table-column>
        <el-table-column prop="contact_name" label="联系人"> </el-table-column>
        <el-table-column  prop="contact_phone" label="联系电话"> </el-table-column>
        <el-table-column prop="address" label="地址"> </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button type="primary" icon="el-icon-check" v-if="searchData.roleid==2&&scope.row.status==0" @click="changeOrderStatus(scope.row, 1)"></el-button>
            <el-button type="primary" icon="el-icon-circle-close" v-if="searchData.roleid==2&&scope.row.status==0" @click="changeOrderStatus(scope.row, 3)"></el-button>
            <el-tooltip class="item" effect="dark" content="删除工单" placement="top" :enterable="false">
              <el-button type="danger" icon="el-icon-delete" v-if="searchData.roleid == 3" @click="destroyOrder(scope.row.order_id)"></el-button>
            </el-tooltip>
          </template>
        </el-table-column>
        <el-table-column prop="order_id" label="id" v-if=false > </el-table-column>
        <el-table-column prop="status" label="status" v-if=false > </el-table-column>
        <el-table-column prop="comment" label="comment" v-if=false > </el-table-column>
        <el-table-column prop="user_rev_id" label="user_rev_id" v-if=false > </el-table-column>
      </el-table>
    </el-card>

    <!--底部分页区域-->
    <el-pagination
      :current-page="searchData.currentPage"
      :page-sizes="[5, 10, 20, 50]"
      :page-size="searchData.pageSize"
      :total="totalCount"
      layout="total, sizes, prev, pager, next, jumper"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange">
    </el-pagination>

  </div>
</template>

<script>
import { getOrders, destroyOrder, updateOrder} from '../api/index';
import { getStores } from '../api/index';
import {
  BaiduMap, BmControl, BmView, BmAutoComplete, BmLocalSearch, BmMarker, BmGeolocation,
} from "vue-baidu-map";
export default {
  name: 'Order',
  components: {
    BaiduMap, BmControl, BmView, BmAutoComplete, BmLocalSearch, BmMarker, BmGeolocation,
  },
  data() {
    return {
      // 创建工单相关
       searchData: {
        user_id: 0,
        roleid: 0, 
        contact_name: '',
        status: 0,
        expected_at: '',
        currentPage: 1,
        pageSize: 10
      },
      totalCount: 0,
      storeCount: 0,
      tableData: [],
      storetableData: [],
      storeList: [],
      createGoodsInDialogVisible: false,
      orderData: {
        user_req_id: 0,
        contact_name: '',
        contact_phone: '',
        address: '',
        status: 0,
        expected_at: '',
        CreatedAt: ''
      },

      // 地图相关
      //定位位置信息
      center: {},
      //检索关键字
      keyword: "",
      //输入框input值
      input3: "",
      markers : [
        {lng: 108.943546, lat: 34.157663, name: "工单1", showFlag: false},
        {lng: 108.942139, lat: 34.218583, name: "工单2", showFlag: false},
        {lng: 108.945914, lat:34.146892, name: "工单3", showFlag: false},
        {lng: 108.855956, lat: 34.201364, name: "工单4", showFlag: false}
      ],
      infoWindow:{},
    };
  },
  mounted(){
    const userInfo = sessionStorage.getItem('userInfo');
    if (userInfo) {
      const userinfo = JSON.parse(userInfo)
      console.log('userInfo-----------',userinfo);
      this.searchData.user_id = userinfo.id;
      this.searchData.roleid = userinfo.roles[0].id;
        console.log(this.searchData.roleid);
      if (this.searchData.roleid == 2){
        this.initEcharts_status();
        this.initEcharts_fenbu();
      }
      this.getOrders();
    }
  },
  methods: {
            // 点击点坐标赋值
      lookDetail(marker){
        marker.showFlag = true;
        this.infoWindow = marker;
      },
      // 关闭弹窗
      infoWindowClose(marker) {
        marker.showFlag = false
      },
      // 打开弹窗
      infoWindowOpen(marker) {
        marker.showFlag = true
      },

 //输入框
    inputfz() {
      this.keyword = this.input3;
    },
    //地图加载后的回调
    mapReady({ BMap, map }) {
      //保存this指向，因为在百度的回调中this不指向vue
      const _this = this;
      // 获取自动定位方法
      var geolocation = new BMap.Geolocation();
      // 获取自动定位获取的坐标信息
      geolocation.getCurrentPosition(
        function (r) {
          //可以conso.log看一下这个r，他里面包含了检索到的位置信息。下面就把两个维度信息赋值给center来定位
          _this.center = {
            lng: r.point.lng,
            lat: r.point.lat,
          };
        },
        
        //启用高精度
        { enableHighAccuracy: true }
      );
    },
    initEcharts_status(){
     // 基于刚刚准备好的 DOM 容器，初始化 EChart 实例
      let myChart = this.$echarts.init(document.getElementById('myChart-status'));
      // 绘制图表
      let option = {
        title: {text:'仓库状态', subtext:'2022-4-13 11:57', left:'center', bottom:'bottom'},

        legend:{
          orient: 'vertical',
          left: 'right',
          data: ['在库中', '已送达', '已发出']
        },
        series: [{ 
          name: '仓库状态',
          type: 'pie',        
          label:{
          normal:{
            show:true,
            formatter: '{b}: {c}({d}%)'
          }
        },
          data: [
            {value: 200, name: '在库中'},
            {value: 100, name: '已送达'},
            {value: 230, name: '已发出'},
          ],  
        }] //配置项
      };
      // 4.传入数据
      myChart.setOption(option);
    },
    initEcharts_fenbu(){
      // 基于刚刚准备好的 DOM 容器，初始化 EChart 实例
      let myChart = this.$echarts.init(document.getElementById("myChart-fenbu"))
      // 绘制图表
      let option = {
        title: {text:'分布区域', subtext:'2022-4-13 11:57', left:'center', bottom:'bottom'},

        legend:{
          orient: 'vertical',
          left: 'right',
          data: ['汉城路', '后卫寨', '上林街道', '三桥街道']
        },
        series: [{ 
          name: '工单分布',
          type: 'pie',        
          label:{
          normal:{
            show:true,
            formatter: '{b}: {c}({d}%)'
          }
        },
          data: [
            {value: 20, name: '汉城路'},
            {value: 10, name: '后卫寨'},
            {value: 30, name: '上林街道'},
            {value: 30, name: '三桥街道'}, 
          ],  
        }] //配置项
      };
      // 4.传入数据
      myChart.setOption(option);
    },

    // 跳转首页
    resetDefaultActivePath() {
      sessionStorage.removeItem('activePath');
    },
    // 查询
    onSubmit() {
      this.getOrders();
    },

   // 编辑工单相关代码
    changeOrderStatus(orderdata, scode){
      orderdata.status = scode;
      console.log('orderdata: ', orderdata);
      this.updateOrder(orderdata);
    },
    updateOrder(orderdata) {
      updateOrder(orderdata.order_id, orderdata)
        .then(res => {
          if (res.status === 200) {
            const idx = this.tableData.findIndex((obj) => {
              return obj.order_id === orderdata.order_id;
            });
            this.$set(this.tableData, idx, orderdata);
            this.getOrders();
            this.$message.success('更新订单状态成功');
          } else {
            this.$message.error(res.msg);
          }
        })
        .catch(e => {
          this.$message.error(e.msg);
        });
    },




   destroyOrder(id) {
      destroyOrder(id)
        .then(res => {
          if (res.status === 200) {
            const idx = this.tableData.findIndex((obj) => {
              return obj.order_id === id;
            });
            this.tableData.splice(idx, 1);
            this.$message.success('删除工单成功');
            this.getRoleList();
          } else {
            this.$message.error(res.msg);
          }
        })
        .catch(e => {
          this.$message.error(e.msg);
        });
    },


    getStores(Id){
      getStores({user_id:Id}).then(res => {
        console.log(res);
        if (res.status === 200) {
          this.storeList = res.data;
          this.searchData.user_id = res.data.id;
          // this.storeList = res.data.sts;
          // this.storeCount = res.data.totalCount;
          // this.storeList.forEach((s) => {
          //   this.searchData.user_id.push(s.id)
          // });
        } else {
          this.$message.error(res.msg);
        }

      console.log("storelist:");
      console.log(this.searchData.user_id);
      });

    },
    // 分页相关代码
    getOrders() {
      // if (!this.searchData.goodsOutDate) {
      //   this.searchData = Object.assign({}, this.searchData, { goodsOutDate: '' });
      // }
      console.log("getOrders:");
      console.log(this.searchData);
      getOrders(this.searchData)
        .then(res => {
          console.log(res);
          if (res.status === 200) {
            this.tableData = res.data.rets;
            this.totalCount = res.data.totalCount;
            console.log(res.data);
          } else {
            this.$message.error(res.msg);
          }
        })
        .catch((e) => {
          this.$message.error(e.msg);
        });
    },
    handleSizeChange(currentSize) {
      // console.log(currentSize);
      this.searchData.pageSize = currentSize;
      this.getOrders();
    },
    handleCurrentChange(currentPage) {
      // console.log(currentPage);
      this.searchData.currentPage = currentPage;
      this.getOrders();
    }
  }
};
</script>

<style lang="scss" scoped>

/* 给个宽高 */
.bm-view {
  height: 400px;
  width: 700px;
}
.input-with-select {
  width: 400px;
  margin-bottom: 5px;
}
.search {
  height: 300px;
  overflow: auto;
}
.echarts-view {
  height: 400px;
  width: 700px;
}
  .el-breadcrumb{
    padding-bottom: 20px;
  }
  .demo-form-inline{
    display: flex;
    justify-content: left;
  }
  .query_role{
    padding: 0 20px;
  }
  .el-pagination{
    padding-top: 20px;
  }
  .el-tag{
    margin: 10px;
  }
  .top-border{
    border-top: 1px solid #ccc;
  }
  .bottom-border{
    border-bottom: 1px solid #ccc;
  }
  .content-center{
    display: flex;
    align-items: center;
  }
  .rights-dialog{
    ::v-deep .el-dialog__body {
      height: 500px;
      overflow-x: hidden;
      overflow-y: auto;
    }
  }
</style>
