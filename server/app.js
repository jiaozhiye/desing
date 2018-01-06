/**
 * @Author: jzy
 * @Date: 2016/12/10
 * @Last Modified by: jzy
 * @Last Modified time: 2016/12/10
 */
var express = require('express');
var bodyParser = require('body-parser');
var glob = require('glob');
var session = require('express-session');
var cookieParser = require('cookie-parser');
var path = require('path');
var app = express();

// 向外暴露 express app 模块
module.exports = app;

// session 配置
app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true
}));

// cookie 配置
app.use(cookieParser());

// 处理 application/x-www-form-urlencoded -> form表单提交的 POST 数据
app.use(bodyParser.urlencoded({extended: true}));

// 文件上传目录
app.set('uploadpath', path.join(__dirname, 'uploads'));
// 数据库备份路径
app.set('databasepath', path.join(app.get('uploadpath'), 'data'));
// 临时上传路径
app.set('tempuploadpath', path.join(app.get('uploadpath'), 'temp'));
// 分类图片上传路径
app.set('classifypath', path.join(app.get('uploadpath'), 'images/classify'));
// 文章图片上传路径
app.set('articlepath', path.join(app.get('uploadpath'), 'images/article'));
// 附件上传路径
app.set('filespath', path.join(app.get('uploadpath'), 'files'));

/**
 * 处理前台路由 - 中间件
 */
app.use('/', require('../client.js'));

/**
 * 处理后台路由 - 中间件
 */
// 登录、首页和权限 校验中间件    一定确保是第一个中间件
app.use('/', require('./controllers/sessionverify'));

// 静态资源服务
app.use('/admin', express.static(path.join(__dirname, 'public')));
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// 同步载入所有路由控制器，返回文件路径数组
var routes = glob.sync('./controllers/**/*.js', {cwd: __dirname});
for (var i = 0, len = routes.length; i < len; i++){
    var router = require(routes[i]);
    // 只有请求地址为 router.prefix/* 类型, 才会由 router 路由对象来处理
    router.prefix && app.use(router.prefix, router);
	// 释放临时变量
    router = null;
}

// error 处理    错误处理器中间件并不捕获 404
app.use(function(err, req, res, next){
    console.error(err.stack);
    return res.status(500).send('Something broke!');
});

// 404
app.use(function(req, res){
    return res.status(404).sendFile(path.join(__dirname, 'views/err.html'));
});

// 处理监听
if (!module.parent){
    var hostname = '127.0.0.1';
    var port     = process.env.PORT || 2080;
    app.listen(port, function (err){
        if (err) throw err;
        app.set('url', 'http://' + hostname + ':' + port);
        console.log('Server running at http://' + hostname + ':' + port + '/');
    });
}

// 服务器对访问的路径做出响应，采取一定的动作，可以把这一过程看做一个路由
//
// 访问的路径，即为router的路径；服务器采取的动作，即为Middleware，是一个个特殊的函数
//
// express应用其实就是由一系列顺序执行的Middleware组成
//
// 中间件就是一个访问express应用，传入req，res，next参数的函数，这个函数可以访问req，res传入的资源
//
// 如果当前中间件没有完成对页面的res响应 ，还可以通过next把router留给下一个Middleware继续执行
//
// middleware可以跟指定的router路径绑定，也可以跟所有的router路径绑定
//
// 当express实例分配的路由越来越多的时候，最好把路由独立出去
// express.Router() 是一个只具有路由相关功能的对象，包括use，get，post等方法
//
// router的路由必须通过app.use挂载到app上才能被响应 => app.use('/aaa', router)
//
// app.get 挂载 / 的路由只响应跟 / 精确匹配的GET请求
// app.use 挂载的 / 的路由能响应所有以 / 为起始路径的路由，且不限制HTTP访问的方式
