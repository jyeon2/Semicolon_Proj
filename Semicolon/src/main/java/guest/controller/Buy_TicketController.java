package guest.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import guest.model.GuestBean;
import guest.model.SeasonTBean;
import guest.model.SeasonTDao;

@Controller
public class Buy_TicketController {

	public final String command="buyTicket.gt";
	public String gotoPage = "home";
	
	@Autowired
	private SeasonTDao stdao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String buy_ticket(@RequestParam("ticket_choice") int ticket_choice,
							 Model model,HttpSession session,HttpServletResponse response) throws IOException {
		
		GuestBean gb =(GuestBean)session.getAttribute("guestInfo");
		int gno = gb.getGno();
		
		SeasonTBean stb = new SeasonTBean(0,gno,ticket_choice,ticket_choice);
		
		stdao.insertSeasonT(stb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('정기권 결제가 되었습니다')");
		out.println("location.href='home.gt'");
		out.println("</script>");
		out.flush();
		
		return gotoPage;
	}
}
