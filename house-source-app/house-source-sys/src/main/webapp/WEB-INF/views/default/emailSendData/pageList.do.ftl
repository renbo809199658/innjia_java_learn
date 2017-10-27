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
				"status":"${row.status!""}",
				"sendSubject":"${row.sendSubject!""}",
				"sendFromMail":"${row.sendFromMail!""}",
				"sendToMail":"${row.sendToMail!""}",
				"sendType":"${row.sendType!""}",
				"sendResult":"${row.sendResult!""}",
				"projectName":"${row.projectName!""}"
			}
			<#if row_has_next>,</#if>
		</#list>
	]
}
</#escape>