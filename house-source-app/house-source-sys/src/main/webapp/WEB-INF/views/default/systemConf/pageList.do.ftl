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
				"paramKey":"${row.paramKey}",
				"paramValue":"${row.paramValue}",				
				"remark":"${row.remark!""}"
			}
			<#if row_has_next>,</#if>
		</#list>
	]
}
</#escape>