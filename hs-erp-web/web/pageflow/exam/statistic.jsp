<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>
<html>
<head>
<title>Dijit Theme Tester</title>

<script type="text/javascript"> 
		dojo.require("dijit.layout.ContentPane");
		dojo.require("dojo.parser");	
		dojo.require("dijit.form.Button");
	    dojo.require("dojo.data.ItemFileReadStore");
	    dojo.require("dojox.grid.Grid");
	    dojo.require("dijit.layout.TabContainer");
	    dojo.require("dojox.grid._data.model");
	    dojo.require("dijit.form.DateTextBox");
	    dojo.require("dijit.form.Textarea");
	    dojo.require("dijit.TitlePane");
	</script>
<script type="text/javascript"><!--
		var structure = [{"cells": [[
             {"field": "col1", "name": "姓名"},
             {"field": "col2", "name": "学号"},
             {"field": "col3", "name": "语文"},
             {"field": "col3", "name": "数学"},
             {"field": "col3", "name": "英语"},
             {"field": "col3", "name": "物理"},
             {"field": "col3", "name": "化学"},
             {"field": "col3", "name": "政治"},
             {"field": "col3", "name": "历史"},
             {"field": "col3", "name": "地理"},
             {"field": "col4", "name": "生物"}
             ]]
			}];
		dojo.addOnLoad(function(){
			console.log("loading...");
          }
        );
	</script>
<script language="JavaScript" src="../../FusionCharts/FusionCharts.js"></script>
</head>
<body class="tundra">
<div id="mainTabContainer" dojoType="dijit.layout.TabContainer"
	style="width: 100%; height: 100%">
<div dojoType="dijit.layout.ContentPane" title="分数段统计" id="segmentTab">
&ensp; 学号: <input dojoType=dijit.form.TextBox type="text" id="no"
	name="no" maxlength="16" style="width: 120px;"> 姓名: <input
	dojoType=dijit.form.TextBox type="text" id="name" name="name"
	maxlength="16" style="width: 100px;">
<button dojoType="dijit.form.Button" onClick=selectStudent>查询</button>
<div dojoType="dijit.TitlePane" title="语文">
<div id="chartdiv" align="center">FusionCharts.</div>
<script type="text/javascript">
				   var chart = new FusionCharts("../../FusionCharts/ScrollColumn2D.swf", "ChartId", "500", "350", "0", "0");
				   chart.setDataXML("<chart palette='2' caption='语文分数段统计' shownames='1'	showvalues='1' numberSuffix='人' numberPrefix='' useRoundEdges='1' showBorder='0'	borderThickness='0'	legendBorderAlpha='0'>	<categories>		<category label='60分以下' />		<category label='60-79' /> <category label='60-79' /> <category label='80-99' /> <category label='100分以上' />	</categories>	<dataset seriesName='一一班' color='AFD8F8' showValues='0'>		<set value='2' />		<set value='10' />		<set value='8' />		<set value='15' />		<set value='9' />	</dataset>	<dataset seriesName='一二班' color='F6BD0F' showValues='0'>		<set value='2' />		<set value='18' />		<set value='7' />		<set value='9' />		<set value='11' />	</dataset></chart>");		   
				   chart.render("chartdiv");
				</script></div>
</div>

<div dojoType="dijit.layout.ContentPane" title="及格率统计" id="passTab">

</div>
<div dojoType="dijit.layout.ContentPane" title="高分率统计" id="hightTab">

</div>
</div>
</body>
</html>
