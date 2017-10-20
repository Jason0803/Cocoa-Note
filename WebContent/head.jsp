<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cocoa Note : 행복한 하루 되세요!</title>
<link rel="stylesheet" href="CocoaCSS.css">
</head>
<body>
<div class="nav">
	<a href="DispatcherServlet?command=cal&year=${today.year}&month=${today.month}"><span class="nav-menu">캘린더</span></a>
	<a href="DispatcherServlet?command=noteList"><span class="nav-menu">노트</span></a>
	<a href="DispatcherServlet?command=memoList"><span class="nav-menu">메모</span></a>
</div>