(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-db90"],{"76f6":function(e,t,a){"use strict";var n=a("ab49"),i=a.n(n);i.a},ab49:function(e,t,a){},ccad:function(e,t,a){"use strict";a.r(t);var n=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("table-component",{ref:"table",attrs:{columns:e.columns,request:e.tableRequest},on:{handleOperate:e.handleOperate}},[a("template",{slot:"top"},[a("a-button",{attrs:{type:"primary"},on:{click:function(t){e.handleCreate()}}},[e._v("新增\n            ")]),a("div",{staticStyle:{height:"10px"}})],1)],2),a("a-modal",{attrs:{width:"90%",title:e.modalTitle,footer:null,destroyOnClose:!0},model:{value:e.modalVisible,callback:function(t){e.modalVisible=t},expression:"modalVisible"}},[a("form-component",{attrs:{id:e.formId}})],1)],1)},i=[],l=(a("cadf"),a("551c"),a("097d"),a("bbf8")),o=a("e8c4"),s=a("424b"),d={components:{tableComponent:o["a"],FormComponent:s["a"]},data:function(){return{modalTitle:null,modalVisible:!1,formId:0,columns:[{title:"#",dataIndex:"index",scopedSlots:{customRender:"index"}},{title:"上传人",dataIndex:"user_name",key:"user_name"},{title:"分类名称",dataIndex:"category_name",key:"category_name"},{title:"题目数量",dataIndex:"question_count",key:"question_count"},{title:"操作",dataIndex:"operation",scopedSlots:{customRender:"operation"},buttons:{edit:{visible:!0,disable:!1},delete:{visible:!0,disable:!1}}}],tableRequest:l["d"]}},methods:{handleSearch:function(e){this.$refs.table.handleSearch(e)},handleCreate:function(){this.modalTitle="新增分类",this.modalVisible=!0,this.formId=null},handleEdit:function(e){this.modalTitle="编辑分类",this.modalVisible=!0,this.formId=e},handleOperate:function(e,t){var a=this;switch(e){case"create":this.handleCreate();break;case"edit":this.handleEdit(t.id);break;case"delete":Object(l["b"])(t.id).then(function(e){a.$message.success("删除成功"),a.$refs.table.reFetch()});break}}}},c=d,r=(a("76f6"),a("2877")),u=Object(r["a"])(c,n,i,!1,null,"18522953",null);u.options.__file="Index.vue";t["default"]=u.exports}}]);
//# sourceMappingURL=chunk-db90.6f3eef25.js.map