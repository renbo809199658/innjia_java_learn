<#include "/frame/_layout.ftl"/>
<@layout page_tab="updatePassword">
<div class="ibox">
    <div class="ibox-title">
    	<h2 class="pull-left"><small>密码修改</small></h2>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    	<div class="ibox-content">
    		<div class="pageContent">
    			<form class="form-horizontal m-t" id="ajaxForm" action="${basePath }/admin/user/updatePassword.do" method="post" >
    				<input type="hidden" name="uid" value="${model.id}"/>
    				<div class="pageFormContent">
    					<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">账号：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="loginName" value="${model.loginName}" readonly type="text" required aria-required="true" aria-invalid="false"/>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">姓名：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="userName" value="${model.userName}" readonly type="text" required aria-required="true" aria-invalid="false" />
							</div>
						</div>
						
							<div class="form-group col-md-12 col-sm-12">
								<label class="col-md-3 col-sm-3 control-label">原密码：</label>
								<div class="col-md-9 col-sm-9">
									<input class="form-control" name="oldLoginPwd" type="text"/>
								</div>
							</div>
							<div class="form-group col-md-12 col-sm-12">
								<label class="col-md-3 col-sm-3 control-label">新密码：</label>
								<div class="col-md-9 col-sm-9">
									<input class="form-control" name="updateLoginPwd" type="text"/>
								</div>
							</div>
							<div class="form-group col-md-12 col-sm-12">
								<label class="col-md-3 col-sm-3 control-label">重复密码：</label>
								<div class="col-md-9 col-sm-9">
									<input class="form-control" name="updateReloginPwd" type="text"/>
								</div>
							</div>
    				</div>
    				<div class="formBar">
						<div class="ibox-content">
    						<button class="btn btn-primary" option="ajaxForm" >保存</button>
						</div>
					</div>
    			</form>
    		</div>
    	</div>
    </div>
</div>
<!-- 引入事件绑定 -->
<script src="${basePath }/public/js/viewBind.js"></script>
</@layout>
