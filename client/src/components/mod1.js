/**
 * @Author: jzy
 * @Date: 2017/12/1
 * @Last Modified by: jzy
 * @Last Modified time: 2017/12/1
 */
import c from 'components/mod2'

var fn1 = function(){
    console.log('fn1')
};
var a = 9;
var b = 7;

console.log(c);

export default fn1;
export {a, b, c}