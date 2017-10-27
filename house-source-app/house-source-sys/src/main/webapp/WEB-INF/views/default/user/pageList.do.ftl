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
				"createTime":"${row.createTime}",
				"status":"${row.status}",
				"loginName":"${row.loginName!""}",
				"mobile":"${row.mobile!""}",
				"email":"${row.email!""}",
				"jobNumber":"${row.jobNumber!""}",
				"userName":"${row.userName!""}"
				
			}
			<#if row_has_next>,</#if>
		</#list>
	]
}
</#escape>