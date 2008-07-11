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
             {"field": "no", "name": "入库编号","width": "100px"},
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
			
			//确认入库表结构
			var inStorehouseStructure = [{"cells": [[
             {"field": "no", "name": "入库编号","width": "100px"},
             {"field": "storehouse", "name": "仓库"},            
             {"field": "place", "name": "库位"},
             {"field": "number", "name": "数量"},
             ]]
			}];
		   //入库详情表结构
		   var inStoreDetailStructure = [{"cells": [[
             {"field": "no", "name": "入库编号","width": "100px"},
             {"field": "inStoreDate", "name": "入库日期"}, 
             {"field": "adminName", "name": "入库人"},            
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
             var importTab = dijit.byId("import");
             mainTabContainer.selectChild(importTab);
             showGrid();
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
					&ensp; 入库编号:
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
			
			<div dojoType="dijit.layout.ContentPane" title="物品入库" id="import">
				货号：
				<input dojoType="dijit.form.TextBox" name="filename" type="text"
					id="goodsNo" style="width: 120px;">
				<button dojoType="dijit.form.Button" onClick=inStorehouse()>
					确认入库
				</button>
				<div dojoType="dojox.Grid" id="uploadGrid" jsId="uploadGrid"
					style="height: 90%"></div>
				</div>
				
				<div dojoType="dijit.layout.ContentPane" title="入库详情" id="inStoreDetail">
				入库编号：
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
					
					/*var studentInfo = "[{";
					function read(){
						console.log("reading file...");
						var oXL=new ActiveXObject("Excel.application");
						console.log("Excel.application");
					    var path=dojo.byId("file").value;
					    console.log(path);
					    var oWB=oXL.Workbooks.open(path); 
					    oWB.worksheets(1).select(); 
					    var oSheet=oWB.ActiveSheet; 
				      	for(var i=2;i<4;i++){
				      		if(i > 2){
					      		studentInfo +=",{";
					      	}
					      	for(var j = 1; j < 7; j ++){
						      	if(oSheet.Cells(i,j).value!=undefined){
						      		value=oSheet.Cells(i,j).value;
									if(j == 1 ){studentInfo += "name:";}else
									if(j == 2 ){studentInfo += "no:";}else
									if(j == 3 ){studentInfo += "gender:";}else
									if(j == 4 ){studentInfo += "phone:";}else
									if(j == 5 ){
										studentInfo += "birthday:";
										var date = new Date(value);	
										value = date.toLocaleString();
										value = value.substring(0, value.length - 8);
										studentInfo += "'" + value + "',";
										console.log("value = " + value);	
										continue;
									}else if(j == 6 ){studentInfo += "address:";}
							        studentInfo += "'" + value + "',";
						         }else{
						         	break;
						         }
					      	}
					      	studentInfo = studentInfo.substring(0, studentInfo.length - 1);
					      	studentInfo +="}";
					   	}
					   	studentInfo +="]";
					   	oWB.close();
					   	console.log(studentInfo);
					   	var uploadGrid = dijit.byId("uploadGrid");
					   	studentInfoEval = eval(studentInfo);
						var store = new dojox.grid.data.Objects(null, studentInfoEval);
		            	uploadGrid.setModel(store);
		            	uploadGrid.refresh();	
		            					    
					}
					
					function upload(){
						var uploadButton = dijit.byId("uploadButton");
						uploadButton.setLabel("正在上传...");
						uploadButton = dojo.byId("uploadButton");
						uploadButton.disabled = true;
						
						dojo.xhrPost({
			           	url: 'addStudent.do',
			           	content: {name: studentInfo},
			           	load: function (data,ioArgs){
							console.log(data);
				            uploadButton = dijit.byId("uploadButton");
							uploadButton.setLabel("上传完成");
						},
			           	error: callError
			        	});
					}*/
					
				</script>
			</div>
	</body>
</html>
