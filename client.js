/**
 * @Author: jzy
 * @Date: 2016/12/10
 * @Last Modified by: jzy
 * @Last Modified time: 2016/12/10
 */
var path = require('path');
var express = require('express');
var db = require('./server/models/db2');
var normalize = require('normalize-path');
var app = require('./server/app.js');

// 路由对象
var router = express.Router();
// 暴露路由模块
module.exports = router;

// 设置模版引擎
app.engine('html', require('express-dot-engine').__express);
app.set('view engine', 'html');

// 静态资源服务
app.use(express.static(path.resolve(__dirname, 'client')));

// 处理跨域 -> 前端请求的数据接口(/api/...), 处理为支持跨域
app.use('/api', function(req, res, next){
    res.header('Access-Control-Allow-Origin', '*');
    // axios withCredentials 设置为 true 时，需要开启一下两行代码，处理跨域请求时使用凭证
    //res.header('Access-Control-Allow-Origin', 'http://localhost:8080');
    //res.header('Access-Control-Allow-Credentials', 'true');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    next();
});

// 路由中间件  -  首页
router.get(['/', '/index', '/index.html'], function(req, res){
    return res.render(path.join(__dirname, 'client/default.html'), {title: 'Document App'});
});
