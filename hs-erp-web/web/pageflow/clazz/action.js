function addClazz(tagname){
	console.log("add clazz.");
	dojo.xhrGet({
   	url: 'addClazz.do',
   	content: {name: "test" },
   	load: function (data,ioArgs){
		console.log(data);
	},
   	error: callError
	});
}
			
function queryClazz(tagname){
	dojo.xhrPost({
   	url: 'queryClazz.do',
   	form:'queryForm',
   	load: function (data,ioArgs){
		console.log(data);
		data = eval(data);
		var store = new dojox.grid.data.Objects(null, data);
        clazzGrid.setModel(store);
        clazzGrid.refresh();
	},
   	error: callError
	});
}

/**
 * Structure
 * @param {type}  
 */
 function Structure() {
 	this.structure = [{"cells": [[
		     {"field": "acdemicYear", "name": "学年度"},
		     {"field": "name", "name": "班级名称"},            
		     {"field": "headTeacher", "name": "班主任"},
		     {"field": "monitor", "name": "班长"},
		     {"field": "studentCount", "name": "班级人数"}
		     ]]}];
 }
 
 
