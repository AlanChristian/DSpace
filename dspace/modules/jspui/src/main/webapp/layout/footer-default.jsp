<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
%>

            <%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null)
    {
%>
	</div>
	<div class="col-md-3">
                 
    </div>
    </div>       
<%
    }
%>
</div>
</main>
            <%-- Page footer --%>
             <footer class="navbar navbar-inverse navbar-bottom">
             <div id="designedby" class="container text-muted">
							 <img src="<%= request.getContextPath() %>/image/Finep.png">
							 <img src="<%= request.getContextPath() %>/image/Abec.png">
							 
			
             <div id="footer_feedback" class="pull-right">                                    
                                <img src="<%= request.getContextPath() %>/image/ibict-60.png">
								
                                </div>
			</div>
    </footer>
    </body>
</html>