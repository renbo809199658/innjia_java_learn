<div class="ibox">
    <div class="ibox-title">
    	<h2 class="pull-left" style=""><small><b>短信信息</b></small></h2>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    	<div class="ibox-content">
    		<div class="row pageContent">
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-1 col-sm-1 control-label"> 接收号码：</label>
							<div class="col-md-11 col-sm-11">
								<span>${model.smsSendTo!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-1 col-sm-1 control-label"> 发送时间：</label>
							<div class="col-md-11 col-sm-11">
								<span>${model.createTime!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-1 col-sm-1 control-label"> 内容：</label>
							<div class="col-md-11 col-sm-11">
								<span>${model.smsSendMsg!""}</span>
							</div>
						</div>
							<div class="hr-line-dashed"></div>
    		</div>
    	</div>
    </div>
</div>

