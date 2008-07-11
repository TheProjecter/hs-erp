<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>
<html>
	<head>
		<title>Dijit Theme Tester</title>
		<script type="text/javascript"> 
		dojo.require("dijit.layout.ContentPane");
		dojo.require("dojo.parser");//解析器必须的	
		dojo.require("dijit.form.Button");
	    dojo.require("dojo.data.ItemFileReadStore");
	    dojo.require("dojox.grid.Grid");
	    dojo.require("dijit.layout.TabContainer");
	    dojo.require("dojox.grid._data.model");
	    dojo.require("dijit.form.DateTextBox");
	    dojo.require("dijit.form.Textarea");
		
	</script>
		<script type="text/javascript">
			var structure = [{"cells": [[
             {"field": "col1", "name": "采购单号"},
             {"field": "col2", "name": "名称"},
             {"field": "col3", "name": "数量"},
             {"field": "col3", "name": "颜色"},
             {"field": "col3", "name": "材质"},
             {"field": "col3", "name": "规格"},
             {"field": "col3", "name": "供应商名称"},
             {"field": "col3", "name": "供应商电话"},
             {"field": "col3", "name": "采购员姓名"},
             {"field": "col3", "name": "采购日期"},
             {"field": "col4", "name": "到货日期"}
             ]]
			}];
			
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
			
			function selectStudent(tagname){
				console.log("select student.");
				dojo.xhrGet({
	           	url: 'selectStudent.do',
	           	load: function (data,ioArgs){
					console.log(data);
				},
	           	error: helloError,
	           		content: {name: "test" }
	        	});
			}
			
			function callError(data,ioArgs){
				console.log(data);
			}
		
		dojo.addOnLoad(function(){
             dijit.byId("grid").setStructure(structure);
             setGridType1();
          }
        );
	</script>
	</head>
	<body class="tundra">
		<div id="mainTabContainer" dojoType="dijit.layout.TabContainer"
			style="width: 100%; height: 100%">
			<div dojoType="dijit.layout.ContentPane" title="查看采购单"
				style="width: 100%; height: 70%">
				&ensp; 采购单号:
				<input dojoType=dijit.form.TextBox type="text" id="no" name="no"
					maxlength="16" style="width: 120px;">
				物料名称:
				<input dojoType=dijit.form.TextBox type="text" id="name" name="name"
					maxlength="16" style="width: 100px;">
				供应商名称：
					<input dojoType=dijit.form.TextBox type="text" id="gysname" name="gysname"
					maxlength="16" style="width: 100px;">
				<button dojoType="dijit.form.Button" onClick=selectStudent>
					查询
				</button>

				<div dojoType="dojox.Grid" id="grid" jsId="grid"></div>
				<script type="text/javascript">
		        function setGridType1(){setGridData('type1');}
		        function setGridData(type) {
		                var grid = dijit.byId("grid");
		                var store = new dojo.data.ItemFileReadStore({url:'data.txt'});               
		                var model = new dojox.grid.data.DojoData(null, store, {query:{date: '*'}, clientSort:true});
		                grid.setModel(model);
		                grid.refresh();
		        }
		</script>
			</div>
			<div dojoType="dijit.layout.ContentPane" title="添加采购单">
				<br />
				<table border="1" align="center">
					<tr>
						<td colspan="2" align="center" class="title" style="height: 50px;">
							请填写采购单信息
						</td>
					</tr>
					<tr>
						<td align="right" width="40%">
							采购单号:
						</td>
						<td align="left">
							<input dojoType=dijit.form.TextBox type="text" id="addName"
								name="addName" maxlength="16" style="width: 120px;">
						</td>
						
					</tr>
					<tr>
						<td align="right">
							学号:
						</td>
						<td align="left">
							<input dojoType=dijit.form.TextBox type="text" id="addNo"
								name="addNo" maxlength="16" style="width: 120px;">
						</td>
					</tr>
					<tr>
						<td align="right">
							性别:
						</td>
						<td align="left">
							<input type="radio" name="addGender" id="g1rb1" value="T"
								dojoType="dijit.form.RadioButton" checked="checked">
							<label for="g1rb1">
								男
							</label>
							<input type="radio" name="addGender" id="g1rb2" value="F"
								dojoType="dijit.form.RadioButton" />
							<label for="g1rb2">
								女
							</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							出生年月:
						</td>
						<td align="left">
							<input id="addBirthday" name="addBirthday" type="text"
								dojoType="dijit.form.DateTextBox" style="width: 120px"
								constraints="{datePattern:'dd-MM-yyyy', strict:true}">
						</td>
					</tr>

					<tr>
						<td align="right">
							电话:
						</td>
						<td align="left">
							<input dojoType=dijit.form.TextBox type="text" id="addPhone"
								name="addAddress" maxlength="20" style="width: 120px;">
						</td>
					</tr>
					<tr>
						<td align="right">
							民族:
						</td>
						<td align="left">
							<input dojoType=dijit.form.TextBox type="text" id="addNation"
								name="addNation" maxlength="20" style="width: 120px;">
						</td>
					</tr>
					<tr>
						<td align="right">
							家庭住址:
						</td>
						<td align="left">
							<input dojoType=dijit.form.TextBox type="text" id="addAddress"
								name="addAddress" maxlength="50" style="width: 120px;">
						</td>
					</tr>
					<tr>
						<td align="right">
							<button dojoType="dijit.form.Button" onClick=addStudent>
								确定
							</button>
						</td>
						<td align="left">
							<button dojoType="dijit.form.Button" onClick=reset>
								取消
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>
