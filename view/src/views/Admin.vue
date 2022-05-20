<template>
    <!--主要内容区域-->
    <div class="admin">
      <!--内容容器-->
      <el-container>
        <!--内容头部-->
        <el-header>
          <div class="header-left">
            <h1>防疫物资管理系统</h1>
          </div>
          <div class="header-right">
            <el-dropdown @command="handleCommand">
              <img :src="userInfo.baseURL ? (userInfo.baseURL + userInfo.avatarURL) : ($store.state.uploadHttp + userInfo.avatarURL)" alt="">
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item command="sys" icon="el-icon-house">系统首页</el-dropdown-item>
                <el-dropdown-item command="logout" icon="el-icon-switch-button">退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
            <p>{{userInfo.username || userInfo.email || userInfo.phone}}</p>
          </div>
          
        </el-header>
        <!--内容区域-->
        <el-container>
          <!--内容侧边导航栏-->
          <el-aside :class="isCollapse ? 'active' : ''">
            <div class="toggle-collapse" @click="toggleCollapse">|||</div>
            <el-menu
              :default-active="activePath"
              background-color="#41423B"
              text-color="#fff"
              :collapse="isCollapse"
              unique-opened
              router
              active-text-color="#ffd04b">
              <MenuTree v-if="menuList" :menuList="menuList"></MenuTree>
            </el-menu>
          </el-aside>
          <!--内容显示区域-->
          <el-main>
            <router-view @initUserInfo="initUserInfo"></router-view>
          </el-main>
        </el-container>
      </el-container>
    </div>
</template>

<script>
import MenuTree from '../components/MenuTree';
export default {
  name: 'Admin',
   //需要引入的组件
  components: {
    MenuTree,
  },
  data() {
    return {

      avatarURL: null,
      isCollapse: false,
      activePath: '',
      list: [
        {
          menuName: '系统管理', // 菜单名
          icon: 'el-icon-setting', // 菜单图标
          path: '/user', // 路由
          name: 'User', // 路由名 一般去掉下划线首字母大写
          component: 'user/User', // 路由路径 上级文件夹/组件的方式
          // 子数组
          children: []
        }
      ],
      menuList: [],
      
      userInfo: {},
    };
  },
  watch: {
    '$route'(newValue, oldValue) {
      if (newValue.path === '/main') {
        this.activePath = '';
        window.sessionStorage.removeItem('activePath');
      }
    }
  },
  created() {
    this.initUserInfo(true);
  },
  methods: {

    initUserInfo(flag) {
      console.log('flag', flag);
      const userInfo = sessionStorage.getItem('userInfo');
      this.userInfo = JSON.parse(userInfo);
      if (userInfo && flag) {
        for (let i = 0; i < this.userInfo.rightsTree.length; i++) {
          const rights = this.userInfo.rightsTree[i];
          if (rights.rightsType === 'menu') {
            this.menuList = rights.children;
          }
        }
        // console.log(this.menuList);
      }
      const path = sessionStorage.getItem('activePath');
      
      this.activePath = path || '';
    },
    // 处理顶部右侧头像下拉菜单按钮
    handleCommand(command) {
      if (command === 'sys') {
        if (this.$route.path !== '/mainck') {
          sessionStorage.removeItem('activePath');
          this.activePath = '';
          this.$router.push('/admin');
          console.log("path=====================~~~~~~~~~~~~~~~~~~~~~");
          console.log(this.$route.path);
        }
        // 系统首页处理
      } else if (command === 'talk') {
        // 交流讨论处理
      } else if (command === 'logout') {
        // 退出登录处理
        sessionStorage.removeItem('token');
        sessionStorage.removeItem('activePath');
        sessionStorage.removeItem('userInfo');
        this.$router.push('/login');
        this.$message.success('退出成功');
      }
    },
    // 切换展开/折叠侧边栏菜单
    toggleCollapse() {
      this.isCollapse = !this.isCollapse;
    }
  }
};
</script>

<style scoped lang="scss">
.admin{
  height: 100%;
  .el-container{
    height: 100%;
    .el-header {
      /*background-color: #001529;*/
      background: #787B3F;
      color: #FFF;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0 30px;
      box-sizing: border-box;
      .header-left{
        height: 100%;
        display: flex;
        align-items: center;
        h1{
          font-size: 26px;
        }
      }
      .header-right{
        height: 100%;
        display: flex;
        align-items: center;
        .el-dropdown{
          display: flex;
        }
        img{
          width: 50px;
          height: 50px;
          border-radius: 50%;
          background-color: #FFFFFF;
          margin-right: 10px;
          border: 1px solid #ccc;
        }
        p{
          font-size: 16px;
        }
      }
    }

    .el-aside {
      width: 200px !important;
      /*background-color: #001529;*/
      /*background-color: #2d353c;*/
      background: #41423B;
      &.active{
        width: 64px !important;
      }
      .toggle-collapse{
        /*background-color: #ccc;*/
        font-size: 12px;
        font-weight: bold;
        line-height: 24px;
        color: #FFFFFF;
        letter-spacing: 0.2em;
        text-align: center;
        cursor: pointer;
        background: linear-gradient(180deg, #787B3F 0%, #41423B 100%);
        border: 1px solid #707070;
      }
      .el-menu{
        border-right: none;
      }
    }

    .el-main {
      background-color: #E9EEF3;
    }
  }
}
</style>
