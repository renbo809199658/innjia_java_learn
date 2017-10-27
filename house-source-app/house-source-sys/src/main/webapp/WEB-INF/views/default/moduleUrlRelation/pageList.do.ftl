<#escape x as x?html>
{
	"records":"${records!"0"}",
	"page":"${page!"1"}",
	"pageSize":"${pageSize!"0"}",
	"pageCount":"${pageCount!"0"}",
	"rows":[
		<#list rows as row>
			{
				"id":"${row.id}",
				"createTime":"${row.createTime!""}",
				"updateTime":"${row.updateTime!""}",
				"projectId":"${row.projectId!""}",
				"moduleFunctionId":"${row.moduleFunctionId!""}",
				"interfaceName":<#if row.interfaceName?length gt 15>"${row.interfaceName?substring(0,15)!""}",<#else>"${row.interfaceName!""}",</#if>
				"projectName":<#if row.projectName?length gt 15>"${row.projectName?substring(0,15)!""}",<#else>"${row.projectName!""}",</#if>
				"status":"${row.status.desc!""}",
				"gateWayUrl":"api/${row.companyNumber!""}/${row.applicationName!""}/${row.projectNo!""}/${row.controllerName!""}/00/${row.methodName!""}"
			}
			<#if row_has_next>,</#if>
		</#list>
	]
}
</#escape>