<template>
  <div>
    <!--面包屑导航-->
    <el-breadcrumb separator="/">
      <el-breadcrumb-item><a href="/admin" @click="resetDefaultActivePath">首页</a></el-breadcrumb-item>
    </el-breadcrumb>
     <!--内容卡片区域-->
   <el-card>
     <el-row class="padding-xs" type="flex" :gutter="50">
       <el-col :span="12" class="padding-xs">
         <div>
            <el-input
              placeholder="请输入地址"
              v-model="input3"
              class="input-with-select"
            >
              <el-button slot="append" icon="el-icon-search" @click="inputfz"
                >确定</el-button
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
              <div id="r-result" style="position: fixed; top: 100px; right: 5px"></div>    
              <!-- 地区检索  keyword：关键字搜索   @searchcomplete：检索完成后的回调函数   auto-viewport：检索结束后是否自动调整地图事业  -->
              <bm-local-search
                :keyword="keyword"
                @infohtmlset="getClickInfo"
                :auto-viewport="true"
                class="search"
              ></bm-local-search>
              <!-- 缩放控件   anchor代表控件停靠位置   anchor="BMAP_ANCHOR_TOP_RIGHT"代表放在右上角-->
              <bm-navigation anchor="BMAP_ANCHOR_TOP_RIGHT"></bm-navigation>

              <!-- <bm-marker 	v-for="(item, index) in markers" :key="index + '_'" :position="item.value" @click="lookDetail(item.value)"> -->
                <bm-marker  v-for="marker of markers" :position="{lng: marker.lng, lat: marker.lat}" @click="lookDetail(marker)" animation="BMAP_ANIMATION_BOUNCE" :title="infoWindow.name">
                  <bm-info-window :title="infoWindow.name" :position="{lng: infoWindow.lng, lat: infoWindow.lat}"   :show="marker.showFlag" @close="infoWindowClose(marker)" @open="infoWindowOpen(marker)">
                  </bm-info-window>
                      <!-- <bm-info-window title="车辆信息" :position="{lng: marker.lng, lat: marker.lat}"   :show="marker.showFlag" @close="infoWindowClose(marker)" @open="infoWindowOpen(marker)"></bm-info-window> -->
              </bm-marker>
              <!-- <bm-driving
                :start="center"
                end="人民南巷17号"
                :auto-viewport="true"
                policy="BMAP_DRIVING_POLICY_LEAST_DISTANCE"
                :panel="false"
                location="西安">
              </bm-driving> -->
            </baidu-map>
          </div>
       </el-col>
       <el-col :span="12" class="padding-xs">
      <el-form ref="createForm" :model="infoData" :rules="createOrderRules" label-width="100px">
        <el-form-item label="物资名称" prop="goodsName">
          <!--          <el-input v-model="infoData.goodsName"></el-input>-->
          <el-select v-model="infoData.goodsName" placeholder="物资名称">
            <el-option label="防疫一次性口罩" value="防疫一次性口罩"></el-option>
            <el-option label="高浓度84消毒液" value="高浓度84消毒液"></el-option>
            <el-option label="医用消毒酒精" value="医用消毒酒精"></el-option>
            <el-option label="消毒洗手液" value="消毒洗手液"></el-option>
            <el-option label="电子体温枪" value="电子体温枪"></el-option>
            <el-option label="水银温度计" value="水银温度计"></el-option>
            <el-option label="肩背式喷雾器" value="肩背式喷雾器"></el-option>
            <el-option label="手持式喷雾器" value="手持式喷雾器"></el-option>
            <el-option label="一次性手套" value="一次性手套"></el-option>
            <el-option label="一次性垃圾袋" value="一次性垃圾袋"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="规格/型号" prop="goodsType">
          <!--          <el-input v-model="infoData.goodsType"></el-input>-->
          <el-select v-model="infoData.goodsType" placeholder="规格/类型">
            <el-option label="医用口罩" value="医用口罩"></el-option>
            <el-option label="120ml" value="120ml"></el-option>
            <el-option label="200ml" value="200ml"></el-option>
            <el-option label="300ml" value="300ml"></el-option>
            <el-option label="小型" value="小型"></el-option>
            <el-option label="中型" value="中型"></el-option>
            <el-option label="大型" value="大型"></el-option>
            <el-option label="橡胶" value="橡胶"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="数量" prop="quantity">
          <el-input-number placeholder=0 v-model="infoData.quantity"></el-input-number>
        </el-form-item>
        <el-form-item label="单位" prop="goodsUnit">
          <!--          <el-input v-model="infoData.goodsUnit"></el-input>-->
          <el-select v-model="infoData.goodsUnit" placeholder="单位">
            <el-option label="个" value="个"></el-option>
            <el-option label="瓶" value="瓶"></el-option>
            <el-option label="把" value="把"></el-option>
            <el-option label="支" value="支"></el-option>
            <el-option label="双" value="双"></el-option>
            <el-option label="卷" value="卷"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="领用人">
          <el-input v-model="infoData.contact_name" enabled></el-input>
        </el-form-item>
        <el-form-item label="联系电话">
          <el-input v-model="infoData.contact_phone" enabled></el-input>
        </el-form-item>
        <el-form-item label="地址">
          <el-input placeholder="请在地图上输入地址" disabled v-model="input3"></el-input>
        </el-form-item>
        <el-form-item label="预期使用日期">
          <el-date-picker
            v-model="infoData.expected_at"
            type="date"
            format="yyyy 年 MM 月 dd 日"
            value-format="yyyy-MM-dd"
            placeholder="选择预期日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注">
          <el-input type="textarea" v-model="infoData.goodsComment"></el-input>
        </el-form-item>
      </el-form>
                <el-button @click="resetForm('createForm')">重 置</el-button>
                <el-button type="primary" @click="getPaths('createForm')">确 定</el-button>
       </el-col>
       </el-row>
    </el-card>
    <el-card :gutter="50">
             <el-row>
          <el-col>
              <el-button type="primary"  @click="createOrder">生成工单</el-button>
          </el-col>
        </el-row>
             <el-row>
          <!--底部推荐表格区域-->
        <el-table ref="resultTable"
        :data="tableData"
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
        </el-row>
    </el-card>

    <!--底部分页区域-->
    <!-- <el-pagination
      :current-page="searchData.currentPage"
      :page-sizes="[10, 20, 40, 60]"
      :page-size="searchData.pageSize"
      :total="totalCount"
      layout="total, sizes, prev, pager, next, jumper"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange">
    </el-pagination> -->
    
  </div>
