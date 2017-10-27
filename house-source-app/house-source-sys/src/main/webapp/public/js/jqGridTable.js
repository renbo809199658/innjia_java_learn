/**
 * @author ReedFan
 * jqgrid-table
 */


var common_jqgrid = function() {
	
	var tableId = "table";//表格id,默认为table
	var pagerId = "pager";//分页栏id，默认为pager
	
	var selections = [];//选择器
	
	var options = null;//配置项
	
    var init = function() {
    	$.jgrid.defaults.styleUI = 'Bootstrap';
    	if (options == null) {
    		options = getDefaultOptions();
    	}
    	//配置列表
    	$("#"+tableId).jqGrid(options);
    	
    	// Setup buttons
        $("#"+tableId).jqGrid('navGrid', '#'+pagerId, {
            edit: false,
            add: false,
            del: false,
            search: false
        }, {
            height: 200,
            reloadAfterSubmit: true
        });
    	
        $("#"+tableId).closest(".ui-jqgrid-bdiv").css({ 'overflow-x' : 'scroll' });
        initToolButton();
        initEvent();
        
        //自适应大小
    	$(window).bind("resize",
    		function() {
				var width = $(".pageContent").width();
				var height = getHeight();
				$("#"+tableId).setGridWidth(width);
				$("#"+tableId).setGridHeight(height);
			}
    	);
    	
    }
    
    
    /**
     * 初始化事件
     */
    function initEvent() {
    	var events = {
    			loadComplete: function(XMLHttpRequest) { //数据下载完成
        			console.log("grid load complete");
        			
    			},
    			gridComplete: function() { //数据加载完成
    				console.log("grid complete");
    				//重新绑定icheckbox事件 ， 方法定义在icheckboxselect.js中
    				iCheckBoxBind();
    				//重新绑定按钮点击事件
    				$.getScript(basePath+'/public/js/viewBind.js',function(){
    					
    				});
    				//给表格cell复制value值
    				var rowIds = $("#"+tableId).jqGrid('getDataIDs');
                    for(var k=0; k<rowIds.length; k++) {
                       var curRowData = $("#"+tableId).jqGrid('getRowData', rowIds[k]);
                       var curChk = $("#"+rowIds[k]+"").find(":checkbox");
                       curChk.attr('value', curRowData['id']);   //给checkbox赋值
                       if (ids.indexOf(rowIds[k]) >= 0) {
                    	   curChk.iCheck('check');   //设置所有checkbox被选中
                       }
                       
                    }
                    
                    //右键菜单
        			$("tr.jqgrow", this).contextMenu('jqgridMenu', {
                        bindings: { //右键菜单绑定的事件
                        "edit": function(trigger) { 
                  			console.log(trigger.id);
                  			
                         },
                         "detail": function(trigger) { 
                        	 console.log(trigger.id);
                         },
                         "tallyAccoutInfo": function(trigger) { 
                        	 console.log(trigger.id);
                         }
                   },
                   //重写onContextMenu和onShowMenu事件
                   onContextMenu: function(e) {//显示菜单
                        var rowId = $(e.target).closest("tr.jqgrow").attr("id");//获得RowID 
//                        $("#"+tableId).jqGrid('setSelection',rowId);
                        console.log(e.target);
                         if( $(e.target).attr("id")=="dontShow")return false;
                          else return true;
                   },
                   onShowMenu: function(e,menu) {//显示菜单
                	   console.log(menu);
                         return menu;
                    },
                    menuStyle: { //菜单样式
                             backgroundColor: '#fcfdfd',
                             border: '1px solid #a6c9e2', 
                             maxWidth: '600px', // to be sure 
                             width: '150px' // to have good width of the menu 
                    }, 
                    itemHoverStyle: { //点击菜单上面的样式
                           border: '1px solid #79b7e7',
                           color: '#1d5987', 
                           backgroundColor: '#d0e5f5'
                         }
                   })
                    
    			},
    			
        		ondblClickRow : function(rowid) { // 双击行
        			selectEditRow(rowid);
        		},
        		onRightClickRow : function(rowid) {// 右键单击
        			
        		},
        		beforeSelectRow: function (rowid, e) {  
        			//设置单击行时不选中
        			var $myGrid = $(this),  
        				i = $.jgrid.getCellIndex($(e.target).closest('td')[0]),  
        			    cm = $myGrid.jqGrid('getGridParam', 'colModel');  
        			return (cm[i].name === 'cb');  
        		},
        		onSelectRow : function(rowid, status) {// 左键单击  
        			singleSelect = true;
        			var rowIds = $("#"+tableId).jqGrid('getDataIDs');
                    for(var k=0; k<rowIds.length; k++) {
                       $("#jqg_table_"+rowIds[k]).iCheck("uncheck");
                    }
                    
                    $("#jqg_table_"+rowid).iCheck("check");
        		},
        		onSelectAll:function(aRowids, status) {
        			var ids = getSelecteds();
        	        
        		}
        	};
        $("#"+tableId).jqGrid('setGridParam', events);

    }
    
    /**
     * 设置增删改按钮
     */
    function initToolButton() {
    	
    	if (options.editurl != null && !options.editurl.isEmpty()) {
    		$("#"+tableId).navButtonAdd('#'+pagerId,{
    	      	   caption:"",
    	      	   buttonicon:"glyphicon-edit",
    	      	   onClickButton: function() {
    	      		   //改
    	      		   var href = options.editurl;
    	      		   modalViewAfterSelect(href);
    	      	   },
    	      	   position:"first"
    	      	});
    	}
    	if (options.deleteurl != null && !options.deleteurl.isEmpty()) {
    		$("#"+tableId).navButtonAdd('#'+pagerId,{
    	      	   caption:"",
    	      	   buttonicon:"glyphicon-trash",
    	      	   onClickButton: function() {
    	      		   //删
    	      		   var href = options.deleteurl;
    	      		   ajaxGridDelete(href,function(){
    	      	        	window.location.reload();//刷新当前页面.
    	      	       });
    	      	   },
    	      	   position:"first"
    	      	});
    	}
    	if (options.addurl != null && !options.addurl.isEmpty()) {
    		$("#"+tableId).navButtonAdd('#'+pagerId,{
    	      	   caption:"",
    	      	   buttonicon:"glyphicon-plus",
    	      	   onClickButton: function() {
    	      		   //增
    	      		 var href = options.addurl;
    	      		modalView(href);
    	      	   },
    	      	   position:"first"
    	      	});
    	}
    	
    }
    
    /**
     * 行编辑模式
     */
    function selectEditRow(id) {
    	if (options.updateurl == null || options.updateurl.isEmpty()) {
    		return;
    	}
    	if(id && id !== -1){
    		//行编辑模式配置
    		var editRowOptions = {
    				keys : true,        //这里按[enter]保存
                    url:  options.updateurl,
                    mtype : "POST",
                    restoreAfterError: true,
                    extraparam: {
                    	"id":id,
                        "userName": $("#"+id+"_userName").val()
                    },
                    oneditfunc: function(rowid){
                    	//在行成功转为编辑模式下触发的事件，参数为此行数据id
                        console.log(rowid);
                    },
                    succesfunc: function(response){
                        console.log("save success");
                        return true;
                    },
                    errorfunc: function(rowid, res){
                        console.log(rowid);
                        console.log(res);
                        common_modals.swalError("编辑失败",rowid);
                    }
    		};
//            var rowData = $("#"+tableId).jqGrid("getRowData", id);
            $('#'+tableId).jqGrid('restoreRow',id);
            $('#'+tableId).jqGrid('editRow',id,editRowOptions);
        }
    }
    
    /**
     * 行新增模式
     */
    function addddRowClient(rowId) {
    	//行编辑模式配置
		var addRowOptions = {
				rowID : "new_row",
			    initdata : {},
			    position :"first",
			    useDefValues : false,
			    useFormatter : false,
			    addRowParams : {
			    	extraparam:{
			    		
			    	}
			    },
                oneditfunc: function(rowid){
                	//在行成功转为编辑模式下触发的事件，参数为此行数据id
                    console.log(rowid);
                },
                succesfunc: function(response){
                    console.log("add success");
                    return true;
                },
                errorfunc: function(rowid, res){
                    console.log(rowid);
                    console.log(res);
                    common_modals.swalError("编辑失败",rowid);
                }
		};
        $('#'+tableId).jqGrid('addRow',addRowOptions);
    }

    
    function getHeight() {
        return $(window).height() - 240;
    }
    
    
    var createQueryParams = function (params) {
    	var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        	rows: $("#"+tableId).jqGrid("getGridParam","rowNum"),   //页面大小
        	page: $("#"+tableId).jqGrid("getGridParam","page")  //页码
    	};
    	//temp为temp和params合并后的对象，如果temp和params有相同字段，则params覆盖temp相同字段值 
    	temp = $.extend(true,temp,params);
    	return temp;
	};
    
	/**
	 * myOptions {
	 * pager:""
	 * url:""
	 * caption:""
	 * jsonReader:{}
	 * postData:{}
	 * }
	 * 
	 */
    var createOptions = function(myOptions) {
    	//先定义好默认的配置
    	options = getDefaultOptions();
    	//options为options和myOptions合并后的对象，如果options和myOptions有相同字段，则myOptions覆盖options相同字段值 
    	options = $.extend(true,options,myOptions);
    	
    	pagerId = options.pager;
    	var fdStart = pagerId.indexOf("#");
    	if(fdStart == 0){
    		pagerId = pagerId.substr(1);
    	}
    	if (options.tableId == undefined) {
    		options.tableId = "table";
    		alert("请设置tableId，默认id为table");
    	}
    	tableId = options.tableId;
    	
    	return options;
    }
    
    /**
     * 默认配置
     */
    function getDefaultOptions() {
    	var defaultOptions = {
    			url:"",
				datatype:"json",
                height: getHeight(),
                mtype:"POST",
                autowidth: true,
                shrinkToFit: false,
                rowNum: 20,
                rowList: [20, 30, 40, 50],
                pager: "#pager",
                pgtext:"第 {0} 页 共  {1} 页",
				recordtext: "显示 {0} - {1} 共 {2} 条",
                emptyrecords: "没有记录",
				viewrecords : true,
                loadtext: "加载中...",
                caption: "",
                add: true,
                edit: true,
                addtext: 'Add',
                edittext: 'Edit',
                hidegrid: false,
                multiselect: true,//复选框
                multiboxonly: true,//单选
                grouping:false,
             	groupingView : {
               		groupField : ['id']
             	},
                jsonReader: { //很重要 定义了 后台分页参数的名字。
                	root:"rows",
                	page:"page",
                	total:"pageCount",
                	records:"records",
                	repeatitems:false
                },
                colModel:[],
                prmNames: {
             		sort: "sort",
             		order: "order",
             		search: "search"
             	},
                sortable: true,
                sortorder:"asc"
        };
    	return defaultOptions;
    }
    
    function getSelecteds(){  
		//获取多选到的id集合  
		var ids = $("#"+tableId).jqGrid("getGridParam", "selarrrow");  
		//遍历访问这个集合  
		$(ids).each(function (index, id){  
			//由id获得对应数据行  
			var row = $("#"+tableId).jqGrid('getRowData', id);  
			alert("row.ID:"+row.ID+"  "+"row.fieldName:"+row.fieldName);  
		});  
	}
    
    function reloadTable(params) {
    	var data = {
    		postData:params
    	};
    	$("#"+tableId).jqGrid('setGridParam', data).trigger('reloadGrid');
    }
    
    //公共调用方法 , 合并单元格
    function mergerCell(gridName, CellName) {
    	console.log("length===>");
        //得到显示到界面的id集合 
        var mya = $("#" + gridName + "").getDataIDs(); 
        //当前显示多少条 
        var length = mya.length; 
        console.log("length--->" + length);
        for (var i = 0; i < length; i++) { 
            //从上到下获取一条信息 
            var before = $("#" + gridName + "").jqGrid('getRowData', mya[i]); 
            //定义合并行数 
            var rowSpanTaxCount = 1; 
            for (j = i + 1; j <= length; j++) { 
                //和上边的信息对比 如果值一样就合并行数+1 然后设置rowspan 让当前单元格隐藏 
                var end = $("#" + gridName + "").jqGrid('getRowData', mya[j]); 
                if (before[CellName] == end[CellName]) { 
                    rowSpanTaxCount++; 
                    $("#" + gridName + "").setCell(mya[j], CellName, '', { display: 'none' }); 
                } else { 
                    rowSpanTaxCount = 1; 
                    break; 
                } 
                $("#" + CellName + "" + mya[i] + "").attr("rowspan", rowSpanTaxCount); 
            } 
        }
    } 
    
    return {
    	init : init,
    	createOptions : createOptions,
    	createQueryParams : createQueryParams,
    	reloadTable : reloadTable,
    	initEvent : initEvent, 
    	initToolButton : initToolButton
    };
    
}();

//搜索
function search(formId) {
	var formData = $("#" + formId).serializeObject();
	var params = common_jqgrid.createQueryParams(formData);
	common_jqgrid.reloadTable(params);
}

$(function () {
	
});

