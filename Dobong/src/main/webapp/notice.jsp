<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "Beans.*" %>
<jsp:useBean id="noticeDao" class = "DAO.NoticeDAO" scope="page" />
<%@taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>공지사항 게시판</title>
	</head>
	<body>
		<h1>공지사항 작성</h1>
		<div>
            <h3>글 검색 폼</h3>
            <form method="post" action="writeNotice.jsp">
                <fieldset>
                    <legend>글 검색 필드</legend>                    
                    <label>검색분류</label>
                        <select name = "f">
                            <option ${(param.f == "title")? "selected" : ""} value = "title">제목</option>
                            <option ${(param.f == "nickname")? "selected" : ""} value = "writer_id">작성자</option>
                        </select>
                    <label>검색어</label>
                        <input type = "text" name = "q" value = "${param.q}"/>
                        <input type = "submit" value = "검색">             
                </fieldset>
                <hr>
                <table align="center" border = "1">
                	<caption>공지사항 게시판</caption>
                	<tr>
                		<th>번호</th><th>작성자</th><th>제목</th><th>작성시간</th>
                	</tr>
                		<%
							ArrayList<NoticeBean> noticeList = noticeDao.getNotice();
							int counter = noticeList.size();
							for(int i=0; i<noticeList.size(); i++){
								NoticeBean notice = noticeList.get(i);
								//이 부분을 뭔가 손봐줘야 할 것 같다.
								//int number=notice.getNumber();
								int num = notice.getNumber();
								String nick = notice.getNickname();
								String title = notice.getTitle();
								String write = notice.getWritingtime();
								request.setAttribute("num", "number");
						%>
                	<tr>
                		<td><%=num %></td>
                		<td><%=nick %></td>
                		<td><a href="Content.do?number=<%=num %>"><%=title %></a></td><!-- href 부분에 태그립을 써야합니다. -->
                		<td><%=write %></td>
                	<% 
							}
							
                	%>
                	</tr>                		
                </table>
                <br/>
                total records : <%=counter %>
                <input type = "submit" value="글쓰기">
            </form>    
        </div>
	</body>
</html>