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
		xiushu.put("name", "张修暑");
		xiushu.put("no", "0001");
		xiushu.put("phone", "13671820444");
		xiushu.put("gender", "男");
		xiushu.put("birthday", "1983-07-23");
		xiushu.put("address", "上海市罗山路");
		array.put(xiushu);
		
		JSONObject yulei = new JSONObject();
		yulei.put("name", "葛以磊");
		yulei.put("no", "0002");
		yulei.put("phone", "13671820555");
		yulei.put("gender", "男");
		yulei.put("birthday", "1981-09-23");
		yulei.put("address", "上海市罗山路");
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
