
<div class="ibox">
    <div class="ibox-title">
    	<h2 class="pull-left"><small>会员详情</small></h2>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    	<div class="ibox-content">
    		<div class="row pageContent">
    					<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 会员昵称：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.nickName!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">性别：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.innJiaAccount.sex}</span>
							</div>							
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 证件号：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.idCard!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<#list model.innJiaAccountMobileRelationList as m>																						
								<div class="form-group col-md-12 col-sm-12">
									<label class="col-md-2 col-sm-2 control-label">手机号</label>
									<div class="col-md-9 col-sm-9">								
										<span>${m.mobile.number!""} <span/>
									</div>
									<div class="hr-line-dashed"></div>
								</div>				
						</#list>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 用户状态：</label>
							<div class="col-md-10 col-sm-10">
								<#if model.status=='AVAILABLE'> 可用 </#if>
								<#if model.status=='FORBID'> 禁止 </#if>
								<#if model.status=='DELETE'> 删除 </#if>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 住址：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.address!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">电子邮箱：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.email!""}<span/>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">会员权限：</label>
							<div class="col-md-10 col-sm-10">
								<#list model.innJiaAccountRoleRelationList as r>
									${r.innJiaAccountRole.title}
									<#if model.innJiaAccountRoleRelationList?size-1!=r_index>
										<#if r_has_next>,</#if>
									</#if>
								</#list>
							</div>
							<div class="hr-line-dashed"></div>
						</div>						
    		</div>
    	</div>
    </div>
</div>

