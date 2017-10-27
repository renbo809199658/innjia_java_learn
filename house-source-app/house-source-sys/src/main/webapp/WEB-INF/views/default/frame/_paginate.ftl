<#macro paginate currentPage totalPage actionUrl urlParas="">
	<#if (totalPage <= 0) || (currentPage > totalPage)><#return></#if>
	<#local startPage = currentPage - 2>
	<#if (startPage < 1)><#local startPage = 1></#if>
	
	<#local endPage = currentPage + 2>
	<#if (endPage > totalPage)><#local endPage = totalPage></#if>
	
	<div class="form-inline pull-left" style="margin-top:5px">
		<span>显示</span>
		<select class="form-control input-sm" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
			<option value="20" <#if page.pageSize == 20>selected="selected"</#if>>
				20
			</option>
			<option value="50" <#if page.pageSize == 50>selected="selected"</#if>>
				50
			</option>
			<option value="100" <#if page.pageSize == 100>selected="selected"</#if>>
				100
			</option>
			<option value="200" <#if page.pageSize == 200>selected="selected"</#if>>
				200
			</option>
			<option value="500" <#if page.pageSize == 500>selected="selected"</#if>>
				500
			</option>
		</select>
		<span>条,有${page.recordCount?c}条/共${page.pageCount?c}页/当前第${page.page?c}页</span>
	</div>
	
	<ul class="pagination pull-right">
		<#if (currentPage <= 3)>
			<#local startPage = 1>
		</#if>
		<#if ((totalPage - currentPage) < 2)>
			<#local endPage = totalPage>
		</#if>

		<#if (currentPage == 1)>
			<!--<li>上页</li>-->
		<#else>
			<li><a href="javascript:void(0);" onclick="doPage('1')">&lt;&lt;</a></li>
			<li><a href="javascript:void(0);" onclick="doPage('#{currentPage - 1}')">&lt;</a></li>
		</#if>

		<#list startPage..endPage as i>
			<#if currentPage == i>
				<li class="active"><a class="disabled">#{i}</a></li>
			<#else>
				<li><a href="javascript:void(0);" onclick="doPage('#{i}')">#{i}</a></li>
			</#if>
		</#list>

		<#if (currentPage == totalPage)>
			<!--<li>下页</li>-->
		<#else>
			<li><a href="javascript:void(0);" onclick="doPage('#{currentPage + 1}')">&gt;</a></li>
			<li><a href="javascript:void(0);" onclick="doPage('#{totalPage}')">&gt;&gt;</a></li>
		</#if>
	</ul>
</#macro>