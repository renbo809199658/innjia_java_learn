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
				"sendTime":"${row.sendTime!""}",
				"status":"${row.status!""}",
				"smsSendsubject":"${row.smsSendsubject!""}",
				"smsAccountNo":"${row.smsAccountNo!""}",
				"smsSendTo":"${row.smsSendTo!""}",
				"smsSendMsg":"${row.smsSendMsg!""}",
				"sendType":"${row.sendType!""}",
				"sendResult":"${row.sendResult!""}",
				"resultCode":"${row.resultCode!""}",
				"failureReason":"${row.failureReason!""}",
				"isReSend":"${row.isReSend!""}",
				"projectNo":"${row.projectNo!""}"
			}
			<#if row_has_next>,</#if>
		</#list>
	]
}
</#escape>