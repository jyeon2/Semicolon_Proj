package guest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import guest.model.CouponBean;
import guest.model.CouponDao;
import guest.model.GuestBean;
import guest.model.GuestDao;
import guest.model.KakaoProfile;
import guest.model.OAuthToken;

@Controller
public class KakaoController {
	
	private final String command = "kakao.gt";
	private final String gotoPage = "redirect:/home.gt";
		
	private String client_id = "2408fd0a173459c3585561d416f29ec3";
	private String redirect_uri = "http://localhost:8080/project/kakao.gt";
	//private String request_url = "https://kauth.kakao.com/oauth/token";
	
	@Autowired
	private GuestDao guestDao;
	
	@Autowired
	@Qualifier("GCouponDao")
	private CouponDao couponDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String kakao(@RequestParam("code") String code,
						HttpServletResponse servletResponse,
						Model model,
						HttpSession session) {
		//System.out.println("KLC");
		//System.out.println("code: "+ code); 
		
		String access_token = getAccessToken(code);
		System.out.println("access_token:"+access_token);
		
		RestTemplate rt = new RestTemplate();
		
		//HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer "+ access_token);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<String> kakaoProfileRequest = new HttpEntity<String>(headers);
		
		//요청하기 => response 변수에 응답을 받아온다
		ResponseEntity<String> response = rt.exchange(
				"https://kapi.kakao.com/v2/user/me", //토큰 발급 요청 주소
				HttpMethod.POST, //POST방식
				kakaoProfileRequest, //header,param
				String.class //String클래스로 리턴받음
		);
		
		System.out.println("response.getBody():"+response.getBody());
		
		ObjectMapper objectMapper = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper.readValue(response.getBody(), KakaoProfile.class);
			
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("kakaoProfile.getId():"+kakaoProfile.getId());
		System.out.println("kakaoProfile.getNickname():"+kakaoProfile.getProperties().getNickname());
		System.out.println("kakaoProfile.getEmail():"+kakaoProfile.getKakao_account().getEmail());
		
		//guest DB에서 email, password, name 
		//name=> kakao_nickname()
		//email=> email()
		//password=> id()
		
		GuestBean guest = new GuestBean();
		guest.setEmail(kakaoProfile.getKakao_account().getEmail());
		guest.setName("kakao_"+kakaoProfile.getProperties().getNickname());
		guest.setKakao(1);
		guest.setPassword(String.valueOf(kakaoProfile.getId()));
		
		//가입자인지 확인
		GuestBean kakaoGuest = guestDao.selectKakaoGuestOne(guest);
		
		//확인하고 없으면 insert. 있으면 insert 안하기
		if(kakaoGuest == null) {
			guestDao.insertKakaoGuest(guest);
			//게스트 정보 가져오기 -> 로그인 되었다고 세션 설정
			GuestBean guestInfo = guestDao.selectKakaoGuestOne(guest);
			session.setAttribute("guestInfo", guestInfo); //세션 설정
			
			
			CouponBean coupon = new CouponBean();
			coupon.setGno(guestInfo.getGno());
			coupon.setCode("welcome");
			coupon.setUse(1);
			
			String joindate = guestInfo.getJoindate();
			System.out.println("JC의 joindate:"+joindate);
			
			String monthDate = null;
			
			//쿠폰의 유효기간을 가입한 시점으로 1달 안에 사용 가능하게끔
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				//String -> Date
				Date date = sdf.parse(joindate);
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(date); 
				
				cal.add(Calendar.MONTH, 1); //1달 더하기
				
				monthDate = sdf.format(cal.getTime());
				
				System.out.println("JC의 cal:"+monthDate);
				
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
			coupon.setPeriod(monthDate);
			
			couponDao.insertCoupon(coupon);
			
			servletResponse.setContentType("text/html charset=utf-8");
			try {
				PrintWriter writer = servletResponse.getWriter();
				writer.println("<script>");
				writer.println("alert('회원가입을 축하합니다. \\n\\n가입축하쿠폰이 발급되었습니다. \\n(마이페이지에서 쿠폰을 확인할 수 있습니다.)')");
				writer.println("location.href='home.gt'");
				writer.println("</script>");
				
				writer.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return null;
		}
		else {
			session.setAttribute("guestInfo", kakaoGuest); //세션 설정
		}
		
		//System.out.println("KC의 kakaoGuest:"+kakaoGuest);
		//System.out.println("kakaoGuest.email:"+kakaoGuest.getEmail());
		
		System.out.println("KC의 guestInfo:"+session.getAttribute("guestInfo"));
		
		return gotoPage;
		
	}

	private String getAccessToken(String code) {
		String access_token = "";
		
		//POST 방식으로 key=value 형식으로 데이터 요청 (카카오 서버쪽으로)
		RestTemplate rt = new RestTemplate();

		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpBody 오브젝트 생성
		// 4가지 데이터 전달
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", client_id);
		params.add("redirect_uri", redirect_uri);
		params.add("code", code);

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		// kakaoTokenRequest는 header와 body를 가지고 있는 오브젝트가 된다
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<MultiValueMap<String, String>>(
				params, headers);

		// 요청하기 => response 변수에 응답을 받아온다
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", // 토큰 발급 요청 주소
				HttpMethod.POST, // POST방식
				kakaoTokenRequest, // header,param
				String.class // String클래스로 리턴받음
		);

		//System.out.println("response:" + response);
		// 200 : 요청이 정상적으로 되었다

		//System.out.println("response.getBody():" + response.getBody());
		// 200 바로 다음에 있는 데이터

		// ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);

		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		access_token = oauthToken.getAccess_token();
		//System.out.println("access_token:"+access_token);
		
		return access_token;
	}

}
