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
				"status":"${row.status.desc!""}",
				"roleName":"${row.roleName!""}",
				"upId":"${row.upId!""}",
				
				<#if row.level==0>
					"level":"一级角色",
				<#elseif row.level==1>
					"level":"二级角色",
				</#if>
				
				"remark":"${row.remark!""}",
				"upRoleName":"${row.upRole.roleName!""}"
				
			}
			<#if row_has_next>,</#if>
		</#list>
	]
}
</#escape>