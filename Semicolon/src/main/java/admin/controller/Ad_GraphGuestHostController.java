package admin.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import guest.model.GuestBean;
import guest.model.GuestDao;
import host.model.HostBean;
import host.model.HostDao;

@Controller
public class Ad_GraphGuestHostController {
   
   private final String command = "subscriber.ad";
   
   @Autowired
   private GuestDao guestDao;
   
   @Autowired
   private HostDao hostDao;
   
   @RequestMapping(value=command, method=RequestMethod.POST, produces="application/json; charset=utf-8")
   public @ResponseBody Map<String, Object> subscriber(@RequestParam(value="ym",required=false) String ym) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      
      if(ym == null) { //년월 없으면
         LocalDate now = LocalDate.now();
         ym = now.toString();
         ym = ym.split("-")[0] + "-" + ym.split("-")[1];
      }
      
      String year = ym.split("-")[0];
      String month = ym.split("-")[1];
      String start_date = ym+"-01";
      
      ArrayList<GuestBean> list = (ArrayList<GuestBean>) guestDao.yearMonthGuest(start_date);
      map.put("guest", list);
      
      for(GuestBean g : list) {
         System.out.println("g::"+g.getJoindate()+"/"+g.getCnt());
      }
      
      ArrayList<HostBean> lists = (ArrayList<HostBean>) hostDao.yearMonthHost(start_date);
      map.put("host", lists);
      
      for(HostBean h : lists) {
         System.out.println("h::"+h.getJoindate()+"/"+h.getCnt());
      }
      
      map.put("year",year);
      map.put("month",month);
      
      System.out.println("guest map:"+map);
      System.out.println("host map:"+map);
      
      return map;
   }

}