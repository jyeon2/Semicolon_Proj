package guest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import host.model.AllBean;
import host.model.HouseDao;

@Controller
public class GMapController {

   public final String command = "allAddress.gt";
   
   @Autowired
   public HouseDao hdao;
   
   @RequestMapping(command)
   public void gMap(HttpServletResponse response) {
      
      List<AllBean> lists = hdao.getAllHouse();
      
      String all_address = "";
      
      if(lists != null) {
         for(AllBean ab : lists) {
            all_address += ab.getAddress() + " " + ab.getDetailed() + ",";
         }
      }else {
         System.out.println("주소 가져오기 실패(GMapController");
      }
      
      try {
         PrintWriter writer =response.getWriter();
         writer.print(all_address);
      } catch (IOException e) {
         e.printStackTrace();
      }
   }//gMap
}