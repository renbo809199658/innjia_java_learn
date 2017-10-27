<#escape x as x?html>
{  
		"code":"${result.code}",
  	"res":{  
  		"msg":"${result.message}",
      "data":[
									 <#list result.data as p>
									 	{
				              "cityAreaId":"${p.cityArea.cityAreaId}",
				              "streetName":"${p.streetName!""}",
				              "cityAreaDescription": "${p.cityArea.cityAreaDescription}", 
      								"cityAreaName": "${p.cityArea.cityAreaName}"
				            }
									 <#if p_has_next>,</#if>
          				 </#list>
					    ]
    }
}
</#escape>