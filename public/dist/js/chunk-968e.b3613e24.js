(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-968e"],{"0bbc":function(e,t,n){"use strict";var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("buttonMenu",{attrs:{menu:e.menu}})},r=[],o=n("bd7b"),c=n("b74b"),u={name:"TopButtons",components:{buttonMenu:o["a"]},computed:{menu:function(){return Object(c["a"])("组织管理.工作规划")}}},i=u,s=(n("bb715"),n("2877")),l=Object(s["a"])(i,a,r,!1,null,"c64e7346",null);l.options.__file="TopButtons.vue";t["a"]=l.exports},"0bfb":function(e,t,n){"use strict";var a=n("cb7c");e.exports=function(){var e=a(this),t="";return e.global&&(t+="g"),e.ignoreCase&&(t+="i"),e.multiline&&(t+="m"),e.unicode&&(t+="u"),e.sticky&&(t+="y"),t}},"0e8f":function(e,t,n){"use strict";n.d(t,"e",function(){return c}),n.d(t,"d",function(){return i}),n.d(t,"g",function(){return s}),n.d(t,"f",function(){return l}),n.d(t,"h",function(){return d}),n.d(t,"c",function(){return f}),n.d(t,"a",function(){return m}),n.d(t,"i",function(){return p}),n.d(t,"b",function(){return h});n("6b54"),n("7f7f"),n("f751"),n("cadf"),n("551c"),n("097d");var a=n("66df"),r=n("c0d6"),o="departments/",c=function(e){var t=e.current_page,n=void 0===t?0:t,c=e.filter,u=void 0===c?{}:c,i=e.with,s={current_page:n,filter:u,with:["parent"].concat(i||[])};return s=Object.assign(s,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),a["a"].request({url:o,method:"get",params:s})},u=function(e){var t=e.filter,n=void 0===t?{}:t,c=e.with,u={filter:n,with:["parent"].concat(c||[])};return u=Object.assign(u,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),a["a"].request({url:o+"select_component",method:"get",params:u})},i=function(e){var t={};return t=Object.assign(t,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),a["a"].request({url:o+e+"/coordinate",method:"get",params:t})},s=function(){return c({current_page:0,filter:{}}).then(function(e){for(var t={},n=0;n<e.data.rows.length;n++)t[e.data.rows[n].id]=e.data.rows[n];var a=10;while(a>0){for(var r in t)0!==t[r].parent_id&&t[r].level===a&&(t[t[r].parent_id].hasOwnProperty("children")||(t[t[r].parent_id].children=[]),t[t[r].parent_id].children.push(t[r]),delete t[r]);a--}var o=[];for(var c in t)o.push(t[c]);return e.data.rows=o,e})},l=function(){return u({filter:{}}).then(function(e){for(var t=e.data,n={},a=0;a<t.length;a++)n[t[a].id]={id:t[a].id,parent_id:t[a].parent_id,label:t[a].name,level:t[a].level,value:t[a].id.toString()};var r=10;while(r>0){for(var o in n)0!==n[o].parent_id&&n[o].level===r&&(n[n[o].parent_id].hasOwnProperty("children")||(n[n[o].parent_id].children=[]),n[n[o].parent_id].children.push(n[o]),delete n[o]);r--}var c=[];for(var u in n)c.push(n[u]);return c})},d=function(){return u({filter:{},with:["Users"]}).then(function(e){for(var t=e.data,n={},a=0;a<t.length;a++){for(var r=0;r<t[a].users.length;r++)t[a].users[r].label=t[a].users[r].user_name,t[a].users[r].value=t[a].users[r].id;n[t[a].id]={id:t[a].id,parent_id:t[a].parent_id,label:t[a].name+" - 人员 "+t[a].users_count+" 人",level:t[a].level,children:t[a].users}}var o=[];for(var c in n)delete n[c]["id"],o.push(n[c]);return o})},f=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"get",params:t})},m=function(e){var t={data:e},n={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o,method:"post",data:t,params:n})},p=function(e,t){var n={data:t},c={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"put",data:n,params:c})},h=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"delete",params:t})}},2511:function(e,t,n){"use strict";n.d(t,"e",function(){return c}),n.d(t,"c",function(){return u}),n.d(t,"d",function(){return i}),n.d(t,"a",function(){return s}),n.d(t,"f",function(){return l}),n.d(t,"b",function(){return d});n("f751");var a=n("66df"),r=n("c0d6"),o=(n("00b6"),"department_work_plans/"),c=function(e){var t=e.current_page,n=void 0===t?0:t,c=e.filter,u=void 0===c?{}:c,i=e.with,s={current_page:n,filter:u,with:["parent"].concat(i||[])};return s=Object.assign(s,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),a["a"].request({url:o,method:"get",params:s})},u=function(e){var t=e.current_page,n=void 0===t?0:t,a=e.filter,o=void 0===a?{}:a,u=e.with,i={current_page:n,filter:Object.assign(o,{initiate_user_id:r["a"].state.common.user_id}),with:u};return c(i)},i=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"get",params:t})},s=function(e){var t={data:e},n={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o,method:"post",data:t,params:n})},l=function(e,t){var n={data:t},c={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"put",data:n,params:c})},d=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"delete",params:t})}},2700:function(e,t,n){},"2cd2":function(e,t,n){"use strict";n.r(t);var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",[n("TopButtons"),n("div",{staticStyle:{height:"10px"}}),n("filter-component",{attrs:{fields:e.filterFields},on:{handleSearch:e.handleSearch}}),n("div",{staticStyle:{height:"10px"}}),n("table-component",{ref:"table",attrs:{columns:e.columns,request:e.tableRequest},on:{handleOperate:e.handleOperate}})],1)},r=[],o=n("0bbc"),c=n("3596"),u=n("e8c4"),i=n("a2ac"),s={components:{TopButtons:o["a"],filterComponent:i["a"],tableComponent:u["a"]},data:function(){return{modalTitle:null,modalVisible:!1,formId:0,columns:[{title:"#",dataIndex:"index",scopedSlots:{customRender:"index"}},{title:"规划名称",dataIndex:"title",key:"title"},{title:"规划目标党支部",dataIndex:"department.name",key:"department.name"},{title:"活动类型",dataIndex:"type_format",key:"type_format"},{title:"参加人数",dataIndex:"attend_users_count",key:"attend_users_count"},{title:"发布人",dataIndex:"initiate_user.name",key:"initiate_user.name"},{title:"发布时间",dataIndex:"published_at",key:"published_at"},{title:"操作",dataIndex:"operation",scopedSlots:{customRender:"operation"},buttons:{check:{visible:!0,disable:!1}}}],tableRequest:c["d"],filterFields:[{label:"党支部",field:"department_id"},{label:"开始时间",field:"start_timestamp"},{label:"结束时间",field:"end_timestamp"},{label:"关键字",field:"keyword"}]}},methods:{handleSearch:function(e){this.$refs.table.handleSearch(e)},handleCheck:function(e){this.$router.push({name:"活动规划查看",params:{id:e}})},handleOperate:function(e,t){switch(e){case"check":this.handleCheck(t.id);break}}}},l=s,d=n("2877"),f=Object(d["a"])(l,a,r,!1,null,null,null);f.options.__file="Index.vue";t["default"]=f.exports},3596:function(e,t,n){"use strict";n.d(t,"d",function(){return c}),n.d(t,"e",function(){return u}),n.d(t,"c",function(){return i}),n.d(t,"a",function(){return s}),n.d(t,"f",function(){return l}),n.d(t,"b",function(){return d});n("f751");var a=n("66df"),r=n("c0d6"),o=(n("2511"),"department_activity_plans/"),c=function(e){var t=e.current_page,n=void 0===t?0:t,c=e.filter,u=void 0===c?{}:c,i=e.with,s={current_page:n,filter:u,with:["parent"].concat(i||[])};return s=Object.assign(s,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),a["a"].request({url:o,method:"get",params:s})},u=function(e){var t=e.current_page,n=void 0===t?0:t,a=e.filter,o=void 0===a?{}:a,u=e.with,i={current_page:n,filter:Object.assign(o,{initiate_user_id:r["a"].state.common.user_id}),with:u};return c(i)},i=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"get",params:t})},s=function(e){var t={data:e},n={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o,method:"post",data:t,params:n})},l=function(e,t){var n={data:t},c={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"put",data:n,params:c})},d=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"delete",params:t})}},3846:function(e,t,n){n("9e1e")&&"g"!=/./g.flags&&n("86cc").f(RegExp.prototype,"flags",{configurable:!0,get:n("0bfb")})},"60f7":function(e,t,n){"use strict";var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("a-tree-select",{style:e.styleValue,attrs:{treeData:e.treeData,value:null!==e.value&&0!==e.value?e.value.toString():null,searchPlaceholder:"请点击选择",treeNodeFilterProp:"label"},on:{change:e.onChange}})},r=[],o=(n("24b4"),n("c405")),c={props:{value:{required:!1,default:function(){return""}},styleValue:{required:!1,default:function(){return{"min-width":"200px"}}}},model:{prop:"value",event:"change"},data:function(){return{treeData:[]}},methods:{init:function(){var e=this;Object(o["e"])().then(function(t){e.treeData=t})},onChange:function(e){this.$emit("change",e?parseInt(e):0)}},watch:{},created:function(){this.init()}},u=c,i=n("2877"),s=Object(i["a"])(u,a,r,!1,null,null,null);s.options.__file="SelectCategory.vue";t["a"]=s.exports},"6b54":function(e,t,n){"use strict";n("3846");var a=n("cb7c"),r=n("0bfb"),o=n("9e1e"),c="toString",u=/./[c],i=function(e){n("2aba")(RegExp.prototype,c,e,!0)};n("79e5")(function(){return"/a/b"!=u.call({source:"a",flags:"b"})})?i(function(){var e=a(this);return"/".concat(e.source,"/","flags"in e?e.flags:!o&&e instanceof RegExp?r.call(e):void 0)}):u.name!=c&&i(function(){return u.call(this)})},"88cd":function(e,t,n){"use strict";var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("a-tree-select",{style:e.styleValue,attrs:{treeData:e.treeData,value:null!==e.value&&0!==e.value?e.value.toString():null,searchPlaceholder:"请点击选择",treeNodeFilterProp:"label"},on:{change:e.onChange}})},r=[],o=(n("24b4"),n("0e8f")),c={props:{value:{required:!1,default:function(){return""}},styleValue:{required:!1,default:function(){return{"min-width":"200px"}}}},model:{prop:"value",event:"change"},data:function(){return{treeData:[]}},methods:{init:function(){var e=this;Object(o["f"])().then(function(t){e.treeData=t})},onChange:function(e){this.$emit("change",e?parseInt(e):0)}},watch:{},created:function(){this.init()}},u=c,i=n("2877"),s=Object(i["a"])(u,a,r,!1,null,null,null);s.options.__file="SelectDepartment.vue";t["a"]=s.exports},a2ac:function(e,t,n){"use strict";var a=function(){var e=this,t=this,n=t.$createElement,a=t._self._c||n;return a("div",[a("a-form",{attrs:{layout:t.formLayout,autoFormCreate:function(t){e.form=t}},on:{submit:function(e){t.handleSearch(!1)}}},[t._l(t.fields,function(e){return[t.formIf(e,["user_id"])?a("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[a("SelectUser")],1):t._e(),t.formIf(e,["category_id"])?a("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[a("SelectCategory")],1):t.formIf(e,["department_id"])?a("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[a("SelectDepartment")],1):t.formIf(e,["start_timestamp","end_timestamp"])?a("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[a("DateTime")],1):t.formIf(e,["keyword"])?a("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[a("a-input",{attrs:{placeholder:"请输入"+e.label}})],1):t._e()]}),t.fields.length?a("a-form-item",{attrs:{wrapperCol:t.buttonItemLayout.wrapperCol}},[a("a-button-group",[a("a-button",{attrs:{type:"primary"},on:{click:function(e){t.handleSearch(!1)}}},[t._v("搜索")]),a("a-button",{on:{click:function(e){t.handleSearch(!0)}}},[t._v("清空")])],1)],1):t._e(),a("a-form-item",{attrs:{wrapperCol:t.buttonItemLayout.wrapperCol}},[a("a-button",{attrs:{type:"primary"},on:{click:function(e){t.handleExport()}}},[t._v("导出")])],1)],2)],1)},r=[],o=n("60f7"),c=n("c281"),u=n("88cd"),i=n("c424"),s={components:{SelectCategory:o["a"],SelectUser:c["a"],SelectDepartment:u["a"],DateTime:i["a"]},props:{fields:{required:!0,type:Array}},data:function(){return{formLayout:"inline",form:{}}},methods:{formIf:function(e,t){for(var n=0;n<t.length;n++)if(t[n]===e.field)return!0;return!1},handleFormLayoutChange:function(e){this.formLayout=e.target.value},handleSearch:function(){var e=arguments.length>0&&void 0!==arguments[0]&&arguments[0];console.log(e);var t={};if(e)for(var n=0;n<this.fields.length;n++){var a={};a[this.fields[n].field]=null,console.log(a),this.form.setFieldsValue(a)}else t=this.form.getFieldsValue();this.$emit("handleSearch",t)},handleExport:function(){this.$message.success("功能开发中")}},computed:{formItemLayout:function(){var e=this.formLayout;return"horizontal"===e?{labelCol:{span:4},wrapperCol:{span:14}}:{}},buttonItemLayout:function(){var e=this.formLayout;return"horizontal"===e?{wrapperCol:{span:14,offset:4}}:{}}}},l=s,d=n("2877"),f=Object(d["a"])(l,a,r,!1,null,null,null);f.options.__file="Index.vue";t["a"]=f.exports},bb715:function(e,t,n){"use strict";var a=n("2700"),r=n.n(a);r.a},c281:function(e,t,n){"use strict";var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("a-tree-select",{style:e.styleValue,attrs:{treeData:e.treeData,value:e.getValue(e.value),searchPlaceholder:"请点击选择",treeNodeFilterProp:"label",disabled:e.disabled},on:{change:e.onChange}})},r=[],o=(n("24b4"),n("0e8f")),c={props:{value:{required:!1,default:function(){return""}},styleValue:{required:!1,default:function(){return{"min-width":"200px"}}},disabled:{required:!1,type:Boolean,default:function(){return!1}}},model:{prop:"value",event:"change"},data:function(){return{treeData:[]}},methods:{getValue:function(e){return[e]},init:function(){var e=this;Object(o["h"])().then(function(t){e.treeData=t})},onChange:function(e){if(void 0===e)return this.$message.warning("选择错误，请重新选择"),!1;this.$emit("change",e?parseInt(e):0)}},watch:{},created:function(){this.init()}},u=c,i=n("2877"),s=Object(i["a"])(u,a,r,!1,null,null,null);s.options.__file="SelectUser.vue";t["a"]=s.exports},c405:function(e,t,n){"use strict";n.d(t,"d",function(){return u}),n.d(t,"f",function(){return i}),n.d(t,"e",function(){return s}),n.d(t,"c",function(){return l}),n.d(t,"a",function(){return d}),n.d(t,"g",function(){return f}),n.d(t,"b",function(){return m});n("6b54"),n("7f7f"),n("f751");var a=n("66df"),r=n("c0d6"),o="categories/",c=function(e){var t=e.current_page,n=void 0===t?0:t,c=e.filter,u=void 0===c?{}:c,i={current_page:n,filter:u};return i=Object.assign(i,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),a["a"].request({url:o,method:"get",params:i})},u=function(e){var t={};return t=Object.assign(t,{token:r["a"].state.common.token,access_token:r["a"].state.common.access_token}),a["a"].request({url:o+e+"/children_and_published_article",method:"get",params:t})},i=function(){return c({current_page:0,filter:{}}).then(function(e){for(var t={},n=0;n<e.data.rows.length;n++)t[e.data.rows[n].id]=e.data.rows[n];var a=10;while(a>0){for(var r in t)0!==t[r].parent_id&&t[r].level===a&&(t[t[r].parent_id].hasOwnProperty("children")||(t[t[r].parent_id].children=[]),t[t[r].parent_id].children.push(t[r]),delete t[r]);a--}var o=[];for(var c in t)o.push(t[c]);return o})},s=function(){return c({current_page:0,filter:{}}).then(function(e){for(var t={},n=0;n<e.data.rows.length;n++)t[e.data.rows[n].id]={id:e.data.rows[n].id,parent_id:e.data.rows[n].parent_id,label:e.data.rows[n].name+" - 文章 "+e.data.rows[n].posts_count+" 篇",level:e.data.rows[n].level,value:e.data.rows[n].id.toString()};var a=10;while(a>0){for(var r in t)0!==t[r].parent_id&&t[r].level===a&&(t[t[r].parent_id].hasOwnProperty("children")||(t[t[r].parent_id].children=[]),t[t[r].parent_id].children.push(t[r]),delete t[r]);a--}var o=[];for(var c in t)o.push(t[c]);return o})},l=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"get",params:t})},d=function(e){var t={data:e},n={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o,method:"post",data:t,params:n})},f=function(e,t){var n={data:t},c={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"put",data:n,params:c})},m=function(e){var t={token:r["a"].state.common.token,access_token:r["a"].state.common.access_token};return a["a"].request({url:o+e,method:"delete",params:t})}},c424:function(e,t,n){"use strict";var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("a-date-picker",{staticStyle:{width:"190px"},attrs:{showTime:"",format:"YYYY-MM-DD HH:mm:ss",placeholder:e.placeholder,value:e.getValue(e.value)},on:{change:e.onChange,ok:e.onOk}})},r=[],o=(n("c5f6"),{props:{value:{type:Number,required:!1},placeholder:{required:!1,type:String,default:function(){return"点击选择"}}},model:{prop:"value",event:"change"},methods:{getValue:function(e){return isNaN(e)?e:moment(1e3*e)},onChange:function(e,t){var n=e?e.valueOf()/1e3:null;console.log(parseInt(n)),this.$emit("change",parseInt(n))},onOk:function(e){var t=e?e.valueOf()/1e3:null;console.log(parseInt(t)),this.$emit("change",parseInt(t))}}}),c=o,u=n("2877"),i=Object(u["a"])(c,a,r,!1,null,null,null);i.options.__file="DateTime.vue";t["a"]=i.exports}}]);
//# sourceMappingURL=chunk-968e.b3613e24.js.map