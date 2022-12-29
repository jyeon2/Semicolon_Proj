
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- common\common.jsp -->

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <%MemberBean member=(MemberBean)session.getAttribute("loginInfo"); %>
접속자 아이디 :<%=member.getId()%> --%>

<!--
el의 내장객체

-pageScope
-> requestScope
-> sessionScope

(이 순서대로 비교해보며, 설정한 것이 있다면 가져오는 것)
 -->