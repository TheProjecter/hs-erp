package pageflow.student;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.beehive.netui.pageflow.Forward;
import org.apache.beehive.netui.pageflow.PageFlowController;
import org.apache.beehive.netui.pageflow.annotations.Jpf;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Jpf.Controller(simpleActions = { @Jpf.SimpleAction(name = "begin", path = "../../index.html") })
public class StudentControler extends PageFlowController {
	private Log log = LogFactory.getLog(StudentControler.class);

	@Jpf.Action()
	public Forward addStudent() {
		try {
			getResponse().setContentType("text/json; charset=UTF-8");
			String string = getRequest().getParameter("name");
			String value = new String(string.getBytes("iso-8859-1"), "utf-8");
			System.out.println("value = " + value);
			PrintWriter writer = getResponse().getWriter();
			writer.write("test successful!");
			writer.flush();
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Jpf.Action()
	public Forward queryStudent() throws IOException, JSONException {
		getResponse().setContentType("text/json; charset=UTF-8");
		
		String queryNo = getRequest().getParameter("queryNo");
		System.out.println("queryNo = " + queryNo);
		System.out.println("queryName = "
				+ getRequest().getParameter("queryName"));
		String value = new String(queryNo.getBytes("iso-8859-1"), "utf-8");
		System.out.println("value = " + value);

		JSONArray array = new JSONArray();
		
		JSONObject xiushu = new JSONObject();
		xiushu.put("no", "AZ20070322");
		xiushu.put("name", "钢材");
		xiushu.put("storehouse", "A");
		xiushu.put("place", "c12");
		xiushu.put("number", "30");
		xiushu.put("type", "Wg112");
		xiushu.put("color", "灰");
		xiushu.put("material", "钨");
		//xiushu.put("date", "2007-03-12");
		array.put(xiushu);
		
		JSONObject yulei = new JSONObject();
		yulei.put("no", "DS20070304");
		yulei.put("name", "毛巾");
		yulei.put("storehouse", "B");
		yulei.put("place", "h33");
		yulei.put("number", "43");
		yulei.put("type", "M562");
		yulei.put("color", "浅黄");
		yulei.put("material", "棉");
		//yulei.put("date", "2007-08-09");
		array.put(yulei);
		
		
		PrintWriter writer = getResponse().getWriter();
		writer.write(array.toString());
		return null;
	}

	public static void main(String[] args) throws Exception, JSONException {
		StudentControler controler = new StudentControler();
		controler.queryStudent();
	}
}
