<div class="ibox">
    <div class="ibox-title">
    	<h2 class="pull-left" style=""><small><b>邮件信息</b></small></h2>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    	<div class="ibox-content">
    		<div class="row pageContent">
    					<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-1 col-sm-1 control-label"> 主题：</label>
							<div class="col-md-11 col-sm-11">
								<span>${model.sendSubject!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-1 col-sm-1 control-label"> 发送地址：</label>
							<div class="col-md-11 col-sm-11">
								<span>${model.sendFromMail!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-1 col-sm-1 control-label"> 接收地址：</label>
							<div class="col-md-11 col-sm-11">
								<span>${model.sendToMail!""}</span>
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
							<label class="col-md-1 col-sm-1 control-label"> 正文：</label>
							<div class="col-md-11 col-sm-11">
								<span>${model.sendContent!""}</span>
							</div>
						</div>
							<div class="hr-line-dashed"></div>
    		</div>
    	</div>
    </div>
</div>

