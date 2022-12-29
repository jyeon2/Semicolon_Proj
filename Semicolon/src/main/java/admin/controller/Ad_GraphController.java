package admin.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import guest.model.GuestDao;
import host.model.HostDao;

@Controller
public class Ad_GraphController {

   private final String command = "graph.ad";
   private String gotoPage = "graph";
      
   @Autowired
   private GuestDao guestDao;
   
   @Autowired
   private HostDao hostDao;
   
   @RequestMapping(command)
   public String graph(Model model) {
      
      //오늘의 월 구하기
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
      Date date = new Date();
      //System.out.println(date);
      String today = sdf.format(date);
      //System.out.println(today);
      model.addAttribute("today",today);

      //어제 날짜 구하기
      Calendar cal = Calendar.getInstance();
      cal.add(Calendar.DATE,-1);
      SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
      String yesterday = s.format(cal.getTime());

      //(게스트)어제 가입자수, 오늘 가입자수 구하기
      int today_guest = guestDao.todayGuest();
      int yesterday_guest = guestDao.yesterdayGuest(yesterday);
      model.addAttribute("today_guest",today_guest);
      model.addAttribute("yesterday_guest",yesterday_guest);

      //(호스트)어제 가입자수, 오늘 가입자수 구하기
      int today_host = hostDao.todayHost();
      int yesterday_host = hostDao.yesterdayHost(yesterday);
      model.addAttribute("today_host",today_host);
      model.addAttribute("yesterday_host",yesterday_host);    

      return gotoPage;
   }
}