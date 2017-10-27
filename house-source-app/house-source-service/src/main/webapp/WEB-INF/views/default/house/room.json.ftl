<#escape x as x?html>
{  
		"code":"${result.code}",
  	"res":{  
  		"msg":"${result.message}",
      "data":{
              "houseId":"${result.data.house.houseId}",
              "provinceName" : "${result.data.house.unit.building.village.street.cityArea.city.province.provinceName}",
              "provinceId" : "${result.data.house.unit.building.village.street.cityArea.city.province.provinceId}",
					    "cityName" : "${result.data.house.unit.building.village.street.cityArea.city.cityName}",
					    "cityId" : "${result.data.house.unit.building.village.street.cityArea.city.cityId}",
					    "cityAreaName" : "${result.data.house.unit.building.village.street.cityArea.cityAreaName}",
					    "cityAreaId" : "${result.data.house.unit.building.village.street.cityArea.cityAreaId}",
					    "buildingNumber": "${result.data.house.unit.building.buildingNumber}",
					    "buildingId": "${result.data.house.unit.building.id}",
					    "houseNumber": "${result.data.house.houseNumber}",
					    "houseSource": "${result.data.house.houseSource}",
					    "streetAddress": "${result.data.house.unit.building.village.street.streetAddress}",
					    "streetName": "${result.data.house.unit.building.village.street.streetName}",
					    "streetId": "${result.data.house.unit.building.village.street.id}",
					    "unitNumber": "${result.data.house.unit.unitNumber}",
					    "unitId": "${result.data.house.unit.id}",
					    "villageName": "${result.data.house.unit.building.village.villageName}",
					    "villageId": "${result.data.house.unit.building.village.id}",
					    "houseRooms": [
									 <#list result.data as room>
									 	{
				              "houseId":"${result.data.house.houseId!""}",
				              "roomId":"${room.roomId!""}",
				              "roomName":"${room.roomName!""}"
				            }
									 <#if row_has_next>,</#if>
          				 </#list>
					    ]
            }
    }
}
</#escape>