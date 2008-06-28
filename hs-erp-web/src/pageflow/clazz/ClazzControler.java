package pageflow.clazz;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.beehive.netui.pageflow.Forward;
import org.apache.beehive.netui.pageflow.PageFlowController;
import org.apache.beehive.netui.pageflow.annotations.Jpf;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Jpf.Controller(simpleActions = { @Jpf.SimpleAction(name = "begin", path = "../../index.html") })
public class ClazzControler extends PageFlowController {

	@Jpf.Action()
	public Forward addClazz(){
		
		return null;
	}
	@Jpf.Action()
	public Forward queryClazz() throws JSONException, IOException {
		getResponse().setContentType("text/json; charset=UTF-8");
		// String value = new String(queryNo.getBytes("iso-8859-1"), "utf-8");

		JSONArray array = new JSONArray();

		JSONObject shuguang = new JSONObject();
		shuguang.put("acdemicYear", "2006~2007");
		shuguang.put("name", "初一一班");
		shuguang.put("headTeacher", "胡曙光");
		shuguang.put("monitor", "懂成家");
		shuguang.put("studentCount", "35");
		array.put(shuguang);
		
		JSONObject xiushu = new JSONObject();
		xiushu.put("acdemicYear", "2006~2007");
		xiushu.put("name", "初一二班");
		xiushu.put("headTeacher", "朱兴宇");
		xiushu.put("monitor", "刘家顺");
		xiushu.put("studentCount", "36");
		array.put(xiushu);

		JSONObject yulei = new JSONObject();
		yulei.put("acdemicYear", "2007~2008");
		yulei.put("name", "初二三班");
		yulei.put("headTeacher", "刘国安");
		yulei.put("monitor", "王兴涛");
		yulei.put("studentCount", "32");
		array.put(yulei);

		PrintWriter writer = getResponse().getWriter();
		writer.write(array.toString());
		return null;
	}
}
