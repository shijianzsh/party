(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-62fb"],{"0bfb":function(e,t,a){"use strict";var n=a("cb7c");e.exports=function(){var e=n(this),t="";return e.global&&(t+="g"),e.ignoreCase&&(t+="i"),e.multiline&&(t+="m"),e.unicode&&(t+="u"),e.sticky&&(t+="y"),t}},"0e8f":function(e,t,a){"use strict";a.d(t,"e",function(){return l}),a.d(t,"d",function(){return s}),a.d(t,"g",function(){return c}),a.d(t,"f",function(){return u}),a.d(t,"h",function(){return d}),a.d(t,"c",function(){return f}),a.d(t,"a",function(){return m}),a.d(t,"i",function(){return p}),a.d(t,"b",function(){return h});a("6b54"),a("7f7f"),a("f751"),a("cadf"),a("551c"),a("097d");var n=a("66df"),r=a("c0d6"),o="departments/",l=function(e){var t=e.current_page,a=void 0===t?0:t,l=e.filter,i=void 0===l?{}:l,s=e.with,c={current_page:a,filter:i,with:["parent"].concat(s||[])};return c=Object.assign(c,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),n["a"].request({url:o,method:"get",params:c})},i=function(e){var t=e.filter,a=void 0===t?{}:t,l=e.with,i={filter:a,with:["parent"].concat(l||[])};return i=Object.assign(i,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),n["a"].request({url:o+"select_component",method:"get",params:i})},s=function(e){var t={};return t=Object.assign(t,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),n["a"].request({url:o+e+"/coordinate",method:"get",params:t})},c=function(){return l({current_page:0,filter:{}}).then(function(e){for(var t={},a=0;a<e.data.rows.length;a++)t[e.data.rows[a].id]=e.data.rows[a];var n=10;while(n>0){for(var r in t)0!==t[r].parent_id&&t[r].level===n&&(t[t[r].parent_id].hasOwnProperty("children")||(t[t[r].parent_id].children=[]),t[t[r].parent_id].children.push(t[r]),delete t[r]);n--}var o=[];for(var l in t)o.push(t[l]);return e.data.rows=o,e})},u=function(){return i({filter:{}}).then(function(e){for(var t=e.data,a={},n=0;n<t.length;n++)a[t[n].id]={id:t[n].id,parent_id:t[n].parent_id,label:t[n].name,level:t[n].level,value:t[n].id.toString()};var r=10;while(r>0){for(var o in a)0!==a[o].parent_id&&a[o].level===r&&(a[a[o].parent_id].hasOwnProperty("children")||(a[a[o].parent_id].children=[]),a[a[o].parent_id].children.push(a[o]),delete a[o]);r--}var l=[];for(var i in a)l.push(a[i]);return l})},d=function(){return i({filter:{},with:["Users"]}).then(function(e){for(var t=e.data,a={},n=0;n<t.length;n++){for(var r=0;r<t[n].users.length;r++)t[n].users[r].label=t[n].users[r].user_name,t[n].users[r].value=t[n].users[r].id;a[t[n].id]={id:t[n].id,parent_id:t[n].parent_id,label:t[n].name+" - 人员 "+t[n].users_count+" 人",level:t[n].level,children:t[n].users}}var o=[];for(var l in a)delete a[l]["id"],o.push(a[l]);return o})},f=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return n["a"].request({url:o+e,method:"get",params:t})},m=function(e){var t={data:e},a={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return n["a"].request({url:o,method:"post",data:t,params:a})},p=function(e,t){var a={data:t},l={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return n["a"].request({url:o+e,method:"put",data:a,params:l})},h=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return n["a"].request({url:o+e,method:"delete",params:t})}},3846:function(e,t,a){a("9e1e")&&"g"!=/./g.flags&&a("86cc").f(RegExp.prototype,"flags",{configurable:!0,get:a("0bfb")})},"60f7":function(e,t,a){"use strict";var n=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("a-tree-select",{style:e.styleValue,attrs:{treeData:e.treeData,value:null!==e.value&&0!==e.value?e.value.toString():null,searchPlaceholder:"请点击选择",treeNodeFilterProp:"label"},on:{change:e.onChange}})},r=[],o=(a("24b4"),a("c405")),l={props:{value:{required:!1,default:function(){return""}},styleValue:{required:!1,default:function(){return{"min-width":"200px"}}}},model:{prop:"value",event:"change"},data:function(){return{treeData:[]}},methods:{init:function(){var e=this;Object(o["e"])().then(function(t){e.treeData=t})},onChange:function(e){this.$emit("change",e?parseInt(e):0)}},watch:{},created:function(){this.init()}},i=l,s=a("2877"),c=Object(s["a"])(i,n,r,!1,null,null,null);c.options.__file="SelectCategory.vue";t["a"]=c.exports},"6b54":function(e,t,a){"use strict";a("3846");var n=a("cb7c"),r=a("0bfb"),o=a("9e1e"),l="toString",i=/./[l],s=function(e){a("2aba")(RegExp.prototype,l,e,!0)};a("79e5")(function(){return"/a/b"!=i.call({source:"a",flags:"b"})})?s(function(){var e=n(this);return"/".concat(e.source,"/","flags"in e?e.flags:!o&&e instanceof RegExp?r.call(e):void 0)}):i.name!=l&&s(function(){return i.call(this)})},"88cd":function(e,t,a){"use strict";var n=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("a-tree-select",{style:e.styleValue,attrs:{treeData:e.treeData,value:null!==e.value&&0!==e.value?e.value.toString():null,searchPlaceholder:"请点击选择",treeNodeFilterProp:"label"},on:{change:e.onChange}})},r=[],o=(a("24b4"),a("0e8f")),l={props:{value:{required:!1,default:function(){return""}},styleValue:{required:!1,default:function(){return{"min-width":"200px"}}}},model:{prop:"value",event:"change"},data:function(){return{treeData:[]}},methods:{init:function(){var e=this;Object(o["f"])().then(function(t){e.treeData=t})},onChange:function(e){this.$emit("change",e?parseInt(e):0)}},watch:{},created:function(){this.init()}},i=l,s=a("2877"),c=Object(s["a"])(i,n,r,!1,null,null,null);c.options.__file="SelectDepartment.vue";t["a"]=c.exports},a2ac:function(e,t,a){"use strict";var n=function(){var e=this,t=this,a=t.$createElement,n=t._self._c||a;return n("div",[n("a-form",{attrs:{layout:t.formLayout,autoFormCreate:function(t){e.form=t}},on:{submit:function(e){t.handleSearch(!1)}}},[t._l(t.fields,function(e){return[t.formIf(e,["user_id"])?n("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[n("SelectUser")],1):t._e(),t.formIf(e,["category_id"])?n("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[n("SelectCategory")],1):t.formIf(e,["department_id"])?n("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[n("SelectDepartment")],1):t.formIf(e,["start_timestamp","end_timestamp"])?n("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[n("DateTime")],1):t.formIf(e,["keyword"])?n("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[n("a-input",{attrs:{placeholder:"请输入"+e.label}})],1):t._e()]}),t.fields.length?n("a-form-item",{attrs:{wrapperCol:t.buttonItemLayout.wrapperCol}},[n("a-button-group",[n("a-button",{attrs:{type:"primary"},on:{click:function(e){t.handleSearch(!1)}}},[t._v("搜索")]),n("a-button",{on:{click:function(e){t.handleSearch(!0)}}},[t._v("清空")])],1)],1):t._e(),n("a-form-item",{attrs:{wrapperCol:t.buttonItemLayout.wrapperCol}},[n("a-button",{attrs:{type:"primary"},on:{click:function(e){t.handleExport()}}},[t._v("导出")])],1)],2)],1)},r=[],o=a("60f7"),l=a("c281"),i=a("88cd"),s=a("c424"),c={components:{SelectCategory:o["a"],SelectUser:l["a"],SelectDepartment:i["a"],DateTime:s["a"]},props:{fields:{required:!0,type:Array}},data:function(){return{formLayout:"inline",form:{}}},methods:{formIf:function(e,t){for(var a=0;a<t.length;a++)if(t[a]===e.field)return!0;return!1},handleFormLayoutChange:function(e){this.formLayout=e.target.value},handleSearch:function(){var e=arguments.length>0&&void 0!==arguments[0]&&arguments[0];console.log(e);var t={};if(e)for(var a=0;a<this.fields.length;a++){var n={};n[this.fields[a].field]=null,console.log(n),this.form.setFieldsValue(n)}else t=this.form.getFieldsValue();this.$emit("handleSearch",t)},handleExport:function(){this.$message.success("功能开发中")}},computed:{formItemLayout:function(){var e=this.formLayout;return"horizontal"===e?{labelCol:{span:4},wrapperCol:{span:14}}:{}},buttonItemLayout:function(){var e=this.formLayout;return"horizontal"===e?{wrapperCol:{span:14,offset:4}}:{}}}},u=c,d=a("2877"),f=Object(d["a"])(u,n,r,!1,null,null,null);f.options.__file="Index.vue";t["a"]=f.exports},adee:function(e,t,a){"use strict";a.r(t);var n=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("TopButtons"),a("div",{staticStyle:{height:"10px"}}),a("filter-component",{attrs:{fields:e.filterFields},on:{handleSearch:e.handleSearch}}),a("div",{staticStyle:{height:"10px"}}),a("table-component",{ref:"table",attrs:{columns:e.columns,request:e.tableRequest},on:{handleOperate:e.handleOperate}})],1)},r=[],o=a("4059"),l=a("0e8f"),i=a("e8c4"),s=a("a2ac"),c={components:{TopButtons:o["a"],filterComponent:s["a"],tableComponent:i["a"]},data:function(){return{modalTitle:null,modalVisible:!1,formId:0,columns:[{title:"#",dataIndex:"index",scopedSlots:{customRender:"index"}},{title:"名称",dataIndex:"name",key:"name"},{title:"上级党支部名称",dataIndex:"parent.name",key:"parent.name"},{title:"书记",dataIndex:"secretary",key:"secretary"},{title:"成立日期",dataIndex:"established_at",key:"established_at"},{title:"操作",dataIndex:"operation",scopedSlots:{customRender:"operation"},buttons:{edit:{visible:!0,disable:!1},delete:{visible:!0,disable:!1}}}],tableRequest:l["e"],filterFields:[{label:"上级党支部",field:"department_id"},{label:"成立时间",field:"start_timestamp"},{label:"-",field:"end_timestamp"},{label:"关键字",field:"keyword"}]}},methods:{handleSearch:function(e){this.$refs.table.handleSearch(e)},handleEdit:function(e){this.$router.push({name:"党支部信息编辑",params:{id:e}})},handleOperate:function(e,t){var a=this;switch(e){case"create":this.handleCreate();break;case"edit":this.handleEdit(t.id);break;case"delete":Object(l["b"])(t.id).then(function(e){a.$message.success("删除成功"),a.$refs.table.reFetch()});break}}}},u=c,d=a("2877"),f=Object(d["a"])(u,n,r,!1,null,null,null);f.options.__file="Index.vue";t["default"]=f.exports},c281:function(e,t,a){"use strict";var n=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("a-tree-select",{style:e.styleValue,attrs:{treeData:e.treeData,value:e.getValue(e.value),searchPlaceholder:"请点击选择",treeNodeFilterProp:"label",disabled:e.disabled},on:{change:e.onChange}})},r=[],o=(a("24b4"),a("0e8f")),l={props:{value:{required:!1,default:function(){return""}},styleValue:{required:!1,default:function(){return{"min-width":"200px"}}},disabled:{required:!1,type:Boolean,default:function(){return!1}}},model:{prop:"value",event:"change"},data:function(){return{treeData:[]}},methods:{getValue:function(e){return[e]},init:function(){var e=this;Object(o["h"])().then(function(t){e.treeData=t})},onChange:function(e){if(void 0===e)return this.$message.warning("选择错误，请重新选择"),!1;this.$emit("change",e?parseInt(e):0)}},watch:{},created:function(){this.init()}},i=l,s=a("2877"),c=Object(s["a"])(i,n,r,!1,null,null,null);c.options.__file="SelectUser.vue";t["a"]=c.exports},c405:function(e,t,a){"use strict";a.d(t,"d",function(){return i}),a.d(t,"f",function(){return s}),a.d(t,"e",function(){return c}),a.d(t,"c",function(){return u}),a.d(t,"a",function(){return d}),a.d(t,"g",function(){return f}),a.d(t,"b",function(){return m});a("6b54"),a("7f7f"),a("f751");var n=a("66df"),r=a("c0d6"),o="categories/",l=function(e){var t=e.current_page,a=void 0===t?0:t,l=e.filter,i=void 0===l?{}:l,s={current_page:a,filter:i};return s=Object.assign(s,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),n["a"].request({url:o,method:"get",params:s})},i=function(e){var t={};return t=Object.assign(t,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),n["a"].request({url:o+e+"/children_and_published_article",method:"get",params:t})},s=function(){return l({current_page:0,filter:{}}).then(function(e){for(var t={},a=0;a<e.data.rows.length;a++)t[e.data.rows[a].id]=e.data.rows[a];var n=10;while(n>0){for(var r in t)0!==t[r].parent_id&&t[r].level===n&&(t[t[r].parent_id].hasOwnProperty("children")||(t[t[r].parent_id].children=[]),t[t[r].parent_id].children.push(t[r]),delete t[r]);n--}var o=[];for(var l in t)o.push(t[l]);return o})},c=function(){return l({current_page:0,filter:{}}).then(function(e){for(var t={},a=0;a<e.data.rows.length;a++)t[e.data.rows[a].id]={id:e.data.rows[a].id,parent_id:e.data.rows[a].parent_id,label:e.data.rows[a].name+" - 文章 "+e.data.rows[a].posts_count+" 篇",level:e.data.rows[a].level,value:e.data.rows[a].id.toString()};var n=10;while(n>0){for(var r in t)0!==t[r].parent_id&&t[r].level===n&&(t[t[r].parent_id].hasOwnProperty("children")||(t[t[r].parent_id].children=[]),t[t[r].parent_id].children.push(t[r]),delete t[r]);n--}var o=[];for(var l in t)o.push(t[l]);return o})},u=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return n["a"].request({url:o+e,method:"get",params:t})},d=function(e){var t={data:e},a={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return n["a"].request({url:o,method:"post",data:t,params:a})},f=function(e,t){var a={data:t},l={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return n["a"].request({url:o+e,method:"put",data:a,params:l})},m=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return n["a"].request({url:o+e,method:"delete",params:t})}},c424:function(e,t,a){"use strict";var n=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("a-date-picker",{staticStyle:{width:"190px"},attrs:{showTime:"",format:"YYYY-MM-DD HH:mm:ss",placeholder:e.placeholder,value:e.getValue(e.value)},on:{change:e.onChange,ok:e.onOk}})},r=[],o=(a("c5f6"),{props:{value:{type:Number,required:!1},placeholder:{required:!1,type:String,default:function(){return"点击选择"}}},model:{prop:"value",event:"change"},methods:{getValue:function(e){return isNaN(e)?e:moment(1e3*e)},onChange:function(e,t){var a=e?e.valueOf()/1e3:null;console.log(parseInt(a)),this.$emit("change",parseInt(a))},onOk:function(e){var t=e?e.valueOf()/1e3:null;console.log(parseInt(t)),this.$emit("change",parseInt(t))}}}),l=o,i=a("2877"),s=Object(i["a"])(l,n,r,!1,null,null,null);s.options.__file="DateTime.vue";t["a"]=s.exports}}]);
//# sourceMappingURL=chunk-62fb.077f74bb.js.map