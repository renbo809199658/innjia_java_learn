
<div class="ibox">
    <div class="ibox-title">
    	<h2 class="pull-left"><small>记账信息</small></h2>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    	<div class="ibox-content">
    		<div class="row pageContent">
    					<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 流水号：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.id!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 项目编号：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.projectNo!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 项目订单ID：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.projectOrderId!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 订单ID：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.tallyRequestId!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 订单编号：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.tallyRequestInfo.uniqueId!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label">结算帐户ID：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.tallyAccountId!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 借/贷  J/D：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.debitOrCredit!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 金额：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.amount?string("##0.000")!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 金额绝对值：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.amountABS?string("##0.000")!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 一级科目：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.subject1!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 二级科目：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.subject2!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 三级科目：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.subject3!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 记账状态：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.recordStatus!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						
						<div class="form-group col-md-12 col-sm-12">
							<label class="col-md-2 col-sm-2 control-label"> 核对状态：</label>
							<div class="col-md-10 col-sm-10">
								<span>${model.verifyStatus!""}</span>
							</div>
							<div class="hr-line-dashed"></div>
						</div>
						
    		</div>
    	</div>
    </div>
</div>

