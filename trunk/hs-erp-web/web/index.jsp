
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
		style="height: 60px; background-color: #f2f5f9; border: 0px solid #bfbfbf; padding-top: 0px">
	<h1 align="center">SMS Header</h1>
	</div>

	<div dojoType="dijit.layout.ContentPane" duration="200" minSize="20"
		style="width: 140px;" id="mainMenu" region="left" splitter="true">

	<div dojoType="dijit.TitlePane" title="考试管理"><a
		href="javaScript:loadPage('pageflow/exam/score.jsp')"
		class="commandlink">考试成绩录入</a> <br />
	<a href="javaScript:loadPage('pageflow/exam/statistic.jsp')"
		class="commandlink">成绩查询统计</a> <br />
	<a href="javaScript:loadPage('pageflow/exam/index.jsp')"
		class="commandlink">考试基本信息管理</a></div>
	<div dojoType="dijit.TitlePane" title="档案管理"><a
		href="javaScript:loadPage('pageflow/student/index.jsp')"
		class="commandlink">学生基本信息管理</a> <br />
	<a href="javaScript:loadPage('pageflow/teacher/index.jsp')"
		class="commandlink">教师基本信息管理</a></div>
	<div dojoType="dijit.TitlePane" title="班级管理"><a
		href="javaScript:loadPage('pageflow/clazz/index.jsp')"
		class="commandlink">基本信息管理</a></div>
	</div>

	<div dojoType="dijit.layout.ContentPane" region="center"
		id="contentContainer"><iframe class="mainContent" id="myifrm"
		frameborder="0" width="800px" height="100%" scrolling="no"
		src="pageflow/clazz/index.jsp" style="border: 0px solid #bfbfbf">
	</iframe></div>
	<div dojoType="dijit.layout.ContentPane" id="footer"
		tabPosition="bottom" align="center" region="bottom" splitter="true"
		style="height: 40px"><br />
	Copyright &copy; 2008 - 2010 Hua Soft ERP Inc. All Rights Reserved <br />
	</div>
	</div>
</netui:body>
</netui:html>
