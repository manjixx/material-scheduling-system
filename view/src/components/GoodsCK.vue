<template>
  <div>
   <el-card >
     <el-row class="padding-xs" type="flex" :gutter="50">
       <el-col :span="12" class="padding-xs">
         <div>
            <el-input
              placeholder="请输入地址"
              v-model="input3"
              class="input-with-select"
            >
              <el-button slot="append" icon="el-icon-search" @click="inputfz"
                >搜索啊</el-button
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
                @searchcomplete="search"
                :auto-viewport="true"
                class="search"
              ></bm-local-search>
              <!-- 缩放控件   anchor代表控件停靠位置   anchor="BMAP_ANCHOR_TOP_RIGHT"代表放在右上角-->
              <bm-navigation anchor="BMAP_ANCHOR_TOP_RIGHT"></bm-navigation>

              <!-- <bm-marker 	v-for="(item, index) in markers" :key="index + '_'" :position="item.value" @click="lookDetail(item.value)"> -->
                <bm-marker  v-for="marker of markers" :position="{lng: marker.lng, lat: marker.lat}" @click="lookDetail(marker)">
                  <bm-info-window :title="infoWindow.name" :position="{lng: infoWindow.lng, lat: infoWindow.lat}"   :show="marker.showFlag" @close="infoWindowClose(marker)" @open="infoWindowOpen(marker)">
                  </bm-info-window>
                      <!-- <bm-info-window title="车辆信息" :position="{lng: marker.lng, lat: marker.lat}"   :show="marker.showFlag" @close="infoWindowClose(marker)" @open="infoWindowOpen(marker)"></bm-info-window> -->
              </bm-marker>
            </baidu-map>
          </div>
       </el-col>
       <el-col :span="12" class="padding-xs">
          <div id="myChart"  class="echarts-view"></div>
       </el-col>
      </el-row>
    </el-card>


    <!--内容卡片区域-->
    <el-card class="box-card">
      <!--头部搜索区域-->
      <el-row>
        <el-form :model="searchData" class="demo-form-inline">
          <el-col :span="3">
            <el-form-item>
              <el-button type="success" @click="showAddHealthDialog('createForm')">每日健康上报</el-button>
            </el-form-item>
          </el-col>
          <el-col :span="19">
            <el-form-item label="" style="width: 100%">
              <el-input v-model="searchData.key" placeholder="输入用户名关键字"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="2">
            <el-form-item class="query_role">
              <el-button type="primary" @click="onSubmit">查询</el-button>
            </el-form-item>
          </el-col>
        </el-form>
      </el-row>
      <!--中间表格区域-->
      <el-table
        :data="tableData"
        style="width: 100%"
        :border="true"
        :stripe="true">
        <el-table-column type="index">
        </el-table-column>
        <el-table-column
          prop="healthsName"
          label="用户名">
        </el-table-column>
        <el-table-column
          prop="healthsSex"
          label="性别">
        </el-table-column>
        <el-table-column
          prop="healthsJob"
          label="所在部门">
        </el-table-column>
        <el-table-column
          prop="healthsHeat"
          label="今日体温">
        </el-table-column>
        <el-table-column label="状态">
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.healthsState"
              active-color="#ff4949"
              inactive-color="#13ce66"
              disabled
            >
            </el-switch>
          </template>
        </el-table-column>
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




  
    <!--添加编辑权限对话框-->
    <el-dialog
      title="每日健康情况收集-4月13日"
      :visible.sync="healthDialogVisible"
      width="30%">
      <el-form ref="createForm" :model="healthData"  :rules="healthRules" label-width="80px">
        <el-form-item label="用户名">
          <el-input v-model="healthData.healthsName"
                    disabled
                    prefix-icon="el-icon-user"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="healthsSex">
          <el-select v-model="healthData.healthsSex">
            <el-option label="男" value="1"></el-option>
            <el-option label="女" value="0"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="所在部门" prop="healthsJob">
          <el-select v-model="healthData.healthsJob">
            <el-option label="研发" value="研发"></el-option>
            <el-option label="市场" value="市场"></el-option>
            <el-option label="人事" value="人事"></el-option>
            <el-option label="售前" value="售前"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="今日体温" prop="healthsHeat">
          <el-input v-model="healthData.healthsHeat"
                    prefix-icon="el-icon-info"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
                <el-button @click="healthDialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="createHealths('createForm')">确 定</el-button>
            </span>
    </el-dialog>
  </div>
</template>

