<#escape x as x?html>
{  
		"code":"${result.code}",
  	"res":{  
  		"msg":"${result.message}",
      "data":{
              "houseId":"${result.data.houseId}",
              "provinceName" : "${result.data.unit.building.village.street.cityArea.city.province.provinceName}",
              "provinceId" : "${result.data.unit.building.village.street.cityArea.city.province.provinceId}",
					    "cityName" : "${result.data.unit.building.village.street.cityArea.city.cityName}",
					    "cityId" : "${result.data.unit.building.village.street.cityArea.city.cityId}",
					    "cityAreaName" : "${result.data.unit.building.village.street.cityArea.cityAreaName}",
					    "cityAreaId" : "${result.data.unit.building.village.street.cityArea.cityAreaId}",
					    "buildingNumber": "${result.data.unit.building.buildingNumber}",
					    "buildingId": "${result.data.unit.building.id}",
					    "houseNumber": "${result.data.houseNumber}",
					    "houseSource": "${result.data.houseSource}",
					    "streetAddress": "${result.data.unit.building.village.street.streetAddress}",
					    "streetName": "${result.data.unit.building.village.street.streetName}",
					    "streetId": "${result.data.unit.building.village.street.id}",
					    "unitNumber": "${result.data.unit.unitNumber}",
					    "unitId": "${result.data.unit.id}",
					    "villageName": "${result.data.unit.building.village.villageName}",
					    "villageId": "${result.data.unit.building.village.id}",
					    "houseRooms": [
									 <#list result.data.rooms as room>
									 	{
				              "houseId":"${result.data.houseId!""}",
				              "roomId":"${room.roomId!""}",
				              "roomName":"${room.roomName!""}"
				            }
									 <#if room_has_next>,</#if>
          				 </#list>
					    ]
            }
    }
}
</#escape>