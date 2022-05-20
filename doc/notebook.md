# 资料
[深入理解 DAO，DTO，DO，VO，AO，BO，POJO，PO，Entity，Model，View的概念](https://mp.weixin.qq.com/s/fC5y1MjV8ljeaRhvdBwtUA)


# 常用配置

> ## 安装brew
  - [brew安装教程](https://blog.csdn.net/weixin_43822632/article/details/110472605)
  - 命令

    ``` bash
    /bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
        ```

- 使用home brew安装MySQL 5.7
  - 安装

    ```bash
      brew install mysql@5.7
    ```

  - 配置环境变量

    ```bash
    # 终端
    echo 'export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"' >> ~/.zshrc
    # 刷新 ~/.zshrc
    source ~/.zshrc
    ```

  - 查看版本

    ```bash
    mysql --version
    ```

  - 启动mysql

    ```bash
    mysql.server start  # 启动mysql
    
    mysql.server stop # 停止mysql
    
    mysql.serve

    ```

  - 初始化

    ```bash
    # 任意位置bash
    mysql_secure_installation
    ```

    ```bash
    Securing the MySQL server deployment.



    Connecting to MySQL using a blank password.



    VALIDATE PASSWORD COMPONENT can be used to test passwords

    and improve security. It checks the strength of password

    and allows the users to set only those passwords which are

    secure enough. Would you like to setup VALIDATE PASSWORD component?



    Press y|Y for Yes, any other key for No: n    // 这个选yes的话密码长度就必须要设置为8位以上，但我只想要6位的

    Please set the password for root here.

    New password:

    Re-enter new password:

    By default, a MySQL installation has an anonymous user,

    allowing anyone to log into MySQL without having to have

    a user account created for them. This is intended only for

    testing, and to make the installation go a bit smoother.

    You should remove them before moving into a production

    environment.



    Remove anonymous users? (Press y|Y for Yes, any other key for No) : y          // 移除不用密码的那个账户

    Success.



    Normally, root should only be allowed to connect from

    'localhost'. This ensures that someone cannot guess at

    the root password from the network.



    Disallow root login remotely? (Press y|Y for Yes, any other key for No) : n      //不接受root远程登录账号



    ... skipping.

    By default, MySQL comes with a database named 'test' that

    anyone can access. This is also intended only for testing,

    and should be removed before moving into a production

    environment.





    Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y     //删除test数据库

    - Dropping test database...

    Success.



    - Removing privileges on test database...

    Success.



    Reloading the privilege tables will ensure that all changes

    made so far will take effect immediately.



    Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y

    Success.



    All done!
  
    ```

> ## 安装Redis
  - 安装

    ```bash
    # 苹果M1芯片
    arch -arm64 brew install redis
    # other
    brew install redis
    ```

  - 启动Redis

    ```bash
    # 启动Redis
    redis-server

    # 结束Redis Control + c

    # 想让电脑重启时启动Redis，使用该命令
    brew services start redis

    # 暂停redis服务
    brew services stop redis
    ```

  - 查看redis启动状况

    ```bash
    brew services info redis
    ```
  
  - 测试redis
  
    ```bash
    brew services info redis
    ```


> ## 安装nodejs

  - [官网下载nodejs](https://nodejs.org/zh-cn/)安装包
  - 双击刚下载的文件，按步骤默认安装
  - 安装完成后打开终端，输入
  
    ```bash
      node -v
      npm -v
    ```

  - 配置环境
    
    ```bash
    (base) iiixv@xxxxxxxx ~ % vim ~/.zshrc 
    # 输入i进入编辑模式
    # 在文本中插入
    PATH=$PATH:/usr/local/bin/
    # 点击【ESC】退出编辑
    # 输入:wq 退出
    ```
> ## github 托管代码配置
- New repository：填写仓库名以及描述后点击创建，跳转至Quick setup
- 在项目终端使用


   
  

# 开发
— error
- com.mysql.cj.jdbc.Driver
    ```bash
      Loading class `com.mysql.jdbc.Driver'. This is deprecated. The new driver class is `com.mysql.cj.jdbc.Driver'. The driver is automatically registered via the SPI and  manual loading of the driver class is generally unnecessary.
    ```
- mybatis-generator
  - 执行``` mvn -Dmybatis.generator.overwrite=true mybatis-generator:generate```遇到如下错误
    - 错误原因：Mysql服务未启动，启动Mysql服务即可
    
  ```bash
    [ERROR] Failed to execute goal org.mybatis.generator:mybatis-generator-maven-plugin:1.4.1:generate (default-cli) on project backend: Communications link failure
    [ERROR]
    [ERROR] The last packet sent successfully to the server was 0 milliseconds ago. The driver has not received any packets from the server.
    [ERROR] -> [Help 1]
    [ERROR]
    [ERROR] To see the full stack trace of the errors, re-run Maven with the -e switch.
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR]
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException
  ```
    

# 实现用户登录界面
## Springboot与Vue前后端交互
- 在后端application.properties中修改端口为```server.port=7001```
- 后端中新建package:config，包下新建类CrosConfig
  ```java
  @Component
  public class CrosConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
      //本应用的所有方法都会去处理跨域请求
      registry.addMapping("/**")
      //允许远端访问的域名
      .allowedOriginPatterns("*")
      //允许请求的方法
      .allowedMethods("GET","POST","PUT","DELETE","OPTIONS")
      .allowCredentials(true)
      .maxAge(3600)
      .allowedHeaders("*");
    }
  }
  ```
- 前端vue中修改network.js文件中的```axios.defaults.baseURL = 'http://127.0.0.1:7001';```

## 用户登录格式验证