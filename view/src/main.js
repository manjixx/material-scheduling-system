import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import './assets/css/reset.scss';
import 'element-ui/lib/theme-chalk/index.css';
import './plugin/element-ui/index';
import './plugin/filters';
import tools from './plugin/tools';
import animated from 'animate.css';

import BaiduMap from 'vue-baidu-map';
import * as echarts from 'echarts';
Vue.prototype.$echarts = echarts;
Vue.use(BaiduMap, {
  ak: 'Y7olNUlNiUfqbkWCd01ChbvHDxpeDNYD'  //  在此输入你自己的百度地图ak
})

Vue.use(tools);
Vue.use(animated);
// 初始化图表
// const echarts = require('echarts');
// Vue.prototype.$initChart = function(domId, options) {
//   const chart = echarts.init(document.getElementById(domId));
//   chart.setOption(options);
//   return chart;
// };

Vue.config.productionTip = false;

const vue = new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');
export default vue;