</template>

<script>
import { createOrder, getStores } from '../api/index';
import {
  BaiduMap, BmControl, BmView, BmAutoComplete, BmLocalSearch, BmMarker, BmGeolocation,BmDriving,
} from "vue-baidu-map";
export default {
  name: 'Roles',
  components: {
    BaiduMap, BmControl, BmView, BmAutoComplete, BmLocalSearch, BmMarker, BmGeolocation, BmDriving,
  },
  data() {
    return {
      user_id:0,
      radio:'',
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
      paths:[],
      totalCount: 0,
      storeCount: 0,
      tableData: [],
      storeList: [],
      createGoodsInDialogVisible: false,
      orderData:{},
      infoData: {
        user_req_id: 0,
        contact_name: '',
        contact_phone: '',
        address: '',
        status: 0,
        expected_at: '',
        goodsName: '',
        goodsUnit: '',
        quantity:0,
        goodsType: '',
        goodsComment: '',
        // CreatedAt: ''
      },
      createOrderRules: {
        goodsName: [
          { required: true, message: '请输入物资名称', trigger: 'blur' }
        ],
        goodsType: [
          { required: true, message: '请输入规格/型号', trigger: 'blur' }
        ],
        address:[
          { required: true, message: '请输入地址', trigger: 'blur' }
        ],
        quantity: [
          { required: true, message: '请输入数量', trigger: 'blur' }
        ],
        goodsUnit: [
          { required: true, message: '请输入单位', trigger: 'blur' }
        ],
        contact_name: [
          { required: true, message: '请输入入库人', trigger: 'blur' }
        ]
      },
    createGoodsOutDialogVisible: false,
      // 地图相关
      //定位位置信息
      center: {},
      //检索关键字
      keyword: "",
      //输入框input值
      input3: "",
      markers : [
        // {lng: 108.943546, lat: 34.157663, name: "工单1", showFlag: false},
        // {lng: 108.942139, lat: 34.218583, name: "工单2", showFlag: false},
        // {lng: 108.945914, lat:34.146892, name: "工单3", showFlag: false},
        // {lng: 108.855956, lat: 34.201364, name: "工单4", showFlag: false}
      ],
      ends:"108.943546,34.157663",
      map:"",
      infoWindow:{},
    };
  },
  // created() {
  //   const userInfo = sessionStorage.getItem('userInfo');
  //   if (userInfo) {
  //     this.getStores(JSON.parse(userInfo).id);
  //     this.getOrders();
  //   }
  // },
  // mounted(){
  //   this.initEcharts();
  //   const userInfo = sessionStorage.getItem('userInfo');
  //   if (userInfo) {
  //     const userinfo = JSON.parse(userInfo)
  //     console.log('userInfo-----------',userinfo);
  //     this.searchData.user_id = userinfo.id;
  //     this.searchData.roleid = userinfo.roles[0].id;
  //     this.getOrders();
  //   }
  // },
  created(){
    const userInfo = sessionStorage.getItem('userInfo');
    if (userInfo) {
      const userinfo = JSON.parse(userInfo)
      console.log('userInfo-----------',userinfo);
      this.searchData.user_id = userinfo.id;
      this.searchData.roleid = userinfo.roles[0].id;
      this.infoData.user_req_id = userinfo.id;
      this.getStores();
    }
  },
  methods: {
    // 跳转首页
    resetDefaultActivePath() {
      sessionStorage.removeItem('activePath');
    },


          // 点击点坐标赋值
    lookDetail(marker){
      marker.showFlag = true;
      this.infoWindow = marker;
      console.log('地图选点lookDetail：', marker);
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
      this.infoData.address = this.input3;
    },
    //地图加载后的回调
    mapReady({ BMap, map }) {
      //保存this指向，因为在百度的回调中this不指向vue
      this.map = map;
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
    searchcomplete(e){
    },
    getClickInfo (e) {
        this.center.lng = e.point.lng;
        this.center.lat = e.point.lat;
        console.log('地图选点：', e);
        // this.map.clearOverlays();
    },
   // 查找路径相关代码
   getPaths(formName) {  
     this.$refs[formName].validate(async (valid) => {
        if (valid) {
          try{ 
            this.tableData=undefined;
            this.tableData= new Array();
            if(this.center.lng){
              console.log('this.center', this.center);
              var end = new BMap.Point(this.center.lng, this.center.lat);
            }
            else{
              var end = new BMap.Point(108.94646555, 34.34726882);
            }
            
            for (let i = 0; i < this.storeList.length; i++) {
                    const store = this.storeList[i];
                    this.markers.push({
                      lng: store.longitude, 
                      lat: store.latitude, 
                      name:store.storename, 
                      showFlag: false});
                    var start = new BMap.Point(store.longitude, store.latitude);
                    const res = await this.getOnePath(start, end);
                    this.tableData.push({
                      store_id: store.store_id,
                      address: store.address,
                      storename: store.storename,
                      duration: res.duration,
                      distance: res.distance
                    });
          }
          this.$refs.resultTable && this.$refs.resultTable.toggleRowSelection(this.tableData[0], true)
        } catch(e){
            console.log(e);
          } 
        } else {
          this.$message({ type: 'error', message: '数据格式不对' });
        }
      });
    },
    getOnePath(start, end){
        // _map = this.map;
        return new Promise((resolve, reject) => {
          var walking = new BMap.DrivingRoute(this.map, { 
            renderOptions: { 
                map: this.map,
                /* 
                * 这里是百度地图的检索路线结果面板，在html中写一个div用于展示，panel的值为div的id。
                * 有些时候我们可能不需要过多的信息，这时可以用onSearchComplete方法自定义一个面板。
                */
                // panel: "r-result",
                // // 是否选择第一个检索结果
                // selectFirstResult: true,
                // 检索结束后是否自动调整地图视野
                autoViewport: true 
            },
            // 检索完成后回调
            onSearchComplete: function(results){
              if (walking.getStatus() != BMAP_STATUS_SUCCESS){
                  console.log('获取路线失败');
                  return
              }
              // 获取第一个路线
              const plan = results.getPlan(0)
              // // 获取时间
              // plan.getDuration(true)
              // // 获取距离
              // plan.getDistance(true)
              console.log('plan:',plan, plan.getDuration(true));
              resolve({duration:plan.getDuration(true), distance:plan.getDistance(true)}); 
            }
        });
          console.log('getOnepath:', start, end);
          walking.search(start, end);  
      });
    },
    getStores(){
      getStores({}).then(res => {
        console.log(res);
        if (res.status === 200) {
          this.storeList = res.data;
        } else {
          this.$message.error(res.msg);
        }

      console.log("storelist:");
      console.log(this.storeList);
      });

    },
    resetForm(formName){
      if (this.$refs[formName]) {
        this.$refs[formName].resetFields();
      }
    },

    handleSelectionChange(val){
      console.log('val: ', val);
      // val.forEach(item => {
        this.orderData = {
          user_rev_id: val.store_id,
          user_req_id: this.infoData.user_req_id,
          goodsName: this.infoData.goodsName,
          contact_name: this.infoData.contact_name,
          contact_phone: this.infoData.contact_phone,
          address: this.infoData.address,
          quantity: this.infoData.quantity,
          expected_at: this.infoData.expected_at,
        };
       
      // });
    },
    createOrder(){
      console.log(this.orderData);
       createOrder(this.orderData)
        .then(res => {
          console.log(res);
          if (res.status === 200) {
            this.tableData = res.data.orders;
            this.totalCount = res.data.totalCount;
            console.log(res.data);
          } else {
            this.$message.error(res.msg);
          }
        })
        .catch((e) => {
          this.$message.error(e.msg);
        });
    }
    // // 分页相关代码
    // getOrders() {
    //   // if (!this.searchData.expected_at) {
    //   //   this.searchData = Object.assign({}, this.searchData, { expected_at: '' });
    //   // }
    //   console.log("getOrders:");
    //   console.log(this.searchData);
    //   getOrders(this.searchData)
    //     .then(res => {
    //       console.log(res);
    //       if (res.status === 200) {
    //         this.tableData = res.data.orders;
    //         this.totalCount = res.data.totalCount;
    //         console.log(res.data);
    //       } else {
    //         this.$message.error(res.msg);
    //       }
    //     })
    //     .catch((e) => {
    //       this.$message.error(e.msg);
    //     });
    // },
    // handleSizeChange(currentSize) {
    //   // console.log(currentSize);
    //   this.searchData.pageSize = currentSize;
    //   this.getOrders();
    // },
    // handleCurrentChange(currentPage) {
    //   // console.log(currentPage);
    //   this.searchData.currentPage = currentPage;
    //   this.getOrders();
    // }
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
</style>
