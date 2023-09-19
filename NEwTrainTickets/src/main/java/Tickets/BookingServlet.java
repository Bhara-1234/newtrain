package Tickets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		String train=request.getParameter("train");
		String clas=request.getParameter("class");
		String date=request.getParameter("date");
		String[] name=request.getParameterValues("name");
		String[] gender=request.getParameterValues("gender");
		String[] age=request.getParameterValues("age");
		Ticket t=new Ticket(from,to,train,clas,date);
		Stations j=new Stations();
		Ticket tkt=j.setTicket(t);
		ArrayList<Passenger> pass=j.setPassengers(name, gender, age);
		
		request.setAttribute("ticket",tkt);
		request.setAttribute("pas", pass);
		
		RequestDispatcher rd=request.getRequestDispatcher("/view.jsp");
		rd.forward(request, response);
		
		
	}

}















====================================================================









	select * from TktTickets
CREATE TABLE TktTickets (
    ticket_id  serial PRIMARY KEY,
    from_location VARCHAR(255) NOT NULL,
    to_location VARCHAR(255) NOT NULL,
    train VARCHAR(255) NOT NULL,
    class VARCHAR(255) NOT NULL,
    date DATE NOT NULL
);
ALTER TABLE TktTickets
ALTER COLUMN date TYPE VARCHAR(20); -- Change the size (20) based on your requirements
select * from TktPassengers 
drop table  tktpassengers
create table tktpassengers (name varchar(50),age varchar(50),gender varchar(50)  );
RENAME COLUMN ticket_id TO pnr;
insert into TktPassengers values(?,?,?)
create table  tktpassengers as select * from  TktPassengers
select * from tktpassengers

