(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-a5fb"],{"078e":function(t,e,n){"use strict";var r=n("c34f"),a=n.n(r);a.a},"0bfb":function(t,e,n){"use strict";var r=n("cb7c");t.exports=function(){var t=r(this),e="";return t.global&&(e+="g"),t.ignoreCase&&(e+="i"),t.multiline&&(e+="m"),t.unicode&&(e+="u"),t.sticky&&(e+="y"),e}},"20ff":function(t,e,n){"use strict";n.r(e);var r=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("TopButtons"),n("div",{staticStyle:{height:"10px"}}),n("a-alert",{attrs:{message:"功能提示",description:"党员可以浏览的所有党支部发表（已发布且已通过审核）的新闻，只可以浏览，无编辑、删除权限。",type:"info",showIcon:""}}),n("div",{staticStyle:{height:"10px"}}),n("CategoryList",{ref:"list",attrs:{id:t.categoryId,request:t.request,columns:t.columns},on:{handleOperate:t.handleOperate}})],1)},a=[],i=n("852d"),s=n("8480"),o=n("2423"),c={components:{TopButtons:i["a"],CategoryList:s["a"]},data:function(){return{categoryId:2,request:o["h"],columns:[{title:"操作",dataIndex:"operation",scopedSlots:{customRender:"operation"},buttons:{check:{visible:!0,disable:!1}}}]}},methods:{handleOperate:function(t,e){var n=this,r=e.id;switch(t){case"check":this.$router.push({name:"新闻查看",params:{id:r}});break;case"edit":this.$router.push({name:"新闻编辑",params:{id:r}});break;case"delete":Object(o["d"])(r).then(function(t){n.$message.success("删除成功"),n.$refs.list.reFetch()});break}}}},u=c,l=n("2877"),d=Object(l["a"])(u,r,a,!1,null,null,null);d.options.__file="Index.vue";e["default"]=d.exports},"2ac1":function(t,e,n){"use strict";var r=n("9d74"),a=n.n(r);a.a},3320:function(t,e,n){},3846:function(t,e,n){n("9e1e")&&"g"!=/./g.flags&&n("86cc").f(RegExp.prototype,"flags",{configurable:!0,get:n("0bfb")})},"4e4c":function(t,e,n){"use strict";var r=n("b607"),a=n.n(r);a.a},"6b54":function(t,e,n){"use strict";n("3846");var r=n("cb7c"),a=n("0bfb"),i=n("9e1e"),s="toString",o=/./[s],c=function(t){n("2aba")(RegExp.prototype,s,t,!0)};n("79e5")(function(){return"/a/b"!=o.call({source:"a",flags:"b"})})?c(function(){var t=r(this);return"/".concat(t.source,"/","flags"in t?t.flags:!i&&t instanceof RegExp?a.call(t):void 0)}):o.name!=s&&c(function(){return o.call(this)})},8480:function(t,e,n){"use strict";var r=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n(t.listTemplate,{ref:"component",tag:"components",attrs:{category:t.category,request:t.request,columns:t.columns,template:t.listTemplate},on:{setId:t.setId,handleOperate:t.handleOperate}})},a=[],i=(n("c5f6"),function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"card-container"},[n("a-tabs",{attrs:{activeKey:t.category.id.toString()},on:{change:t.handleClick}},t._l(t.siblings,function(e,r){return n("a-tab-pane",{key:e.id.toString(),attrs:{tab:e.name},on:{click:function(e){t.handleClick(r)}}},[e.id===t.category.id?[n("table-component",{ref:"table",refInFor:!0,attrs:{columns:t.columns,request:t.request,requestInitFilter:t.requestInitFilter},on:{handleOperate:t.handleOperate}})]:t._e()],2)}))],1)}),s=[],o=n("e8c4"),c={components:{tableComponent:o["a"]},props:{category:{required:!0,type:Object},request:{required:!0},columns:{required:!1,type:Array,default:function(){return[]}}},computed:{categoryId:function(){return this.category.hasOwnProperty("id")?this.category.id:-1},siblings:function(){return this.category.hasOwnProperty("siblings")&&this.category.siblings?this.category.siblings:[]},requestInitFilter:function(){return{category_id:this.categoryId}}},data:function(){return{columns:[{title:"#",dataIndex:"index",scopedSlots:{customRender:"index"}},{title:"标题",dataIndex:"post_title",key:"post_title"},{title:"审核状态",dataIndex:"audit_status_format",key:"audit_status_format"},{title:"操作",dataIndex:"operation",scopedSlots:{customRender:"operation"},buttons:{check:{visible:!0,disable:!1},edit:{visible:!0,disable:!1},audit:{visible:!0,disable:!1},delete:{visible:!0,disable:!1}}}]}},methods:{handleClick:function(t){this.$emit("setId",t)},handleOperate:function(t,e){this.$emit("handleOperate",t,e)},reFetch:function(){this.$refs.table.reFetch()}}},u=c,l=(n("2ac1"),n("2877")),d=Object(l["a"])(u,i,s,!1,null,null,null);d.options.__file="Index.vue";var h=d.exports,p=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"card-container"},[n("a-tabs",{attrs:{activeKey:t.category.id.toString()},on:{change:t.handleClick}},t._l(t.siblings,function(e,r){return n("a-tab-pane",{key:e.id.toString(),attrs:{tab:e.name},on:{click:function(e){t.handleClick(r)}}},[e.id===t.category.id?[n("table-component",{ref:"table",refInFor:!0,attrs:{template:t.template,columns:t.columns,request:t.request,requestInitFilter:t.requestInitFilter},on:{handleOperate:t.handleOperate}})]:t._e()],2)}))],1)},f=[],m={components:{tableComponent:o["a"]},props:{category:{required:!0,type:Object},request:{required:!0},template:{required:!0,type:String},columns:{required:!1,type:Array,default:function(){return[]}}},computed:{categoryId:function(){return this.category.hasOwnProperty("id")?this.category.id:-1},siblings:function(){return this.category.hasOwnProperty("siblings")&&this.category.siblings?this.category.siblings:[]},requestInitFilter:function(){return{category_id:this.categoryId}}},methods:{handleClick:function(t){this.$emit("setId",t)},handleOperate:function(t,e){this.$emit("handleOperate",t,e)},reFetch:function(){this.$refs.table.reFetch()}}},g=m,b=(n("078e"),Object(l["a"])(g,p,f,!1,null,null,null));b.options.__file="Index.vue";var y=b.exports,_=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"card-container"},[n("a-tabs",{attrs:{activeKey:t.category.id.toString()},on:{change:t.handleClick}},t._l(t.siblings,function(e,r){return n("a-tab-pane",{key:e.id.toString(),attrs:{tab:e.name},on:{click:function(e){t.handleClick(r)}}},[e.id===t.category.id?[n("table-component",{ref:"table",refInFor:!0,attrs:{template:t.template,columns:t.columns,request:t.request,requestInitFilter:t.requestInitFilter},on:{handleOperate:t.handleOperate}})]:t._e()],2)}))],1)},v=[],k={components:{tableComponent:o["a"]},props:{category:{required:!0,type:Object},request:{required:!0},template:{required:!0,type:String},columns:{required:!1,type:Array,default:function(){return[]}}},computed:{categoryId:function(){return this.category.hasOwnProperty("id")?this.category.id:-1},siblings:function(){return this.category.hasOwnProperty("siblings")&&this.category.siblings?this.category.siblings:[]},requestInitFilter:function(){return{category_id:this.categoryId}}},data:function(){return{}},methods:{handleClick:function(t){this.$emit("setId",t)},handleOperate:function(t,e){this.$emit("handleOperate",t,e)},reFetch:function(){this.$refs.table.reFetch()}}},q=k,I=(n("ae14"),Object(l["a"])(q,_,v,!1,null,null,null));I.options.__file="Index.vue";var O=I.exports,w=n("c405"),x={name:"Index",components:{list:h,list_online_learning:y,list_news:O},props:{id:{required:!0,type:[Number,String]},request:{require:!0},columns:{required:!1,type:Array,default:function(){return[]}}},data:function(){return{listTemplate:"",category:{},thisId:null}},methods:{setId:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:null;this.thisId=t||parseInt(this.id),this.fetch()},fetch:function(){var t=this;if(null===this.thisId)return!1;Object(w["c"])(this.thisId).then(function(e){t.listTemplate=e.data.list_template,t.category=e.data})},reFetch:function(){this.listTemplate=null,this.category=null,this.fetch()},handleOperate:function(t,e){this.$emit("handleOperate",t,e)}},watch:{$route:{handler:function(){this.setId()},immediate:!0}}},F=x,$=(n("4e4c"),Object(l["a"])(F,r,a,!1,null,"71790bce",null));$.options.__file="Index.vue";e["a"]=$.exports},"9d74":function(t,e,n){},ae14:function(t,e,n){"use strict";var r=n("3320"),a=n.n(r);a.a},b607:function(t,e,n){},c34f:function(t,e,n){},c405:function(t,e,n){"use strict";n.d(e,"d",function(){return o}),n.d(e,"f",function(){return c}),n.d(e,"e",function(){return u}),n.d(e,"c",function(){return l}),n.d(e,"a",function(){return d}),n.d(e,"g",function(){return h}),n.d(e,"b",function(){return p});n("6b54"),n("7f7f"),n("f751");var r=n("66df"),a=n("c0d6"),i="categories/",s=function(t){var e=t.current_page,n=void 0===e?0:e,s=t.filter,o=void 0===s?{}:s,c={current_page:n,filter:o};return c=Object.assign(c,{token:a["a"].state.common.token,access_token:a["a"].state.common.access_token}),r["a"].request({url:i,method:"get",params:c})},o=function(t){var e={};return e=Object.assign(e,{token:a["a"].state.common.token,access_token:a["a"].state.common.access_token}),r["a"].request({url:i+t+"/children_and_published_article",method:"get",params:e})},c=function(){return s({current_page:0,filter:{}}).then(function(t){for(var e={},n=0;n<t.data.rows.length;n++)e[t.data.rows[n].id]=t.data.rows[n];var r=10;while(r>0){for(var a in e)0!==e[a].parent_id&&e[a].level===r&&(e[e[a].parent_id].hasOwnProperty("children")||(e[e[a].parent_id].children=[]),e[e[a].parent_id].children.push(e[a]),delete e[a]);r--}var i=[];for(var s in e)i.push(e[s]);return i})},u=function(){return s({current_page:0,filter:{}}).then(function(t){for(var e={},n=0;n<t.data.rows.length;n++)e[t.data.rows[n].id]={id:t.data.rows[n].id,parent_id:t.data.rows[n].parent_id,label:t.data.rows[n].name+" - 文章 "+t.data.rows[n].posts_count+" 篇",level:t.data.rows[n].level,value:t.data.rows[n].id.toString()};var r=10;while(r>0){for(var a in e)0!==e[a].parent_id&&e[a].level===r&&(e[e[a].parent_id].hasOwnProperty("children")||(e[e[a].parent_id].children=[]),e[e[a].parent_id].children.push(e[a]),delete e[a]);r--}var i=[];for(var s in e)i.push(e[s]);return i})},l=function(t){var e={token:a["a"].state.common.token,access_token:a["a"].state.common.access_token};return r["a"].request({url:i+t,method:"get",params:e})},d=function(t){var e={data:t},n={token:a["a"].state.common.token,access_token:a["a"].state.common.access_token};return r["a"].request({url:i,method:"post",data:e,params:n})},h=function(t,e){var n={data:e},s={token:a["a"].state.common.token,access_token:a["a"].state.common.access_token};return r["a"].request({url:i+t,method:"put",data:n,params:s})},p=function(t){var e={token:a["a"].state.common.token,access_token:a["a"].state.common.access_token};return r["a"].request({url:i+t,method:"delete",params:e})}}}]);
//# sourceMappingURL=chunk-a5fb.da29ae65.js.map