
<div class="ibox">
    <div class="ibox-title">
    	<h2 class="pull-left"><small>后台用户新建</small></h2>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    	<div class="ibox-content">
    		<div class="pageContent">
    			<form class="form-horizontal m-t" id="ajaxForm" action="${basePath }/admin/user/save.do" method="post" >
    				<div class="pageFormContent">
    					<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">账号：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="loginName" type="text" required/>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">姓名：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="userName" type="text" required/>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">密码：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="loginPwd" type="text" required/>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">重复密码：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="reloginPwd" type="text" required/>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">手机：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="mobile" type="text" required/>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">邮箱：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="email" type="text" required/>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">工号：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="jobNumber" type="text"/>
							</div>
						</div>
    				</div>
    				<div class="formBar">
						<div class="ibox-content">
    						<button class="btn btn-primary" option="ajaxForm" >保存</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
					</div>
    			</form>
    		</div>
    	</div>
    </div>
</div>
<!-- 引入事件绑定 -->
<script src="${basePath }/public/js/viewBind.js"></script>
