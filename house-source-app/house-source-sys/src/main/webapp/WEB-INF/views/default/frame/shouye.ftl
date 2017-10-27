<#include "/frame/_layout.ftl"/>
<@layout page_tab="shouye">
<div class="ibox">
    <div class="ibox-title"></div>
    	<div class="ibox-content">
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="pageFormContent">
							<p class="pull-right">
								<a href="http://www.innjia.com" target="_blank">上海研耀信息科技有限公司网站</a>
							</p>
							<div class="unit"><h3><strong>盈家租金分期管理系统统计:</strong></h3></div>
							<div class="row">
        						<div class="col-md-3 col-xs-3 text-center" style="padding:15px 3%;">
        							<a href="">
        								<div style="background:#EAEAAE ;padding:30px 1px;">
        									<h3><small>系统菜单记录数</small></h3>
        									<span style="font-size:30px">${menuCount!0}</span>
        								</div>
        							</a>
        						</div>
        						<div class="col-md-3 col-xs-3 text-center" style="padding:15px 3%;">
        							<a href="">
        								<div style="background:#FFCCCC;padding:30px 1px;">
        									<h3><small>系统管理员人数</small></h3>
        									<span style="font-size:30px">${userCount!0}</span>
        								</div>
        							</a>
        						</div>
        						<div class=" col-md-3 col-xs-3 text-center" style="padding:15px 3%;">
        							<a href="">
        								<div style="background:#CC99CC;padding:30px 1px;">
        									<h3><small>系统资源文件数</small></h3>
        									<span style="font-size:30px">${fileInfoCount!0}</span>
        								</div>
        							</a>
        						</div>
        						<div class=" col-md-3 col-xs-3 text-center" style="padding:15px 3%;">
        							<a href="">
        								<div style="background:#19b076;padding:30px 1px;">
        									<h3><small>系统合作站点数</small></h3>
        									<span style="font-size:30px">${friendLinkCount!0}</span>
        								</div>
        							</a>
        						</div>
        						
        					</div>
        					<div class="row">
        						<div class="col-md-3 col-xs-3  text-center" style="padding:15px 3%;">
        							<a href="">
        								<div style="background:	#FFFFAA ;padding:30px 1px;">
        									<h3><small>系统品牌公司数</small></h3>
        									<span style="font-size:30px">${companyCount!0}</span>
        								</div>
        							</a>
        						</div>
        						<div class="col-md-3 col-xs-3  text-center" style="padding:15px 3%;">
        							<a href="">
        								<div style="background:	#BBFFFF;padding:30px 1px;">
        									<h3><small>系统品牌信息数</small></h3>
        									<span style="font-size:30px">${companyBrandCount!0}</span>
        								</div>
        							</a>
        						</div>
        						<div class=" col-md-3 col-xs-3 text-center" style="padding:15px 3%;">
        							<a href="">
        								<div style="background:	#DCB5FF;padding:30px 1px;">
        									<h3><small>系统代理公司数</small></h3>
        									<span style="font-size:30px">${customerCount!0}</span>
        								</div>
        							</a>
        						</div>
        						<div class=" col-md-3 col-xs-3 text-center" style="padding:15px 3%;">
        							<a href="">
        								<div style="background:#FFC1E0;padding:30px 1px;">
        									<h3><small>系统业务信息数</small></h3>
        									<span style="font-size:30px">${businessCount!0}</span>
        								</div>
        							</a>
        						</div>
        					</div>
							<hr style='height:1px;border:none;border-top:1px dotted #185598;'/>
							<div class="panel panel-danger">
								<div class="panel-heading with-border">
    								常见问题及解决
    								<div class="pull-right">
										<button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
    								</div>
    							</div>
    							<div class="panel-body">
									<div class="text-muted"><h5><strong>&nbsp;&nbsp;&nbsp;&nbsp;记录无法删除的问题：</strong>为了数据的完整性，本系统中所有数据不支持真实删除操作，需要对记录进行删除操作的话可以通过修改记录的状态，将记录禁止或虚拟删除就可以了。</h5></div>
									<div class="text-muted"><h5><strong>&nbsp;&nbsp;&nbsp;&nbsp;数据无法保存的问题：</strong>请先确认具体是那个入口进入后添加数据无法保存，并将相应的操作提交给程序员，由程序员进行调试并修正相应的错误。</h5></div>
									<div class="text-muted"><h5><strong>&nbsp;&nbsp;&nbsp;&nbsp;数据前台不显示问题：</strong>请先确认数据的状态，一般数据分为可用、禁止、删除状态，只有在可用的状态下前台才可以显示。如果设置了禁止或删除状态前台任然显示则需要由程序员修正错误。</h5></div>
									<div class="text-muted"><h5><strong>&nbsp;&nbsp;&nbsp;&nbsp;数据录入不成功问题：</strong>有的数据表做过唯一的验证，操作时请注意相应的提示信息，如果已有相关字段的数据存在是不允许再次添加到数据库中的。</h5></div>
									<div class="text-muted"><h5><strong>&nbsp;&nbsp;&nbsp;&nbsp;出现500错误的问题：</strong>当出现500错误的时候表示业务程序出现的异常，请记录相关异常的信息并提交给产品部进行调试修正。</h5></div>
									<div class="text-muted"><h5><strong>&nbsp;&nbsp;&nbsp;&nbsp;出现404错误的问题：</strong>当出现404错误的时候表示没有找到相关的页面，请记录相关异常的信息并提交给产品部进行调试修正。</h5></div>
  								</div>
							</div>
							<hr style='height:1px;border:none;border-top:1px dotted #185598;'/>
							<div class="doc">
								<div class="unit"><h3><strong>盈家租金分期管理系统文档:</strong></h3></div>
								<a href="/innjia-sys/doc/index.html" target="_blank"><h3><small><span class="label label-info">盈家租金分期管理系统系统业务层接口API文档</span></small><h3></a>
								<a href="/innjia-service/doc/index.html" target="_blank"><h3><small><span class="label label-info">盈家租金分期管理系统客户端接口API文档</span></small></h3></a>
							</div>
							<hr style='height:1px;border:none;border-top:1px dotted #185598;'/>
							<h3><strong>技术支持联系:</strong></h3>
							<p style="color:green;width:99%">研耀技术部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-Mail:tech@innjia.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话:6000000</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</div>
</@layout>

