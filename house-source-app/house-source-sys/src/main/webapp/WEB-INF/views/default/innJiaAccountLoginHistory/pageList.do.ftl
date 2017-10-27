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
				"accountOpenId":"${row.innJiaAccount.accountOpenId}",
				"nickName":"${row.innJiaAccount.nickName!""}",
				"idCard":"${row.innJiaAccount.idCard}",
				"number":"<#list row.innJiaAccount.innJiaAccountMobileRelationList as m>${m.mobile.number}<#if row.innJiaAccount.innJiaAccountMobileRelationList?size-1!=m_index><#if row_has_next>,</#if></#if></#list>",											
				"loginIp":"${row.loginIp!""}",
				"createTime_history":"${row.createTime!""}",				
				"projectTitle":"${row.projectInfo.projectTitle!""}"				
			}
			<#if row_has_next>,</#if>
		</#list>
	]
}
</#escape>