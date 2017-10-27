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
				"bindingMobile":"${row.bindingMobile}",
				"createTime":"${row.createTime}",
				"loginName":"${row.loginName!""}",				
				"nickName":"${row.nickName!""}",
				"sex":"${row.sex!""}",
				"idCard":"${row.idCard!""}",
				"address":"${row.address!""}",
				"bindingMobile":"${row.bindingMobile!""}",
				"email":"${row.email!""}",
				"creditTotalScore":"${row.creditTotalScore!""}",
				"lastLoginIp":"${row.lastLoginIp!""}",
				"lastLoginTime":"${row.lastLoginTime!""}",
				"roleTitle":"<#list row.innJiaAccountRoleRelationList as r>${r.innJiaAccountRole.title}<#if row.innJiaAccountRoleRelationList?size-1!=r_index><#if r_has_next>,</#if></#if></#list>",
				"thirdPartyInnJiaAccountType":"<#list row.innJiaAccountThirdPartyRelationList as t><#if t.status=="AVAILABLE">${t.thirdPartyInnJiaAccountType}<#if row.innJiaAccountThirdPartyRelationList?size-1 != t_index><#if t_has_next>,</#if></#if></#if></#list>"
			}
			<#if row_has_next>,</#if>
		</#list>
	]
}
</#escape>