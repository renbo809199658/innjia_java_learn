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
				"interfaceName":<#if row.interfaceName?length gt 15>"${row.interfaceName?substring(0,15)!""}",<#else>"${row.interfaceName!""}",</#if>
				"applicationName":"${row.applicationName!""}",
				"controllerName":"${row.controllerName!""}",
				"methodName":"${row.methodName!""}",
				"targetUrl":"${row.targetUrl!""}",
				"requestWay":"${row.requestWay!""}",
				"requestParameterWay":"${row.requestParameterWay!""}",
				"responseParameterWay":"${row.responseParameterWay!""}",
				"status":"${row.status.desc!""}"
			}
			<#if row_has_next>,</#if>
		</#list>
	]
}
</#escape>