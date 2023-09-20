package simplecustomtags;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class SelectCustom  extends TagSupport{
	
	String from,to,table,column;

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}
	
	
	public int doStartTag() {
		
		JspWriter out = pageContext.getOut();
		try {
		
			Class.forName("org.postgresql.Driver");
			Connection cn = DriverManager.getConnection("jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");
			Statement st = cn.createStatement();
			String query = "select "+column+" from "+table;
			ResultSet rs = st.executeQuery(query);
			out.print("<select>");
			while(rs.next()) {
			String station = rs.getString(column);
			out.print("<option value= '" + station +" '>"+station+"</option>" );
			}
			out.print("<select>");
			
			rs.close();
			st.close();
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SKIP_BODY;
		
	}
	
	
	

}
