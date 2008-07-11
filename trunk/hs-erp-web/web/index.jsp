
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://beehive.apache.org/netui/tags-databinding-1.0"
	prefix="netui-data"%>
<%@ taglib uri="http://beehive.apache.org/netui/tags-html-1.0"
	prefix="netui"%>
<%@ taglib uri="http://beehive.apache.org/netui/tags-template-1.0"
	prefix="netui-template"%>
<netui:html>
<head>
<title>华软企业资源管理系统</title>
<style type="text/css">
@import "js/dojo1.1.1/dojo/resourcesf/dojo.css";

@import "js/dojo1.1.1/dijit/themes/dijit.css";

@import "js/dojo1.1.1/dijit/themes/tundra/tundra.css";

@import "css/sms.css";
 
@import "js/dojo1.1.1/dojox/grid/_grid/tundraGrid.css";

html,body {
	height: 100%;
	width: 100%;
	padding: 0px;
	border: 0;
	font-size: 12px;
}

#main {
	height: 100%;
	width: 100%;
	padding: 0;
	border: 0;
}

</style>
<script type="text/javascript">
		    var djConfig = {
			isDebug:true, parseOnLoad:true
		    };
		</script>
<script type="text/javascript" src="js/dojo1.1.1/dojo/dojo.js"></script>

<script type="text/javascript"> 
		dojo.require("dijit.layout.ContentPane");
		dojo.require("dijit.layout.TabContainer");
		dojo.require("dijit.layout.BorderContainer");
		dojo.require("dijit.TitlePane");
		dojo.require("dojo.parser");	
	</script>
<script type="text/javascript">
		function loadPage(pageName){
			document.getElementById("myifrm").src= pageName;
		}
	</script>
</head>
<netui:body>
	<div id="main" dojoType="dijit.layout.BorderContainer" class="tundra">

	<div id="header" dojoType="dijit.layout.ContentPane" region="top"
		style="height: 60px; background-color: #f2f5f9; border: 0px solid #bfbfbfs; padding-top: 0px;margin:0px 0px 30px 0px">
	<h1 align="center">HS Header</h1>
	</div>
    	<div id="toolsbar" dojoType="dijit.layout.ContentPane"
		style="height: 58px;width: 985px;z-index:100; background-color: #f2f5f9; border: 1px solid #FFCC99; position:absolute ;padding-top: 0px;  margin:60px 0px 0px 0px">
			   	<div id="XG"><a href="javaScript:myifrm.edit();" ></a></div>
			   	<div id="SC"><a href="javaScript:myifrm.cancel();" ></a></div>
			   	<div id="SX"><a href="javaScript:myifrm.refresh();" ></a></div>
			   	<div id="DY"><a href="javaScript:print();" ></a></div>
			   	<div id="DC"><a href="javaScript:AutomateExcel1();" ></a></div>
			   	<div id="TC"><a href="javaScript:myifrm.exit();" ></a></div>
		</div>
	<div dojoType="dijit.layout.ContentPane" duration="200" minSize="20"
		style="width: 145px;margin:30px 0px 0px 0px" id="mainMenu" region="left" splitter="true" >

	<div dojoType="dijit.TitlePane" title="采购管理">
	<a href="javaScript:loadPage('pageflow/exam/score.jsp')"
		class="commandlink">采购信息</a><br />
	<a href="javaScript:loadPage('pageflow/exam/statistic.jsp')"
		class="commandlink">供应商信息</a><br /> 
	<a href="javaScript:loadPage('pageflow/exam/index.jsp')"
		class="commandlink">考试基本信息管理</a></div>
	<div dojoType="dijit.TitlePane" title="仓库管理">
	<a href="javaScript:loadPage('pageflow/student/index.jsp')"
		class="commandlink">原材料入库</a> <br />
	<a href="javaScript:loadPage('pageflow/storehouseManage/goodsOutIndex.jsp')"
		class="commandlink">原材料出库</a><br/>
	<a href="javaScript:loadPage('pageflow/storehouseManage/withdrawGoods.jsp')"
		class="commandlink">入库退货 </a><br/>	
	<a href="javaScript:loadPage('pageflow/teacher/index.html')"
		class="commandlink">成品入库 </a><br/>
	<a href="javaScript:loadPage('pageflow/teacher/index.html')"
		class="commandlink">成品出库 </a><br/>	
	<a href="javaScript:loadPage('pageflow/teacher/index.html')"
		class="commandlink">不良品入库</a><br/>
	<a href="javaScript:loadPage('pageflow/teacher/index.html')"
		class="commandlink">不良品出库</a><br/>
	<a href="javaScript:loadPage('pageflow/teacher/index.html')"
		class="commandlink">转&nbsp;库&nbsp; </a>
		</div>
	<div dojoType="dijit.TitlePane" title="销售管理"><a
		href="javaScript:loadPage('pageflow/clazz/index.html')"
		class="commandlink">客户管理</a><br/>
		<a
		href="javaScript:loadPage('pageflow/clazz/index.html')"
		class="commandlink">订单管理</a>
		</div>
		
	<div dojoType="dijit.TitlePane" title="财务管理">
	<!--<a  href="javaScript:loadPage('pageflow/clazz/index.html')"
		class="commandlink">客户管理</a>
		<a
		href="javaScript:loadPage('pageflow/clazz/index.html')"
		class="commandlink">订单管理</a>-->
		</div>
	<div dojoType="dijit.TitlePane" title="办公管理">
	<a href="javaScript:loadPage('pageflow/clazz/index.html')"
		class="commandlink">部门管理</a><br/>
		<a
		href="javaScript:loadPage('pageflow/clazz/index.html')"
		class="commandlink">员工管理</a><br/>
		<a
		href="javaScript:loadPage('pageflow/clazz/index.html')"
		class="commandlink">考勤管理</a><br/>
		<a
		href="javaScript:loadPage('pageflow/clazz/index.html')"
		class="commandlink">奖惩管理</a>
		</div>
	
	</div>

	<div dojoType="dijit.layout.ContentPane" region="center"
		id="contentContainer" style="margin:30px 0px 0px 0px"><iframe class="mainContent" id="myifrm"
		frameborder="0" width="800px" height="100%" scrolling="no"
		src="pageflow/clazz/index.html" style="border: 0px solid #bfbfbf">
	</iframe></div>
	<div dojoType="dijit.layout.ContentPane" id="footer"
		tabPosition="bottom" align="center" region="bottom" splitter="true"
		style="height: 40px"><br />
	Copyright &copy; 2008 - 2010 Hua Soft ERP Inc. All Rights Reserved <br />
	</div>
	</div>
</netui:body>
</netui:html>
