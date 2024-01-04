<%@ page import="nn.ru.http.service.TicketService" %>
<%@ page import="nn.ru.http.dto.TicketDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: voyag
  Date: 28.12.2023
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="http://mycompany.com" %>--%>
<%--<%@ include file="index.html" %>--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Купленные билеты</h1>
<ul>
    <%
        Long flightId = Long.valueOf(request.getParameter("flightId"));
        List<TicketDto> tickets = TicketService.getInstance().findAllByFlightId(flightId);
        for (TicketDto ticket : tickets) {
            out.write(String.format("<li>%s</li>", ticket.getSeatNo()));
        }
    %>
</ul>
</body>
</html>

<%!
    public void jsdInit() {
        System.out.println("Hello world3");
    }
%>
</jsp:root>