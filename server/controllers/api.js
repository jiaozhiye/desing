/**
 * @Author: jzy
 * @Date: 2017/6/24
 * @Last Modified by: jzy
 * @Last Modified time: 2017/6/24
 */
var app = require('../app.js');
var express = require('express');
var db = require('../models/db');

// 路由对象
var router = express.Router();
router.prefix = '/api';

// 暴露路由模块
module.exports = router;

/*
 * GET /api/testApi
 * 测试接口
 */
router.get('/testApi', function(req, res){
    res.json({
        errCode: 1,
        errMsg: '测试接口数据',
        info: ['你好，XXX']
    });
});

/*
 * GET /api/getConfigInfo
 * 获取app配置信息
 */
router.get('/getConfigInfo', function(req, res){
    db.execute('select t1.title, t1.keywords, t1.description from zh_site_config t1 where id=?', [1], function(rows){
        //console.log(rows);
        if (rows.length == 1){
            res.json({
                errCode: 1,
                errMsg: 'app配置信息获取成功',
                info: rows[0]
            });
        } else {
            res.json({
                errCode: 0,
                errMsg: 'app配置信息获取失败',
                info: null
            });
        }
    });
});

