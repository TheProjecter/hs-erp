<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>
<html>
	<head>
		<title>班级管理</title>
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
		dojo.addOnLoad(function(){
			 var st = new Structure();
			 console.log(st);
             clazzGrid.setStructure(st.structure);
             var mainTabContainer = dijit.byId("mainTabContainer");
             var queryTab = dijit.byId("queryTab");
             mainTabContainer.selectChild(queryTab);
             queryClazz();
          }
        );
        
	</script>
	</head>
	<body class="tundra">
		<div id="mainTabContainer" dojoType="dijit.layout.TabContainer"
			style="width: 100%; height: 100%">
			<div dojoType="dijit.layout.ContentPane" title="查看班级" id="queryTab">
				<form action="" id="queryForm" name="queryForm">
					&ensp; 学年度:
					<select dojoType="dijit.form.FilteringSelect" id="queryAcdemicYear"
					name="queryAcdemicYear" autoComplete="false"
					onChange="console.log(arguments[0])">
					<option value="2005~2006">2005~2006</option>
					<option value="2006~2007">2006~2007</option>
					<option value="2007~2008">2007~2008</option>
					<option value="2008~2009">2008~2009</option>
				</select>
					年级:
					<select dojoType="dijit.form.FilteringSelect" id="queryGrade"
								name="queryGrade" autoComplete="false" style="width: 118px">
								<option value="1">一年级</option>
								<option value="2">二年级</option>
								<option value="3">三年级</option>
								<option value="4">四年级</option>
								<option value="5">五年级</option>
								<option value="6">六年级</option>
								<option value="7">七年级</option>
								<option value="8">八年级</option>
								<option value="9">九年级</option>
								<option value="9">高一年级</option>
								<option value="9">高二年级</option>
								<option value="9">高三年级</option>
							</select>
					<button dojoType="dijit.form.Button" onClick=selectStudent(this)>
						查询
					</button>
					<div dojoType="dojox.Grid" id="clazzGrid" jsId="clazzGrid"
						style="height: 90%"></div>
				</form>
				<br />

			</div>
			<div dojoType="dijit.layout.ContentPane" title="添加班级">
				<table cellspacing="10px">
					<tr>
						<td colspan="2" align="center" class="title" style="height: 50px;">
							请填写班级信息
						</td>
					</tr>
					<tr>
						<td align="right" width="30%">
							班级名称:
						</td>
						<td align="left">
							<input dojoType=dijit.form.TextBox type="text" id="name"
								name="name" maxlength="16" style="width: 120px;">
						</td>
					</tr>
					<tr>
						<td align="right" width="30%">
							年级:
						</td>
						<td align="left">
							<select dojoType="dijit.form.FilteringSelect" id="grade"
								name="grade" autoComplete="false" style="width: 118px">
								<option value="1">一年级</option>
								<option value="2">二年级</option>
								<option value="3">三年级</option>
								<option value="4">四年级</option>
								<option value="5">五年级</option>
								<option value="6">六年级</option>
								<option value="7">七年级</option>
								<option value="8">八年级</option>
								<option value="9">九年级</option>
								<option value="9">高一年级</option>
								<option value="9">高二年级</option>
								<option value="9">高三年级</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">
							班主任:
						</td>
						<td align="left">
							<input dojoType=dijit.form.TextBox type="text" id="headTeacherId" name="headTeacherId"
								maxlength="16" style="width: 120px;" disabled="disabled">
							<button dojoType="dijit.form.Button" onClick=addStudent>
								查找
							</button>
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
