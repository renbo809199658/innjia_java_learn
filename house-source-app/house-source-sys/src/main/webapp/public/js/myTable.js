/**
 * @author ReedFan
 * bootstrap-table
 */
var common_table = function() {
	
	var $table;//表格table标签对象
	
	var selections = [];//选择器
	
	var options = {};//配置项
	
    var initTable = function() {
        setTable();
        // sometimes footer render error.
        setTimeout(function () {
        	resetTableView();
        }, 200);
        
        $table.on('check.bs.table uncheck.bs.table ' +
                'check-all.bs.table uncheck-all.bs.table', function () {
            //$remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
            // save your data, here just save the current page
            selections = getIdSelections();
            // push or splice the selections if you want to save all data selections
        });
        $table.on('expand-row.bs.table', function (e, index, row, $detail) {
            if (index % 2 == 1) {
                $detail.html('Loading from ajax request...');
                $.get('LICENSE', function (res) {
                    $detail.html(res.replace(/\n/g, '<br>'));
                });
            }
        });
        $table.on('all.bs.table', function (e, name, args) {
            console.log(name, args);
        });
//        $remove.click(function () {
//            var ids = getIdSelections();
//            $table.bootstrapTable('remove', {
//                field: 'id',
//                values: ids
//            });
//            $remove.prop('disabled', true);
//        });
        $(window).resize(function () {
            $table.bootstrapTable('resetView', {
                height: getHeight()
            });
        });
    }
    
    function setTable() {
    	$table.bootstrapTable('destroy');//先要将table销毁，否则会保留上次加载的内容
    	$table.bootstrapTable(options);
    }
    
    function resetTableView() {
        $table.bootstrapTable('resetView');
    }
    
    function getIdSelections() {
        return $.map($table.bootstrapTable('getSelections'), function (row) {
            return row.id
        });
    }
    var responseHandler = function(res) {
        $.each(res.rows, function (i, row) {
            row.state = $.inArray(row.id, selections) !== -1;
        });
        return res;
    }

    function detailFormatter(index, row) {
        var html = [];
        $.each(row, function (key, value) {
            html.push('<p><b>' + key + ':</b> ' + value + '</p>');
        });
        return html.join('');
    }
    function operateFormatter(value, row, index) {
        return [
            '<a class="like" href="javascript:void(0)" title="Like">',
            '<i class="glyphicon glyphicon-heart"></i>',
            '</a>  ',
            '<a class="remove" href="javascript:void(0)" title="Remove">',
            '<i class="glyphicon glyphicon-remove"></i>',
            '</a>'
        ].join('');
    }
    window.operateEvents = {
        'click .like': function (e, value, row, index) {
            alert('You click like action, row: ' + JSON.stringify(row));
        },
        'click .remove': function (e, value, row, index) {
            $table.bootstrapTable('remove', {
                field: 'id',
                values: [row.id]
            });
        }
    };
	
    function getHeight() {
        return $(window).height() - 100;
    }
    
    var createQueryParams = function (params) {
    	var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        	limit: params.limit,   //页面大小
        	offset: params.offset,  //页码
        	maxrows: params.limit,
        	pageindex:params.pageNumber,
        	search:params.search,
    	};
    	return temp;
	};
    
    var createOptions = function(dataUrl,columns,queryParams,tableObj) {
    	options = {
            	url:dataUrl,
            	classes:"table table-hover",
               	toolbar:"#toolbar",
               	idField:"id",
               	search:true,
               	showRefresh:true,
               	showToggle:true,
               	striped:true,
               	clickToSelect: true,
               	singleSelect:true,
               	showColumns:true,
               	showExport:true,
               	detailView:false,
               	minimumCountColumns:2,
               	showPaginationSwitch:true,
               	pagination: true,//是否分页
                pageSize: 20,//单页记录数
                pageList: [5, 10, 20, 50],//分页步进值
              	showFooter:false,
               	sidePagination:"server",
               	responseHandler:responseHandler,
               	queryParams: queryParams,
                height: getHeight(),
                iconsPrefix:"glyphicon",
                iconSize: "outline",
                buttonsAlign:"right",
                columns:columns,
                dataField:"rows"
            };
    	$table = tableObj;
    	return options;
    }
    
    return {
    	initTable : initTable,
    	createOptions : createOptions,
    	setTable : setTable
    };
    
}();

$(function () {
	
});

