package main;

import java.awt.Choice;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDao;
import book.BookDto;
import login.MemberDto;

public class MainController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		System.out.println("MainController doProcess");
		
		String param = req.getParameter("param");
		
		if(param.equals("mainscreen")) {
			BookDao dao = BookDao.getInstance();
			
			/*
			String choice = req.getParameter("choice");
			
			if(choice == null && choice.equals("")) {
				choice = "1";
			}
			*/

			List<BookDto> list = dao.getBookList("","",2);

			
			// req.setAttribute("list", list);
			
			// 활동순위 activity
			
			MainDao Mdao = MainDao.getInstance();
			List<MemberDto> Mlist = Mdao.getActivityList();
			
			req.setAttribute("Mlist", Mlist);
			
			
			
			
			// 소그룹 순위
			

			req.getRequestDispatcher("index.jsp").forward(req, resp);
			
		}
	}
}
