<link href="${basePath}/public/plugins/bootstrap-icon-picker/css/icon-picker.css" rel="stylesheet"/>
<script src="${basePath}/public/plugins/bootstrap-icon-picker/js/iconPicker.js"></script>
<script type="text/javascript">
	$(function () {
		$(".icon-picker").iconPicker();
    });
</script>
<div class="ibox">
	<div class="ibox-title">
    	<h4 class="pull-left"><label>菜单新建</label></h4>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="ibox-content">
	<div class="pageContent">
		<form class="form-horizontal m-t" id="ajaxForm" method="post" action="${basePath }/admin/menu/save.do" >
		<div class="pageFormContent">
			<div class="row">
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">菜单名称：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input class="form-control" name="menuName" type="text" required/>
							<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">关键字：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input class="form-control" name="tagName" type="text" required />
							<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">菜单图标：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input type="text" name="menuIconCss" class="form-control icon-picker" required/>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">排序字符：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input class="form-control" name="sort" type="text" required/>
							<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">所属菜单：</label>
						<div class="col-md-9 col-sm-9 input-group">
							${common.getSelectByMenu("menuLookup.id","")}
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">请求路径：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input class="form-control" name="menuPath" type="text" />
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">菜单类型：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<select name="menuType" class="form-control">
								<option value="INTERNAL">内部</option>
								<option value="EXTERNAL">外部</option>
							</select>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">备注：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input class="form-control" name="remark" type="text" />
						</div>
					</div>
			</div>
			
		</div>
		<div class="formBar">
			<div class="ibox-content ">
				<button class="btn btn-primary" option="ajaxForm" >保存</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
		</form>
	</div>
	</div>
</div>
<!-- 引入事件绑定 -->
<script src="${basePath }/public/js/viewBind.js"></script>
