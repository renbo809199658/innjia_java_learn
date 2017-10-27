
<div class="ibox">
    <div class="ibox-title">
    	<h2 class="pull-left"><small>会员详情</small></h2>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    	<div class="ibox-content">
    		<div class="row pageContent">
    					<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 参数名称：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.paramKey!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 参数内容：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.paramValue!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>						
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 参数备注说明：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.remark!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>


					
    		</div>
    	</div>
    </div>
</div>

