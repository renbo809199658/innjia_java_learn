<!-- bootstrap-fileinput -->
<link href="${basePath }/public/plugins/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet">
<script src="${basePath }/public/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>


<script>
	$(function() {
		//默认选择不编辑密码
		$("select[name='passwordUpdatable']").find("option[value='0']").attr("selected",true);
		var selectedValue = $("select[name='passwordUpdatable']").find("option:selected").val();
		passwordUpdatableChange(selectedValue);
	});
	
	function passwordUpdatableChange(value) {
		if (value == "0") {
			$(".updatePasswordField").addClass("hidden");
		} else if (value == "1") {
			$(".updatePasswordField").removeClass("hidden");
		}
	}
	
	$("#avatar_file").fileinput({
                language: 'zh', //设置语言
                uploadUrl: "", //上传的地址
                allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
                //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
                uploadAsync: true, //默认异步上传
                showUpload: false, //是否显示上传按钮
                showRemove : false, //显示移除按钮
                showPreview : true, //是否显示预览
                showCaption: false,//是否显示标题
                browseLabel: "选择图像",
                browseClass: "btn btn-primary", //按钮样式
                dropZoneEnabled: false,//是否显示拖拽区域
                //minImageWidth: 50, //图片的最小宽度
                //minImageHeight: 50,//图片的最小高度
                //maxImageWidth: 1000,//图片的最大宽度
                //maxImageHeight: 1000,//图片的最大高度
                //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
                //minFileCount: 0,
                maxFileCount: 2, //表示允许同时上传的最大文件个数
                enctype: 'multipart/form-data',
                validateInitialCount:true,
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            });
    //文件选择
    $('#avatar_file').on("filebatchselected", function(event, files) {
        $(this).fileinput("upload");
    })
	//异步上传返回结果处理
	$('#avatar_file').on('fileerror', function(event, data, msg) {
        var result = data.response;
        console.log(result.success);
        console.log(result.msg);
	});
	//异步上传返回结果处理
	$("#avatar_file").on("fileuploaded", function (event, data, previewId, index) {
        var result = data.response;
        console.log(result.success);
        console.log(result.msg);
        $("#avatarUrl").val(result.file);
    });

	//同步上传错误处理
    $('#avatar_file').on('filebatchuploaderror', function(event, data, msg) {
        var result = data.response;
        console.log(result.success);
        console.log(result.msg);
   });
   //同步上传返回结果处理
   $("#avatar_file").on("filebatchuploadsuccess", function (event, data, previewId, index) {
        var result = data.response;
        console.log(result.success);
        console.log(result.msg);
    });

	//上传前
	$('#avatar_file').on('filepreupload', function(event, data, previewId, index) {
        var form = data.form, files = data.files, extra = data.extra,
            response = data.response, reader = data.reader;
        console.log('File pre upload triggered');
    });
	
</script>

<div class="ibox">
    <div class="ibox-title">
    	<h2 class="pull-left"><small>后台用户编辑</small></h2>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    	<div class="ibox-content">
    		<div class="pageContent">
    			<form class="form-horizontal m-t" id="ajaxForm" action="${basePath }/admin/user/update.do" method="post" >
    				<input type="hidden" name="id" value="${model.id}"/>
    				<div class="pageFormContent">
    					<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">账号：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="loginName" value="${model.loginName}" type="text" required aria-required="true" aria-invalid="false"/>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">姓名：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="userName" value="${model.userName}" type="text" required aria-required="true" aria-invalid="false" />
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">手机：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="mobile" value="${model.mobile}" type="text" required aria-required="true" aria-invalid="false" />
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">邮箱：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="email" value="${model.email}" type="text" required aria-required="true" aria-invalid="false" />
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">工号：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="jobNumber" value="${model.jobNumber}" type="text"/>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12 hidden">
							<label class="col-md-2 col-sm-2 control-label"> 文件：</label>
							<div class="col-md-10 col-sm-10">
								<input class="form-control" id="avatarUrl" name="avatarUrl" type="text"/>
							</div>
						</div>
						
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label"> 头像：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" id="avatar_file" name="file" multiple type="file" />
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-3 col-sm-3 control-label">密码修改：</label>
							<div class="col-md-9 col-sm-9">
								<select name="passwordUpdatable" class="form-control required" onchange="passwordUpdatableChange(this.value)">
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
                            </div>
						</div>
						<div class="updatePasswordField hidden">
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

