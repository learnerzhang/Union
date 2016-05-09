<%@page import="com.su.model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	User user = (User)session.getAttribute("admin");
	System.out.print(user);
	if(user==null){
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}
%>
<frameset rows="100,*" cols="*" scrolling="No" framespacing="0" frameborder="no" border="0"> 
	<frame src="<%=request.getContextPath() %>/sys/index/head" name="headmenu" id="mainFrame" title="mainFrame"><!-- 引用头部 -->
<!-- 引用左边和主体部分 --> 
	<frameset rows="100*" cols="220,*" scrolling="No" framespacing="0" frameborder="no" border="0"> 
		<frame src="<%=request.getContextPath() %>/sys/index/left" name="leftmenu" id="mainFrame" title="mainFrame">
		<frame src="<%=request.getContextPath() %>/sys/index/main" name="main" scrolling="yes" noresize="noresize" id="rightFrame" title="rightFrame">
	</frameset>
</frameset>
</html>