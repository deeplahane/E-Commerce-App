<%@page import="com.entities.Message"%>

<%
Message m = (Message) session.getAttribute("msg");
if (m != null) {
%>
<div class="alert <%=m.getCssClass()%> alert-dismissible fade show"
	role="alert">
	<%=m.getContent()%>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<%
} 
session.removeAttribute("msg");
%>