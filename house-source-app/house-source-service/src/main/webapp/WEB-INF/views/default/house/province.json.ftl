<#escape x as x?html>
{  
		"code":"${result.code}",
  	"res":{  
  		"msg":"${result.message}",
      "data":[
									 <#list result.data as p>
									 	{
				              "provinceId":"${p.provinceId}",
				              "provinceName":"${p.provinceName!""}",
				              "provinceShort":"${p.provinceShort!""}"
				            }
									 <#if p_has_next>,</#if>
          				 </#list>
					    ]
    }
}
</#escape>