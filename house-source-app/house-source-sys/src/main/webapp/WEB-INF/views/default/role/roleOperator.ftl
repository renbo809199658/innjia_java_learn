<#include "/frame/_layout.ftl"/>
<@layout page_tab="roleOperator">

<ol class="breadcrumb" style="background-color:#f3f3f4">
    <li><a href="#">首页</a></li>
    <li class="active">角色权限设置</li>
</ol>

<div class="ibox">
    <div class="ibox-title">
    		<div class="form-group">
				<label class="control-label">授权角色：</label>
				<select name="role" class="form-control" onchange="roleChange(this.value)">
    				<#list roles as vo>
    					<option value="${vo.id!""}" <#if vo.id=="${role.id!}"> selected="selected" </#if>>${vo.roleName!""}</option>
    				</#list>
				</select>
			</div>
    </div>
    <div class="ibox-content">

	<div class="row">
		<div class="col-md-2 col-xs-2">
			<div><span>模块</span></div>
			<ul class="nav" id="topLevelMenuLi">
        		
    		</ul>
		</div>
		<div class="col-md-4 col-xs-4">
			<div><span>菜单</span></div>
			<ul class="nav" id="secondLevelMenuLi">
        		
    		</ul>
		</div>
		<div class="col-md-6 col-xs-6">
			<div><span>方法</span></div>
			<ul class="nav" id="methodLi">
        		
    		</ul>
		</div>
	</div>

	</div>
</div>

