<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>
<html>
	<head> 
		<title>入库退货</title>
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
		
	</script>
		<script type="text/javascript"><!--
			function addStudent(tagname){
				console.log("add student.");
				dojo.xhrGet({
	           	url: 'addStudent.do',
	           	load: function (data,ioArgs){
					console.log(data);
				},
	           	error: callError,
	           		content: {name: "test" }
	        	});
			}
			//查询物品
			function queryGoods(tagname){
				dojo.xhrPost({
	           	url: 'queryStudent.do',
	           	form:'queryForm',
	           	load: function (data,ioArgs){
					console.log(data);
					data = eval(data);
					var store = new dojox.grid.data.Objects(null, data);
		            studentGrid.setModel(store);
		            studentGrid.refresh();
				},
	           	error: callError
	        	});
			}
			//入库确认
			function inStorehouse(tagname){
			dojo.xhrPost({
	           	url: 'inStorehose.do',
	           	//form:'queryForm',??
	           	load: function (data,ioArgs){
					console.log(data);
					data = eval(data);
					var store = new dojox.grid.data.Objects(null, data);
		            uploadGrid.setModel(store);
		            uploadGrid.refresh();
				},
	           	error: callError
	        	});
			}
			
			function callError(data,ioArgs){
				console.log(data);
			}
			
		var structure = [{"cells": [[
             {"field": "no", "name": "退货编号","width": "100px"},
             {"field": "name", "name": "货物名称"},
             {"field": "storehouse", "name": "仓库"},            
             {"field": "place", "name": "库位"},
             {"field": "number", "name": "数量"},
             //{"field": "type", "name": "型号", "width": "120px"},
             {"field": "type", "name": "型号"},
             {"field": "color", "name": "颜色"},
             {"field": "material", "name": "材质"},
             
             ]]
			}];
			
			
		   //入库详情表结构
		   var inStoreDetailStructure = [{"cells": [[
             {"field": "no", "name": "退货编号","width": "100px"},
             {"field": "inStoreDate", "name": "退货日期"}, 
             {"field": "adminName", "name": "退货人"},            
             {"field": "goodsName", "name": "物品名称"},
             {"field": "storehouse", "name": "仓库"},            
             {"field": "place", "name": "库位"},
             {"field": "number", "name": "数量"},
             {"field": "type", "name": "型号"},
             {"field": "color", "name": "颜色"},
             {"field": "material", "name": "材质"},
             ]]
			}];
			
		dojo.addOnLoad(function(){
             studentGrid.setStructure(structure);
             var mainTabContainer = dijit.byId("mainTabContainer");
             var inStoreDetail=dijit.byId("inStoreDetail");//
             mainTabContainer.selectChild(inStoreDetail);//
             //var importTab = dijit.byId("import");
             //mainTabContainer.selectChild(importTab);
             //showGrid();
			 inStoreDetailGrid();//
             var queryTab = dijit.byId("queryTab");
             mainTabContainer.selectChild(queryTab);
             //queryStudent();
          }
        );
	</script>
	</head>
	<body class="tundra">
		<div id="mainTabContainer" dojoType="dijit.layout.TabContainer"
			style="width: 100%; height: 100%">
			<div dojoType="dijit.layout.ContentPane" title="查询物品" id="queryTab">
				<form action="" id="queryForm" name="queryForm">
					&ensp; 退货编号:
					<input dojoType=dijit.form.TextBox type="text" id="queryNo"
						name="queryNo" maxlength="16" style="width: 120px;">
					名称:
					<input dojoType=dijit.form.TextBox type="text" id="queryName"
						name="queryName" maxlength="16" style="width: 100px;">
					<button dojoType="dijit.form.Button" onClick=queryGoods()>
						查看
					</button>
					<div dojoType="dojox.Grid" id="studentGrid" jsId="studentGrid"
						style="height: 90%"></div>
				</form>
				<br />

			</div>
			
			<div dojoType="dijit.layout.ContentPane" title="退货" id="import">
				货号：
				<input dojoType="dijit.form.TextBox" name="filename" type="text"
					id="goodsNo" style="width: 120px;"></br>
				退货原因：</br>
				<textarea rows="5" cols="50" id="refuseReason">
				物品规格与要求不符
				</textarea>
				<button dojoType="dijit.form.Button" onClick=inStorehouse()>
					确认退货
				</button>
				<div dojoType="dojox.Grid" id="uploadGrid" jsId="uploadGrid"
					style="height: 90%"></div>
				</div>
				
				<div dojoType="dijit.layout.ContentPane" title="退货详情" id="inStoreDetail">
				退货编号：
				<input dojoType="dijit.form.TextBox" name="goodsNoDetail" type="text"
					id="goodsNoDetail" style="width: 120px;">
				入库人姓名：
				<input dojoType="dijit.form.TextBox" name="adminName" type="text"
					id="adminName" >	
				<button dojoType="dijit.form.Button" onClick=inStorehouse()>
					查看
				</button>
				<div dojoType="dojox.Grid" id="inStoreDetailGrid" jsId="inStoreDetailGrid"
					style="height: 90%"></div>
				</div>	
				<script type="text/javascript">
					function showGrid(){
					    var uploadGrid = dijit.byId("uploadGrid");
						uploadGrid.setStructure(inStorehouseStructure);
						uploadGrid.refresh();
					}
					
					function inStoreDetailGrid(){//
						var inStoreDetailGrid=dijit.byId("inStoreDetailGrid");
						inStoreDetailGrid.setStructure(inStoreDetailStructure);
						inStoreDetailGrid.refresh();
					}
				</script>
			</div>
	</body>
</html>
