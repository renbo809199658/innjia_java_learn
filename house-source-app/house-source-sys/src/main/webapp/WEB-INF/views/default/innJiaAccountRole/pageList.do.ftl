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
				"accountOpenId":"${row.accountOpenId}",				
				"nickName":"${row.nickName!""}",
				"sex":"${row.sex!""}",
				"number":"<#list row.innJiaAccountMobileRelationList as m>${m.mobile.number}<#if row.innJiaAccountMobileRelationList?size-1!=m_index><#if row_has_next>,</#if></#if></#list>",
				"address":"${row.address!""}",
				"email":"${row.email!""}",
				"createTime":"<#list row.innJiaAccountRoleRelationList as r>${r.createTime}<#if row.innJiaAccountRoleRelationList?size-1!=r_index><#if row_has_next>,</#if></#if></#list>",											
				"name":"<#list row.innJiaAccountRoleRelationList as r>${r.innJiaAccountRole.name}<#if row.innJiaAccountRoleRelationList?size-1!=r_index><#if row_has_next>,</#if></#if></#list>",
				"roleTitle":"<#list row.innJiaAccountRoleRelationList as r>${r.innJiaAccountRole.title}<#if row.innJiaAccountRoleRelationList?size-1!=r_index><#if row_has_next>,</#if></#if></#list>"			
			}
			<#if row_has_next>,</#if>
		</#list>
	]
}
</#escape>