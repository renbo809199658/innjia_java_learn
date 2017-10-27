<#include "/frame/_layout.ftl"/>
<@layout page_tab="role">
<style>
	.round { 
		width: 100px;
		height: 100px;
		line-height:100px;
		margin:20px;
		background-color: #a72525;
		-webkit-border-radius: 100px;
	} 
	
	.circle { 
		width: 100px; 
		height: 100px; 
		line-height:100px;
		margin:20px;
		background-color: #efefef; /* Can be set to transparent */ 
		border: 3px #a72525 solid; 
		-webkit-border-radius: 100px; 
	} 
</style>

<script>
	function roleUserAdd() {
		common_modals.showRemoteModal("${basePath }/admin/role/roleUserAdd.do?roleId=${role.id!}");
	}
	
	function roleUserRemove(userId) {
		var href = "${basePath }/admin/role/removeRoleUser.do";
		var params = {
			roleId:"${role.id!}",
			userId:userId
		};
		ajaxDo(href, params, function(){
    		window.location.reload();//刷新当前页面.
    	});
	}
	
</script>

<div class="ibox">
    <div class="ibox-title">
    	<div class="form-group">
				<label class="control-label">角色：</label>
				<select name="role" class="form-control" onchange="roleChange(this.value)">
    				<#list roles as vo>
    					<option value="${vo.id!""}" <#if vo.id=="${role.id!}"> selected="selected" </#if>>${vo.roleName!""}</option>
    				</#list>
				</select>
		</div>
    </div>
    <div class="ibox-content">
    	<div class="row text-center vertical-middle-sm">
    		<div class="col-md-2 col-sm-2">
    			<a><div class="circle" onclick="roleUserAdd()">
    				<span class="text-center">.<i class="glyphicon glyphicon-plus"></i></span>
    			</div></a>
  			</div>
  			
    		<#list role.users as user>
    			<div class="col-md-2 col-sm-2">
    				<div class="round" ondblclick="roleUserRemove('${user.id}')">
    					<span style="color:white;">${user.userName!""}</span>
    				</div>
  				</div>
    		</#list>
  			
		</div>
    </div>
</div>


</@layout>