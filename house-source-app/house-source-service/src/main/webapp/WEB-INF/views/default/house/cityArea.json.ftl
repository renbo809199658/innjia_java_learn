<#escape x as x?html>
{  
		"code":"${result.code}",
  	"res":{  
  		"msg":"${result.message}",
      "data":{
					    "houseRooms": [
									 <#list result.data as p>
									 	{
				              "cityAreaId":"${p.cityAreaId}",
				              "cityAreaShort":"${p.cityAreaShort!""}",
				              "cityName":"${p.city.cityName!""}",
				              "cityAreaDescription": "${p.cityAreaDescription}", 
      								"cityAreaName": "${p.cityAreaName}"
      								"cityId": "${p.city.cityId}"
				            }
									 <#if p_has_next>,</#if>
          				 </#list>
					    ]
            }
    }
}
</#escape>