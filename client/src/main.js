/**
 * @Author: jzy
 * @Date: 2017/7/2
 * @Last Modified by: jzy
 * @Last Modified time: 2017/7/2
 */

import 'common/css/reset.css';
import 'common/css/style.css';
import 'assets/css/index.css';
console.log('===');
import fn, {a, b, c} from 'components/mod1'
import w from 'components/mod2'

// 引包 END

console.log(w);
console.log(b);
console.log(c);

// 组件调用
JZY.service.Ajax.get(serverUrl + '/testApi', {}, {
    success: function(data){
        var oDomAppend = new JZY.util.DomAppend({
            data: {title: data.info[0]},
            templateFunc: doT.template($('#welcom_template').html()),
            $$wrapper: $('.welcome_wrapper')
        });
        oDomAppend.appendIntoWrapper();
    }
});
