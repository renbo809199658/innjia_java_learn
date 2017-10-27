	var singleSelect = false;//单选
	var ids = new Array();
	//表格复选框选中状态变化
	function tableCheckChanged(checked,value) {
		if (value == undefined || value == "") {
			return;
		}
		var index = $.inArray(value, ids);
		if (checked) {
			if (index == -1) {
				ids.push(value);
			}
		} else {
			if (index != -1) {
				ids.remove(index);
			}
		}
	}
	
	/**
	 * jqgrid 选中事件
	 * @param checked
	 * @param value
	 * @param singleSelect
	 * 		是否单选
	 */
	function jqgridCheckChanged(checked,value,singleSelect) {
		if (value == "on")
			return;
		if (singleSelect != null && singleSelect) {
			//单选
			ids.length = 0;
		}
		tableCheckChanged(checked,value);
	}
	
	//全选
	function jqgridCheckAll(idsSelect) {
		ids.length = 0;
		ids = idsSelect;
	}
	
	$(function () {
        //复选框 icheck 样式
		iCheckBoxBind();
	});
	$(window).load(function(){
    	//页面加载完成
		
	});
	
	/**
	 * icheckbox 事件动态绑定
	 */
	function iCheckBoxBind() {
		$('input').on('ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed', function(event){
			}).iCheck({
				checkboxClass:"icheckbox_square-green",
				radioClass:"iradio_square-green",
			}
		);
		//复选框选择
		$('input').on('ifChanged', function(event){
			jqgridCheckChanged(this.checked,this.value,singleSelect)
//			tableCheckChanged(this.checked,this.value);
		});
	}
	