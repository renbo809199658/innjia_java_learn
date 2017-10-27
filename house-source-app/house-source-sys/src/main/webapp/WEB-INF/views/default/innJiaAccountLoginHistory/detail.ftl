
<div class="ibox">
    <div class="ibox-title">
    	<h2 class="pull-left"><small>登录详情</small></h2>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    	<div class="ibox-content">
    		<div class="row pageContent">
    					<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 会员昵称：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.innJiaAccount.nickName!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">性别：</label>
							<div class="col-md-9 col-sm-9">
								<label class="radioButton"><input name="sex" type="radio" value="男"  <#if model.innJiaAccount.sex=="男" || model.innJiaAccount.sex!="女">checked</#if> disabled />男</label>
								&nbsp;&nbsp;
								<label class="radioButton"><input name="sex" type="radio" value="女" <#if model.innJiaAccount.sex=="女">checked</#if> disabled />女</label>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 住址：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.innJiaAccount.address!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 电子邮箱：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.innJiaAccount.email!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						
						
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 项目：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.projectInfo.projectTitle!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>												
    		</div>
    	</div>
    </div>
</div>

