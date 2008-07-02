<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>
<html>
<head>
<title>添加考试</title>
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
		dojo.require("dijit.form.FilteringSelect");
	</script>
<script type="text/javascript">
			
			function addStudent(tagname){
				console.log("add student.");
				dojo.xhrGet({
	           	url: 'addStudent.do',
	           	load: function (data,ioArgs){
					console.log(data);
				},
	           	error: helloError,
	           		content: {name: "test" }
	        	});
			}
			
			function query(tagname){
				console.log("query student.");
				dojo.xhrGet({
	           	url: 'queryExam.do',
	           	load: function (data,ioArgs){
					console.log(data);
					data = eval(examData);
					var store = new dojox.grid.data.Objects(null, data);
		            studentGrid.setModel(store);
		            studentGrid.refresh();
				},
	           	error: callError,
	           		content: {name: "test" }
	        	});
			}
			
			function callError(data,ioArgs){
				console.log(data);
			}
			
			function typeChanged(type){
				if(type!=4){
					dojo.byId("coursetr").style.display="none";
				}else{
					dojo.byId("coursetr").style.display="";
				}
			}
		
		var examData = [{acdemicYear:'2007~2008',name:'第二学期期中考试',dateFrom:'2008年4月20日',dateTo:'2008年4月23日',type:'期中考试',creator:'管飞'},
						{acdemicYear:'2008~2009',name:'十月份月考',dateFrom:'2008年10月8日',dateTo:'2008年10月10日',type:'月考',creator:'李正'}];
			
		var structure = [{"cells": [[
             {"field": "acdemicYear", "name": "学年度"},
             {"field": "name", "name": "考试名称", "width": "120px"},            
             {"field": "dateFrom", "name": "开始时间", "width": "100px"},
             {"field": "dateTo", "name": "结束时间", "width": "100px"},
             {"field": "type", "name": "考试类型"},
             {"field": "creator", "name": "添加人"}
             ]]
			}];
		
		dojo.addOnLoad(function(){
             grid.setStructure(structure);
             data = eval(examData);
			 var store = new dojox.grid.data.Objects(null, data);
             grid.setModel(store);
             grid.refresh();
             //query();
          }
        );
	</script>
</head>
<body class="tundra">
<div id="mainTabContainer" dojoType="dijit.layout.TabContainer"
	style="width: 100%; height: 100%">
<div dojoType="dijit.layout.ContentPane" title="查看考试"
	style="width: 100%; height: 70%">&ensp; 学年度: <select
	dojoType="dijit.form.FilteringSelect" id="queryAcdemicYear"
	name="queryAcdemicYear" autoComplete="false"
	onChange="console.log(arguments[0])">
	<option value="2005~2006">2005~2006</option>
	<option value="2006~2007">2006~2007</option>
	<option value="2007~2008">2007~2008</option>
	<option value="2008~2009">2008~2009</option>
</select> 考试类型: <select dojoType="dijit.form.FilteringSelect" id="queryType"
	name="queryType" autoComplete="false"
	invalidMessage="Invalid state name"
	onChange="console.log(arguments[0])">
	<option value=""></option>
	<option value="1">期中考试</option>
	<option value="2">月考</option>
	<option value="3">期末考试</option>
	<option value="4">班级测验</option>
</select>
<button dojoType="dijit.form.Button" onClick=selectStudent>查询</button>

<div dojoType="dojox.Grid" id="grid" jsId="grid"></div>
</div>
<div dojoType="dijit.layout.ContentPane" title="添加考试"><br />
<table cellspacing="10px">
	<tr>
		<td colspan="2" align="center" class="title" style="height: 50px;">
		请填写考试信息</td>
	</tr>
	<tr>
		<td align="right" width="40%">考试名称:</td>
		<td align="left"><input dojoType=dijit.form.TextBox type="text"
			id="name" name="name" maxlength="16" style="width: 182px;"></td>
	</tr>
	<tr>
		<td align="right">开始时间:</td>
		<td align="left"><input id="dateFrom" name="dateFrom" type="text"
			dojoType="dijit.form.DateTextBox"
			constraints="{datePattern:'yyyy-MM-dd', strict:true}"></td>
	</tr>
	<tr>
		<td align="right">结束时间:</td>
		<td align="left"><input id="dateTo" name="dateTo" type="text"
			dojoType="dijit.form.DateTextBox"
			constraints="{datePattern:'yyyy-MM-dd', strict:true}"></td>
	</tr>
	<tr>
		<td align="right">考试类型:</td>
		<td align="left"><select dojoType="dijit.form.FilteringSelect"
			id="type" name="type" autoComplete="false"
			invalidMessage="Invalid state name"
			onChange="typeChanged(arguments[0])">
			<option value="1">期中考试</option>
			<option value="2">月考</option>
			<option value="3">期末考试</option>
			<option value="4">班级测验</option>
		</select></td>
	</tr>
	<tr id="coursetr" style="display: none">
		<td align="right">考试学科:</td>
		<td align="left"><select dojoType="dijit.form.FilteringSelect"
			id="course" name="course" autoComplete="false" style="width: 80px"
			invalidMessage="Invalid state name">
			<option value="1">语文</option>
			<option value="2">数学</option>
			<option value="3">英语</option>
			<option value="4">政治</option>
			<option value="5">物理</option>
			<option value="6">化学</option>
			<option value="7">地理</option>
			<option value="8">历史</option>
			<option value="9">生物</option>
		</select></td>
	</tr>

	<tr>
		<td align="right">
		<button dojoType="dijit.form.Button" onClick=addStudent>确定</button>
		</td>
		<td align="left">
		<button dojoType="dijit.form.Button" onClick=reset>取消</button>
		</td>
	</tr>
</table>
</div>
</div>
</body>
</html>
