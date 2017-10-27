<script>
$(function(){
	$('#statu').change(function e(){
		var str = $(this).val();
		if(str=="FORBID"){			
			parent.layer.msg('选择禁止之后,此用户将被冻结 不可在使用');
		}
		if(str=="DELETE"){
			parent.layer.msg('选择删除之后,此用户将被删除 不可在使用');	
		}
	});
});
</script>
<div class="ibox">
    <div class="ibox-title">
    	<h4 class="pull-left"><label>会员编辑</label></h4>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    	<div class="ibox-content">
    		<div class="pageContent">
    			<form class="form-horizontal m-t" id="ajaxForm" method="post" action="${basePath}/admin/innjiaAccount/update.do" >
    				<input type="hidden" name="id" value="${model.id}"/>
    				<div class="pageFormContent">    					
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">会员昵称：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="nickName" value="${model.nickName}" type="text" />
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">性别：</label>
							<div class="col-md-9 col-sm-9">
								<label class="radioButton"><input name="sex" type="radio" value="男"  <#if model.sex=="男" || model.sex!="女">checked</#if> />男</label>
								&nbsp;&nbsp;
								<label class="radioButton"><input name="sex" type="radio" value="女" <#if model.sex=="女">checked</#if> />女</label>
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">证件号：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="idCard" value="${model.idCard}" type="text" />
							</div>
						</div>						
						<#list model.innJiaAccountMobileRelationList as m>
							<#if model.innJiaAccountMobileRelationList?size==1 || model.innJiaAccountMobileRelationList?size-1 == m_index>
								<input class="form-control" name="size" value="${model.innJiaAccountMobileRelationList?size}" type="hidden" />							
								<div class="form-group col-md-12 col-sm-12">
									<label class="col-md-2 col-sm-2 control-label">手机号<#if model.innJiaAccountMobileRelationList?size gt 1>${_index+1}</#if>：</label>
									<div class="col-md-9 col-sm-9">								
										<input class="form-control" name="mobileid<#if model.innJiaAccountMobileRelationList?size gt 1>${_index+1}</#if>" value="${m.mobile.id}" type="hidden" />								
										<input class="form-control" name="number<#if model.innJiaAccountMobileRelationList?size gt 1>${_index+1}</#if>" value="${m.mobile.number}" type="text" />																		
									</div>
								</div>
								<#break>							
							</#if>
							<#if model.innJiaAccountMobileRelationList?size-1 != m_index>
								<div class="form-group col-md-12 col-sm-12">
									<label class="col-md-2 col-sm-2 control-label">手机号${_index+1}：</label>
									<div class="col-md-9 col-sm-9">	
										<input class="form-control" name="size" value="${model.innJiaAccountMobileRelationList?size}" type="hidden" />							
										<input class="form-control" name="mobileid${_index}" value="${m.mobile.id}" type="hidden" />								
										<input class="form-control" name="number${_index}" value="${m.mobile.number}" type="text" />									
									</div>
								</div>
								<#break>							
							</#if>
						</#list>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">用户状态：</label>
							<div class="col-md-9 col-sm-9">
								<select name="statu" id="statu" class="form-control">
									<option value="AVAILABLE" <#if model.status=='AVAILABLE'> selected="selected"</#if>>可用</option>
									<option value="FORBID" <#if model.status=='FORBID'> selected="selected"</#if>>禁止</option>
									<option value="DELETE" <#if model.status=='DELETE'> selected="selected"</#if>>删除</option>
								</select>								
							</div>
						</div>		
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">住址：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="address" value="${model.address}" type="text" />
							</div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">电子邮箱：</label>
							<div class="col-md-9 col-sm-9">
								<input class="form-control" name="email" value="${model.email}" type="text" />
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