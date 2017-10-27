<link href="${basePath}/public/plugins/bootstrap-icon-picker/css/icon-picker.css" rel="stylesheet"/>
<script src="${basePath}/public/plugins/bootstrap-icon-picker/js/iconPicker.js"></script>
<script type="text/javascript">
	$(function () {
		$(".icon-picker").iconPicker();
    });
    
	function produceKeys(){
		var projectType = $("input[name='projectType']").val();
    	$.ajax({
    		type: "get",
    		url: "${basePath }/admin/projectInfo/getKeys.do?projectType="+projectType,
    		success: function(data, textStatus){
    			if(data.indexOf(",") < 0){
    				alert(data);
    			}else{
	    			var keys = data.split(",");
	    			$("input[name='publicKey']").val(keys[0]);
	    			$("input[name='privateKey']").val(keys[1]);
    			}
    		},
    		error: function(){
    		}
    	});
	};
</script>
<div class="ibox">
	<div class="ibox-title">
    	<h4 class="pull-left"><label>项目新建</label></h4>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="ibox-content">
	<div class="pageContent">
		<form class="form-horizontal m-t" id="ajaxForm" method="post" action="${basePath }/admin/projectInfo/save.do" >
		<div class="pageFormContent">
			<div class="row">
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">项目名称：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="projectName" type="text" required/>
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">项目编码：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="projectNo" type="text" required />
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">项目类型：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="projectType" type="text" required />
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">第三方ID：</label>
					<div class="col-md-9 col-sm-9 input-group">
						${common.getThirdCompanyIds("companyId","")}
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">公钥：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="publicKey" type="text" readonly="true"/>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">私钥：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="privateKey" type="text" readonly="true"/>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">选择状态：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<select name="status" class="form-control" required>
							<option value="AVAILABLE">可用</option>
							<option value="DELETE">删除</option>
							<option value="FORBID">禁止</option>
						</select>
						
					</div>
				</div>
			</div>
			
		</div>
		<div class="formBar">
			<div class="ibox-content ">
				<button type="button" class="btn btn-warning" onclick="produceKeys()">生成公私钥</button>
				<button class="btn btn-primary" option="ajaxForm">保存</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
		</form>
	</div>
	</div>
</div>
<!-- 引入事件绑定 -->
<script src="${basePath }/public/js/viewBind.js"></script>
