<#escape x as x?html>
{  
		"code":"${result.code}",
  	"res":{  
  		"msg":"${result.message}",
      "data":{
              "houseId":"${result.data.houseId}",
              "provinceName" : "${result.data.provinceName}",
					    "cityName" : "${result.data.cityName}",
					    "cityAreaName" : "${result.data.cityAreaName}",
					    "buildingNum": "${result.data.buildingNum}",
					    "houseNumber": "${result.data.houseNumber}",
					    "houseSource": "${result.data.houseSource}",
					    "streetAddress": "${result.data.streetAddress}",
					    "streetName": "${result.data.streetName}",
					    "unitNum": "${result.data.unitNum}",
					    "villageName": "${result.data.villageName}",
					    "houseRooms": [
									 <#list result.data.houseRooms as room>
									 	{
				              "houseId":"${result.data.houseId}",
				              "roomId":"${room.roomId}",
				              "roomName":"${room.roomName!""}"
				            }
									 <#if room_has_next>,</#if>
          				 </#list>
					    ]
            }
    }
}
</#escape>