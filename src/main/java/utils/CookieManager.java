package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 쿠키 생성, 읽기, 삭제를 위한 유틸리티 클래스
public class CookieManager {
    
	// 쿠키 생성 : 생성 시 response 내장 객체가 필요하므로 매개변수를 통해 JSP에서 받아야 한다.
    public static void makeCookie(HttpServletResponse response, String cName,
            String cValue, int cTime) {
    	// 쿠키 생성
        Cookie cookie = new Cookie(cName, cValue);
        // 경로 설정
        cookie.setPath("/");
        // 시간 설정
        cookie.setMaxAge(cTime);
        // 응답헤더에 추가하여 클라이언트로 전송
        response.addCookie(cookie);
    }

    // 쿠키값 읽기 : request 내장 객체가 필요하므로 매개변수로 받아야 한다.
    public static String readCookie(HttpServletRequest request, String cName) {
    	// 쿠키값을 받기 위한 변수 선언 및 빈칸으로 초기화
        String cookieValue = "";
        // 생성된 쿠키 전체를 getter()메소드로 cookies 배열에 넣는다.
        Cookie[] cookies = request.getCookies();
        // 쿠키가 있다면
        if (cookies != null) {
        	// 쿠키 개수만큼 반복하며
            for (Cookie c : cookies) {
            	// 쿠키 이름을 가져와서
                String cookieName = c.getName();
                // 내가 찾는 쿠키가 있는지 확인하고
                if (cookieName.equals(cName)) {
                	// 있다면 쿠키값을 읽어온다.
                    cookieValue = c.getValue();
                }
            }
        }
        // 쿠키값을 반환한다.
        return cookieValue; 
    }

    // 쿠키 삭제
    public static void deleteCookie(HttpServletResponse response, String cName) {
    	/**
    	 * 쿠키는 삭제를 위한 별도의 메소드가 없다. 빈값과 유효기간을 0으로 설정하면 삭제된다.
    	 * 따라서 앞에서 생성한 makeCookie()메소드를 재활용하면 된다.
    	 */
        makeCookie(response, cName, "", 0);
    }
}

