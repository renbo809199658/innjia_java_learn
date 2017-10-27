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
				"tagName":"${row.tagName!""}",
				
				"menuType":"${row.menuType.desc!""}",
				"menuIconCss":"${row.menuIconCss!""}",
				"upId":"${row.upId!""}",
				
				<#if row.level==0>
					"level":"父级菜单",
					"menuName":"<i class='${row.menuIconCss!""}' /> ${row.menuName!""}",
				<#elseif row.level==1>
					"level":"子级菜单",
					"menuName":"  <i class='${row.menuIconCss!""}' /> ${row.menuName!""}",
				</#if>
				
				"menuPath":"${row.menuPath!""}",
				"sort":"${row.sort!""}",
				"remark":"${row.remark!""}",
				"upMenuName":"${row.upMenu.menuName!""}",
				"menuMethodSize":"${(row.menuMethods?size)!"0"}"
				
			}
			<#if row_has_next>,</#if>
		</#list>
	]
}
</#escape>