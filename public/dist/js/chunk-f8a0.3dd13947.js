(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-f8a0"],{2423:function(e,t,a){"use strict";a.d(t,"f",function(){return l}),a.d(t,"h",function(){return s}),a.d(t,"g",function(){return i}),a.d(t,"i",function(){return c}),a.d(t,"e",function(){return u}),a.d(t,"b",function(){return d}),a.d(t,"c",function(){return m}),a.d(t,"j",function(){return f}),a.d(t,"d",function(){return p}),a.d(t,"a",function(){return h});a("f751");var o=a("66df"),n=a("c0d6"),r="articles/",l=function(e){var t=e.current_page,a=void 0===t?0:t,l=e.filter,s=void 0===l?{}:l,i={current_page:a,filter:s};return i=Object.assign(i,{token:n["a"].state.common.token,access_token:n["a"].state.common.access_token}),o["a"].request({url:r,params:i,method:"get"})},s=function(e){var t=e.current_page,a=void 0===t?0:t,l=e.filter,s=void 0===l?{}:l,i={current_page:a,filter:s};return i=Object.assign(i,{token:n["a"].state.common.token,access_token:n["a"].state.common.access_token}),o["a"].request({url:r+"published",params:i,method:"get"})},i=function(e){var t=e.current_page,a=void 0===t?0:t,l=e.filter,s=void 0===l?{}:l,i={current_page:a,filter:Object.assign(s,{audit_user_id:n["a"].state.common.user_id})};return i=Object.assign(i,{token:n["a"].state.common.token,access_token:n["a"].state.common.access_token}),o["a"].request({url:r+"audit_user",params:i,method:"get"})},c=function(e){var t=e.current_page,a=void 0===t?0:t,l=e.filter,s=void 0===l?{}:l,i={current_page:a,filter:Object.assign(s,{user_id:n["a"].state.common.user_id})};return i=Object.assign(i,{token:n["a"].state.common.token,access_token:n["a"].state.common.access_token}),o["a"].request({url:r+"user",params:i,method:"get"})},u=function(e){var t={token:n["a"].state.common.token,access_token:n["a"].state.common.access_token};return o["a"].request({url:r+e,method:"get",params:t})},d=function(e){var t={token:n["a"].state.common.token,access_token:n["a"].state.common.access_token};return o["a"].request({url:r+e+"/check",method:"get",params:t})},m=function(e){var t={data:e},a={token:n["a"].state.common.token,access_token:n["a"].state.common.access_token};return o["a"].request({url:r,method:"post",data:t,params:a})},f=function(e,t){var a={data:t},l={token:n["a"].state.common.token,access_token:n["a"].state.common.access_token};return o["a"].request({url:r+e,method:"put",data:a,params:l})},p=function(e){var t={token:n["a"].state.common.token,access_token:n["a"].state.common.access_token};return o["a"].request({url:r+e,method:"delete",params:t})},h=function(e,t){var a={token:n["a"].state.common.token,access_token:n["a"].state.common.access_token};return o["a"].request({url:r+e+"/audit",method:"post",data:t,params:a})}},3424:function(e,t,a){"use strict";a.r(t);var o=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("table-component",{ref:"table",attrs:{columns:e.columns,request:e.tableRequest},on:{handleOperate:e.handleOperate}},[a("template",{slot:"top"},[a("a-button",{attrs:{type:"primary"},on:{click:function(t){e.handleCreate()}}},[e._v("新增\n            ")]),a("div",{staticStyle:{height:"10px"}}),a("filter-component",{attrs:{fields:e.filterFields},on:{handleSearch:e.handleSearch}}),a("div",{staticStyle:{height:"10px"}})],1)],2),a("a-modal",{attrs:{width:"90%",title:e.modalTitle,footer:null,destroyOnClose:!0},model:{value:e.modalVisible,callback:function(t){e.modalVisible=t},expression:"modalVisible"}},[a("form-component",{attrs:{id:e.formId}})],1)],1)},n=[],r=a("2423"),l=a("e8c4"),s=a("ec56"),i=a("a2ac"),c={components:{filterComponent:i["a"],tableComponent:l["a"],FormComponent:s["a"]},data:function(){return{modalTitle:null,modalVisible:!1,formId:0,columns:[{title:"#",dataIndex:"index",scopedSlots:{customRender:"index"}},{title:"标题",dataIndex:"post_title",key:"post_title"},{title:"栏目名称",dataIndex:"category_name",key:"category_name"},{title:"作者",dataIndex:"user.name",key:"user.name"},{title:"点击量",dataIndex:"post_hits",key:"post_hits"},{title:"评论量",dataIndex:"post_comments",key:"post_comments"},{title:"更新时间",dataIndex:"updated_at",key:"updated_at"},{title:"发布时间",dataIndex:"published_at",key:"published_at"},{title:"操作",dataIndex:"operation",scopedSlots:{customRender:"operation"},buttons:{edit:{visible:!0,disable:!1},delete:{visible:!0,disable:!1}}}],tableRequest:r["f"],filterFields:[{label:"栏目",field:"category_id"},{label:"发布时间",field:"start_timestamp"},{label:"-",field:"end_timestamp"},{label:"关键字",field:"keyword"}]}},methods:{handleSearch:function(e){this.$refs.table.handleSearch(e)},handleCreate:function(){this.modalTitle="新增文章",this.modalVisible=!0,this.formId=null},handleEdit:function(e){this.modalTitle="编辑文章",this.modalVisible=!0,this.formId=e},handleOperate:function(e,t){var a=this;switch(e){case"create":this.handleCreate();break;case"edit":this.handleEdit(t.id);break;case"delete":Object(r["d"])(t.id).then(function(e){a.$message.success("删除成功"),a.$refs.table.reFetch()});break}}}},u=c,d=(a("7690"),a("2877")),m=Object(d["a"])(u,o,n,!1,null,"cce3137c",null);m.options.__file="Index.vue";t["default"]=m.exports},7690:function(e,t,a){"use strict";var o=a("7e08"),n=a.n(o);n.a},"7e08":function(e,t,a){},"88cd":function(e,t,a){"use strict";var o=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("a-tree-select",{style:e.styleValue,attrs:{treeData:e.treeData,value:null!==e.value&&0!==e.value?e.value.toString():null,searchPlaceholder:"请点击选择",treeNodeFilterProp:"label"},on:{change:e.onChange}})},n=[],r=(a("24b4"),a("0e8f")),l={props:{value:{required:!1,default:function(){return""}},styleValue:{required:!1,default:function(){return{"min-width":"200px"}}}},model:{prop:"value",event:"change"},data:function(){return{treeData:[]}},methods:{init:function(){var e=this;Object(r["f"])().then(function(t){e.treeData=t})},onChange:function(e){this.$emit("change",e?parseInt(e):0)}},watch:{},created:function(){this.init()}},s=l,i=a("2877"),c=Object(i["a"])(s,o,n,!1,null,null,null);c.options.__file="SelectDepartment.vue";t["a"]=c.exports},a2ac:function(e,t,a){"use strict";var o=function(){var e=this,t=this,a=t.$createElement,o=t._self._c||a;return o("div",[o("a-form",{attrs:{layout:t.formLayout,autoFormCreate:function(t){e.form=t}},on:{submit:function(e){t.handleSearch(!1)}}},[t._l(t.fields,function(e){return[t.formIf(e,["user_id"])?o("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[o("SelectUser")],1):t._e(),t.formIf(e,["category_id"])?o("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[o("SelectCategory")],1):t.formIf(e,["department_id"])?o("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[o("SelectDepartment")],1):t.formIf(e,["start_timestamp","end_timestamp"])?o("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[o("DateTime")],1):t.formIf(e,["keyword"])?o("a-form-item",{attrs:{colon:!1,label:e.label,labelCol:t.formItemLayout.labelCol,wrapperCol:t.formItemLayout.wrapperCol,fieldDecoratorId:e.field}},[o("a-input",{attrs:{placeholder:"请输入"+e.label}})],1):t._e()]}),t.fields.length?o("a-form-item",{attrs:{wrapperCol:t.buttonItemLayout.wrapperCol}},[o("a-button-group",[o("a-button",{attrs:{type:"primary"},on:{click:function(e){t.handleSearch(!1)}}},[t._v("搜索")]),o("a-button",{on:{click:function(e){t.handleSearch(!0)}}},[t._v("清空")])],1)],1):t._e(),o("a-form-item",{attrs:{wrapperCol:t.buttonItemLayout.wrapperCol}},[o("a-button",{attrs:{type:"primary"},on:{click:function(e){t.handleExport()}}},[t._v("导出")])],1)],2)],1)},n=[],r=a("60f7"),l=a("c281"),s=a("88cd"),i=a("c424"),c={components:{SelectCategory:r["a"],SelectUser:l["a"],SelectDepartment:s["a"],DateTime:i["a"]},props:{fields:{required:!0,type:Array}},data:function(){return{formLayout:"inline",form:{}}},methods:{formIf:function(e,t){for(var a=0;a<t.length;a++)if(t[a]===e.field)return!0;return!1},handleFormLayoutChange:function(e){this.formLayout=e.target.value},handleSearch:function(){var e=arguments.length>0&&void 0!==arguments[0]&&arguments[0];console.log(e);var t={};if(e)for(var a=0;a<this.fields.length;a++){var o={};o[this.fields[a].field]=null,console.log(o),this.form.setFieldsValue(o)}else t=this.form.getFieldsValue();this.$emit("handleSearch",t)},handleExport:function(){this.$message.success("功能开发中")}},computed:{formItemLayout:function(){var e=this.formLayout;return"horizontal"===e?{labelCol:{span:4},wrapperCol:{span:14}}:{}},buttonItemLayout:function(){var e=this.formLayout;return"horizontal"===e?{wrapperCol:{span:14,offset:4}}:{}}}},u=c,d=a("2877"),m=Object(d["a"])(u,o,n,!1,null,null,null);m.options.__file="Index.vue";t["a"]=m.exports}}]);
//# sourceMappingURL=chunk-f8a0.3dd13947.js.map