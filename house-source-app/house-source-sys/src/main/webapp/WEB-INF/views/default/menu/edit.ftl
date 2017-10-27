<link href="${basePath}/public/plugins/bootstrap-icon-picker/css/icon-picker.css" rel="stylesheet"/>
<script src="${basePath}/public/plugins/bootstrap-icon-picker/js/iconPicker.js"></script>
<script type="text/javascript">
	$(function () {
		$(".icon-picker").iconPicker();
    });
</script>
<div class="ibox">
	<div class="ibox-title">
    	<h4 class="pull-left"><label>菜单编辑</label></h4>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="ibox-content">
	<div class="pageContent">
		<form class="form-horizontal m-t" id="ajaxForm" method="post" action="${basePath }/admin/menu/update.do" >
		<input type="hidden" name="id" value="${model.id}"/>
		<div class="pageFormContent">
			<div class="row">
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">菜单名称：</label>
						<div class="col-md-9 col-sm-9">
							<input class="form-control" name="menuName" value="${model.menuName}" type="text" required/>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">关键字：</label>
						<div class="col-md-9 col-sm-9">
							<input class="form-control" name="tagName" value="${model.tagName}" type="text" required/>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">菜单图标：</label>
						<div class="col-md-9 col-sm-9">
							<input class="form-control icon-picker" name="menuIconCss" value="${model.menuIconCss}" type="text" required />
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">排序字符：</label>
						<div class="col-md-9 col-sm-9">
							<input class="form-control" name="sort" value="${model.sort}" type="text" />
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">所属菜单：</label>
						<div class="col-md-9 col-sm-9">
							${common.getSelectByMenu("menuLookup.id","${model.upId}")}
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">请求路径：</label>
						<div class="col-md-9 col-sm-9">
							<input class="form-control" name="menuPath" value="${model.menuPath}" type="text" />
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">菜单类型：</label>
						<div class="col-md-9 col-sm-9">
							<select name="menuType" class="form-control">
								<option value="INTERNAL" <#if model.menuType=='INTERNAL'> selected="selected"</#if>>内部</option>
								<option value="EXTERNAL" <#if model.menuType=='EXTERNAL'> selected="selected"</#if>>外部</option>
							</select>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">备注：</label>
						<div class="col-md-9 col-sm-9">
							<input class="form-control" name="remark" value="${model.remark}" type="text" />
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
