
<div class="ibox">
    <div class="ibox-title">
    	<h4 class="pull-left"><label>角色新建</label></h4>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    	<div class="ibox-content">
    		<div class="pageContent">
    			<form class="form-horizontal m-t" id="ajaxForm" method="post" action="${basePath }/admin/role/save.do" >
    				<div class="pageFormContent">
    					<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">角色名称：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="roleName" type="text" required aria-required="true" aria-invalid="false"/>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">备注说明：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="remark" type="text" required aria-required="true" aria-invalid="false" />
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">所属角色：</label>
							<div class="col-md-9 col-sm-9">
								${common.getSelectByRole("roleLookup.id","",0)}
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