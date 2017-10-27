<#escape x as x?html>
{  
		"code":"${result.code}",
  	"res":{  
  		"msg":"${result.message}",
      "data":[
									 <#list result.data as p>
									 	{
				              "cityShort":"${p.cityShort}",
				              "cityName":"${p.cityName!""}",
				              "cityId":"${p.cityId!""}",
				              "provinceName": "${p.province.provinceName}", 
      								"provinceId": "${p.province.provinceId}"
				            }
									 <#if p_has_next>,</#if>
          				 </#list>
					    ]
    }
}
</#escape>