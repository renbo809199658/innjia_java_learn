<#macro pageLeft page_tab="">
	<!-- Left side column. contains the logo and sidebar -->
  <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="${basePath }/public/hplus-4.1.0/img/a8.jpg" width="40%"/></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               	<span class="block m-t-xs"><strong class="font-bold">${userName}</strong></span>
                                <span class="text-muted text-xs block">
                                <#list roles as rol_vo>
									${(rol_vo.roleName)!"未绑定角色"}
									<#if rol_vo_has_next>,</#if>
								</#list> <b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                             	<li><a class="J_menuItem" href="${basePath }/admin/user/modifyPassword.do">修改密码</a>
                                </li>
                                <li><a class="J_menuItem" href="${basePath }/admin/user/userInfo.do">个人资料</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="${basePath }/admin/index/logout.do">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">R
                        </div>
                    </li>
                    <li>
                    	<a class="J_menuItem" href="${basePath }/admin/index/home.do">
            				<i class="fa fa-home"></i>
            				<span class="nav-label">控制台首页</span>
          				</a>
                    </li>
         <#list menuList as vo>
        	<li class="">
			<#if vo.level??&&(vo.level=0)>
				<a href="#">
            		<i class="${vo.menuIconCss}"></i>
            		<span class="nav-label">${vo.menuName}</span>
                    <span class="fa arrow"></span>
          		</a>
          		
				<ul class="nav nav-second-level">
					<#list menuList as svo>
						<#if svo.upId??&&(vo.id=svo.upId)>
							<li>
								<a class="J_menuItem" href="${common.getResolveNavTabIdUrl(basePath,svo.menuPath,svo.tagName,svo.menuType)}"><i class="${svo.menuIconCss!'fa fa-dashboard'}"></i> ${svo.menuName}</a>
							</li>
						</#if>
					</#list>
				</ul>
			
			</#if>
			</li>
		</#list>
                </ul>
         </div>
   </nav>
</#macro>