<script>
import { getHealths, createHealths } from '../api/index';
import {
  BaiduMap,
  BmControl,
  BmView,
  BmAutoComplete,
  BmLocalSearch,
  BmMarker,
  BmGeolocation,
} from "vue-baidu-map";
export default {
  name: 'Roles',
  //需要引入的组件
  components: {
    BaiduMap,
    BmControl,
    BmView,
    BmAutoComplete,
    BmLocalSearch,
    BmMarker,
    BmGeolocation,
  },
  data() {
    return {
      //定位位置信息
      center: {},
      //检索关键字
      keyword: "",
      //输入框input值
      input3: "",

      tableData: [],
      searchData: {
        key: '',
        currentPage: 1,
        pageSize: 5
      },
      totalCount: 0,
      healthRules: {
        healthsSex: [
          { required: true, message: '请选择性别', trigger: 'change' }
        ],
        healthsJob: [
          { required: true, message: '请输入部门', trigger: 'blur' },
          { min: 1, message: '长度至少1个字符', trigger: 'blur' }
        ],
        healthsHeat: [
          { required: true, message: '请输入当前体温', trigger: 'blur' },
          { min: 2, message: '长度至少2个字符', trigger: 'blur' }
        ]
      },
      healthDialogVisible: false,
      healthData: {
        healthsName: '',
        healthsSex: '',
        healthsJob: '',
        healthsHeat: '',
        healthsState: 0
      },
      markers : [
        {lng: 108.943546, lat: 34.157663, name: "仓库1", showFlag: false},
        {lng: 108.942139, lat: 34.218583, name: "仓库2", showFlag: false},
        {lng: 108.945914, lat:34.146892, name: "仓库3", showFlag: false},
        {lng: 108.855956, lat: 34.201364, name: "仓库4", showFlag: false}
      ],
      // markers : [
      //   {value: {lng: 108.943546, lat: 34.157663, name: "仓库1", showFlag: false}},
      //   {value: {lng: 108.942139, lat: 34.218583, name: "仓库2", showFlag: false}},
      //   {value: {lng: 108.945914, lat:34.146892, name: "仓库3", showFlag: false}},
      //   {value: {lng: 108.855956, lat: 34.201364, name: "仓库4", showFlag: false}}
      // ],
      infoWindow:{},
    };
  },
  created() {
    const userInfo = sessionStorage.getItem('userInfo');
    if (userInfo) {
      this.healthData.healthsName = JSON.parse(userInfo).username;
    }
    this.getHealthsList();
  },
  mounted(){
    this.initEcharts();
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
    initEcharts(){
      // 基于刚刚准备好的 DOM 容器，初始化 EChart 实例
      let myChart = this.$echarts.init(document.getElementById('myChart'))
      // 绘制图表
      let option = {
        title: {text:'物资储备状态', subtext:'2022-4-13 11:57', left:'center', bottom:'bottom'},

        legend:{
          orient: 'vertical',
          left: 'right',
          data: ['口罩', '体温计', '防护服', '酒精']
        },
        series: [{ 
          name: '物资情况',
          type: 'pie',        
          label:{
          normal:{
            show:true,
            formatter: '{b}: {c}({d}%)'
          }
        },
          data: [
            {value: 200, name: '口罩'},
            {value: 100, name: '体温计'},
            {value: 230, name: '防护服'},
            {value: 30, name: '酒精'}, 
          ],  
        }] //配置项
      };
      // 4.传入数据
      myChart.setOption(option);
    },


    resetDefaultActivePath() {
      sessionStorage.removeItem('activePath');
    },
    // 搜索相关代码
    onSubmit() {
      this.getHealthsList();
    },
    getHealthsList() {
      // 获取分页权限列表
      getHealths(this.searchData)
        .then((response) => {
          if (response.status === 200) {
            response.data.healths.forEach(item => {
              item.healthsSex = item.healthsSex ? '男' : '女';
            });
            this.tableData = response.data.healths;
            this.totalCount = response.data.totalCount;
          } else {
            this.$message.error(response.msg);
          }
        })
        .catch((error) => {
          this.$message.error(error.msg);
        });
    },

    // 健康上报相关代码
    showAddHealthDialog(formName) {
      this.healthDialogVisible = true;
      if (this.$refs[formName]) {
        this.$refs[formName].resetFields();
      }
    },
    createHealths(formName) {
      this.healthData.healthsName = JSON.parse(sessionStorage.getItem('userInfo')).username;
      this.$refs[formName].validate((flag) => {
        if (flag) {
          // 排除已填报
          const idx = this.tableData.some(item => {
            return item.healthsName === this.healthData.healthsName;
          });
          if (idx) {
            this.$message.error('请勿重复填报');
            return;
          }

          this.healthDialogVisible = false;
          const healthsSex = parseFloat(this.healthData.healthsSex);
          if (healthsSex === 1) {
            this.healthData.healthsSex = true;
          } else {
            this.healthData.healthsSex = false;
          }
          const healthsHeat = parseFloat(this.healthData.healthsHeat);
          if (healthsHeat > 37.2) {
            this.healthData.healthsState = true;
          } else {
            this.healthData.healthsState = false;
          }
          console.log(this.healthData);
          createHealths(this.healthData)
            .then((response) => {
              if (response.status === 200) {
                this.getHealthsList();
                this.$message.success(response.msg);
              } else {
                this.$message.error(response.msg);
              }
            })
            .catch((error) => {
              this.$message.error(error.msg);
            });
        } else {
          this.$message.error('数据格式不对');
        }
      });
    },

    // 分页相关代码
    handleSizeChange(currentSize) {
      this.searchData.pageSize = currentSize;
      this.getHealthsList();
    },
    handleCurrentChange(currentPage) {
      this.searchData.currentPage = currentPage;
      this.getHealthsList();
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
  height: 450px;
  width: 700px;
}

  .el-breadcrumb{
    padding-bottom: 20px;
  }
  .demo-form-inline{
    display: flex;
    justify-content: center;
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
</style>