<script type="text/javascript">

	//key:二级菜单id ； value:一级菜单id
	var topMenuSecondMenuObj = new Map();
	//key:菜单方法id ； value:二级菜单id
	var secondMenuMethodObj = new Map();
	//key:一级菜单id ； value:一级菜单名
	var topMenuObj = new Map();
	//key:二级菜单id ； value:二级菜单名
	var secondMenuObj = new Map();
	//key:菜单方法id ； value:菜单方法名
	var methodObj = new Map();
	//key:菜单id ； value:accessId
	var accessMenuObj = new Map();
	//key:菜单方法id ； value:accessId
	var accessObj = new Map();

	/**
 	 * 初始化菜单功能数据
 	 */
	function initMenuMap() {
		<#list menus as vo>
				<#if vo.level?? && (vo.level == 0)>
					topMenuObj.put("${vo.id}","${vo.menuName}");
				<#elseif vo.level?? && (vo.level != 0) && (vo.level != "")>
					secondMenuObj.put("${vo.id}","${vo.menuName}");
					topMenuSecondMenuObj.put("${vo.id}","${vo.upId}");
					<#list vo.menuMethods as mvo>
						methodObj.put("${mvo.id}","${mvo.methodName}");
						secondMenuMethodObj.put("${mvo.id}","${vo.id}");
					</#list>
				</#if>
		</#list>
		<#list accesses as avo>
			<#if avo.menuMethodId==null || avo.menuMethodId=="">
				accessMenuObj.put("${avo.menuId}","${avo.id}");
			</#if>
			<#if avo.menuMethodId != null && avo.menuMethodId != "">
				accessObj.put("${avo.menuMethodId}","${avo.id}");
			</#if>
			
		</#list>
	}
	
	//模块菜单选择
	var selectTopLevelMenu = function(selectTopLevelMenuId,selectSecondLevelMenuId) {
		$("#topLevelMenuLi li").removeClass("active");
		$("ul #topLevelMenuLi_"+selectTopLevelMenuId).addClass("active");
		//一级菜单刷新
		topLevelMenu(selectTopLevelMenuId,selectSecondLevelMenuId);
		
		//二级菜单刷新
		var tempSelectSecondLevelMenuId = secondLevelMenu(selectTopLevelMenuId,selectSecondLevelMenuId);
		
		//菜单方法刷新
		menuMethod(tempSelectSecondLevelMenuId);
	}
	
	//二级菜单选择
	var selectSecondLevelMenu = function(selectSecondLevelMenuId) {
		
		$("#secondLevelMenuLi li").removeClass("active");
		$("ul #secondLevelMenuLi_"+selectSecondLevelMenuId).addClass("active");
		
		
		menuMethod(selectSecondLevelMenuId);
	}
	
	function initMenu() {
		topLevelMenu("","");
		topMenuObj.each(function(key,value,index){
			if (index == 1) {
				selectTopLevelMenu(key,"");
				return false;
			}
		});
	
	}
	
	function topLevelMenu(selectTopLevelMenuId,selectSecondLevelMenuId) {
		var topLevelMenuHtml = "";
		topMenuObj.each(function(key,value,index){
				//一级菜单
				var menuName = value;
				if (selectTopLevelMenuId == key) {
					if ("" == accessMenuObj.get(key)) {
						topLevelMenuHtml += "<li class='topLevelMenuLiClass active' id='topLevelMenuLi_"+key+"' rel='+key+'  onclick='selectTopLevelMenu(\""+key+"\",\"\")'><a class=''><input class='topMenu_access' id='"+key+"' type='checkbox' name='roleMenu1' value='"+key+"' >"+menuName+"</a></li>";
					} else {
						topLevelMenuHtml += "<li class='topLevelMenuLiClass active' id='topLevelMenuLi_"+key+"' rel='+key+'  onclick='selectTopLevelMenu(\""+key+"\",\"\")'><a class=''><input class='topMenu_access' id='"+key+"' type='checkbox' name='roleMenu1' value='"+key+"' checked='true'>"+menuName+"</a></li>";
					}
					
				} else {
					if ("" == accessMenuObj.get(key)) {
						topLevelMenuHtml += "<li class='topLevelMenuLiClass' id='topLevelMenuLi_"+key+"' rel='+key+'  onclick='selectTopLevelMenu(\""+key+"\",\"\")'><a class=''><input class='topMenu_access' id='"+key+"' type='checkbox' name='roleMenu1' value='"+key+"' >"+menuName+"</a></li>";
					} else {
						topLevelMenuHtml += "<li class='topLevelMenuLiClass' id='topLevelMenuLi_"+key+"' rel='+key+'  onclick='selectTopLevelMenu(\""+key+"\",\"\")'><a class=''><input class='topMenu_access' id='"+key+"' type='checkbox' name='roleMenu1' value='"+key+"' checked='true'>"+menuName+"</a></li>";
					}
					
				}
		});
		$("#topLevelMenuLi").html(topLevelMenuHtml);
		
		//复选框选择
		$('.topMenu_access').on('ifChanged', function(event){
			console.log("--->" + this.checked);
			tableCheckChanged(this.checked,this.value);
			changeMenuFunc(this.checked,this);
		});
	}
	
	function secondLevelMenu(selectTopLevelMenuId,selectSecondLevelMenuId) {
		//二级菜单刷新
		var secondLevelMenuHtml = "";
		var eachIndex = 0;
		var tempSelectSecondLevelMenuId = selectSecondLevelMenuId;
		topMenuSecondMenuObj.each(function(key,value,index){
			if (value == selectTopLevelMenuId) {
				//对应一级菜单下的二级菜单
				var secondLevelMenuName = secondMenuObj.get(key);
				if (eachIndex == 0){
					if (selectSecondLevelMenuId == "" || selectSecondLevelMenuId == null){
						//初始化二级菜单选择
						tempSelectSecondLevelMenuId = key;
					}
				}
				if (tempSelectSecondLevelMenuId == key) {
					if ("" == accessMenuObj.get(key)) {
						secondLevelMenuHtml += "<li class='secondLevelMenuLiClass active' id='secondLevelMenuLi_"+key+"' rel='+key+'  onclick='selectSecondLevelMenu(\""+key+"\")'><a class=''><input class='menu_access' id='"+key+"' type='checkbox' name='roleMenu2' value='"+key+"' >"+secondLevelMenuName+"</a></li>";
					} else {
						secondLevelMenuHtml += "<li class='secondLevelMenuLiClass active' id='secondLevelMenuLi_"+key+"' rel='+key+'  onclick='selectSecondLevelMenu(\""+key+"\")'><a class=''><input class='menu_access' id='"+key+"' type='checkbox' name='roleMenu2' value='"+key+"' checked='true'>"+secondLevelMenuName+"</a></li>";
					}
					
				} else {
					if ("" == accessMenuObj.get(key)) {
						secondLevelMenuHtml += "<li class='secondLevelMenuLiClass' id='secondLevelMenuLi_"+key+"' rel='+key+'  onclick='selectSecondLevelMenu(\""+key+"\")'><a class=''><input class='menu_access' id='"+key+"' type='checkbox' name='roleMenu2' value='"+key+"' >"+secondLevelMenuName+"</a></li>";
					} else {
						secondLevelMenuHtml += "<li class='secondLevelMenuLiClass' id='secondLevelMenuLi_"+key+"' rel='+key+'  onclick='selectSecondLevelMenu(\""+key+"\")'><a class=''><input class='menu_access' id='"+key+"' type='checkbox' name='roleMenu2' value='"+key+"' checked='true'>"+secondLevelMenuName+"</a></li>";
					}
					
				}
				
				eachIndex ++;
			}
		});
		$("#secondLevelMenuLi").html(secondLevelMenuHtml);
		
		//复选框选择
		$('.menu_access').on('ifChanged', function(event){
			tableCheckChanged(this.checked,this.value);
			changeMenuFunc(this.checked,this);
		});
		return tempSelectSecondLevelMenuId;
	}
	
	function menuMethod(selectSecondLevelMenuId) {
		//菜单方法刷新
		var methodHtml = "";
		secondMenuMethodObj.each(function(key,value,index){
			if (value == selectSecondLevelMenuId) {
				//对应二级菜单下的菜单方法
				var methodName = methodObj.get(key);
				if ("" == accessObj.get(key)) {
					methodHtml += "<li><label><input class='method_access' id='"+key+"' type='checkbox' name='roleMethod' value='"+value+"_"+key+"' > "+methodName+" &nbsp;&nbsp;</label></li>";
				} else {
					methodHtml += "<li><label><input class='method_access' id='"+key+"' type='checkbox' name='roleMethod' value='"+value+"_"+key+"' checked='true'> "+methodName+" &nbsp;&nbsp;</label></li>";
				}
				
			}
		});
		$("#methodLi").html(methodHtml);
		$('input').on('ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed', function(event){
     		}).iCheck({
       			checkboxClass:"icheckbox_square-green",
				radioClass:"iradio_square-green",
     		}
		);
		//复选框选择
		$('.method_access').on('ifChanged', function(event){
			tableCheckChanged(this.checked,this.value);
			changeFunc(this.checked,this);
		});
	}

	$(function () {
		//初始化菜单方法权限数据
		initMenuMap();
		//初始化菜单方法权限视图
		initMenu();
        
    });
	
	function addRoleAccess(box) {
		var items = [box.value];		// 角色功能ids
		var item = items[0];
		var secondLevelMenuId = "";
	    var methodId = "";
		if (item != null && item != "") {
	    	var item_item = item.split('_');
	    	if (item_item != null && item_item.length > 1) {
	    		secondLevelMenuId = item_item[0];
	    		methodId = item_item[1];
	    	} else {
	    		common_modals.swalError("参数错误","");
	    	}
	    } else {
	    	common_modals.swalError("参数错误","");
	    }
		var url = "${basePath!}/admin/role/addRoleAccess.do";
		var data = { "items" : items, "roleId" : '${role.id!}' };
		var result = common_ajax.ajaxFunc(url, data, "json");
		common_ajax.ajaxDone(result,
			function(status,message,descrip){
				if (status == "200"){
	    			//成功
	    			if (methodId != "") {
	    				accessObj.put(methodId,"${role.id!}");
	    			}
	    			common_modals.swalAlertByStatus(status,message,descrip, function(){});
	    		} 
			}
		);
		
		
	}
	
	function removeRoleAccess(box) {
		var items = [box.value];		// 
		var item = items[0];
		var secondLevelMenuId = "";
	    var methodId = "";
		if (item != null && item != "") {
	    	var item_item = item.split('_');
	    	if (item_item != null && item_item.length > 1) {
	    		secondLevelMenuId = item_item[0];
	    		methodId = item_item[1];
	    	} else {
	    		common_modals.swalError("参数错误","");
	    	}
	    } else {
	    	common_modals.swalError("参数错误","");
	    }
		var url = "${basePath!}/admin/role/removeRoleAccess.do";
		var data = { "items" : items, "roleId" : '${role.id!}' };
		var result = common_ajax.ajaxFunc(url, data, "json");
		common_ajax.ajaxDone(result,
			function(status,message,descrip){
				if (status == "200"){
	    			//成功
	    			if (methodId != "") {
	    				accessObj.remove(methodId); 
	    			}
	    			common_modals.swalAlertByStatus(status,message,descrip,function(){});
	    		} 
			}
		);
		
	}
	
	/**
	 * 权限变更
	 */
	function changeFunc(check,box){
		if(check){
			addRoleAccess(box);
		}else{
			removeRoleAccess(box);
		}
		
	}
	
	/**
	 * 菜单权限变更
	 */
	function changeMenuFunc(check,box) {
		if(check){
			addMenuRoleAccess(box);
		}else{
			removeMenuRoleAccess(box);
		}
	}
	
	function addMenuRoleAccess(box) {
		var items = [box.value];		// 角色功能ids
		var url = "${basePath!}/admin/role/addRoleAccess.do";
		var data = { "items" : items, "roleId" : '${role.id!}' };
		var result = common_ajax.ajaxFunc(url, data, "json");
		common_ajax.ajaxDone(result,
			function(status,message,descrip){
				if (status == "200"){
	    			//成功
	    			for (var i = 0; i < items.length; i++) {
        				accessMenuObj.put(items[i],"${role.id!}");
    				};
	    			common_modals.swalAlertByStatus(status,message,descrip, function(){});
	    		}
			}
		);
	}
	
	function removeMenuRoleAccess(box) {
		var items = [box.value];		// 角色功能ids
		var url = "${basePath!}/admin/role/removeRoleAccess.do";
		var data = { "items" : items, "roleId" : '${role.id!}' };
		var result = common_ajax.ajaxFunc(url, data, "json");
		common_ajax.ajaxDone(result,
			function(status,message,descrip){
				if (status == "200"){
	    			//成功
	    			for (var i = 0; i < items.length; i++) {
        				accessMenuObj.remove(items[i]);
    				};
	    			common_modals.swalAlertByStatus(status,message,descrip, function(){});
	    		} 
			}
		);
	}
	
	//角色改变
	function roleChange(roleId) {
		location.replace("${basePath!}/admin/role/roleOperator.do?id="+roleId);
	}
	
</script>
</@layout>