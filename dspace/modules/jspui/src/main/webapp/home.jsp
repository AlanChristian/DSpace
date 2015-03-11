<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Home page JSP
  -
  - Attributes:
  -    communities - Community[] all communities in DSpace
  -    recent.submissions - RecetSubmissions
  --%>

<%@page import="org.dspace.content.Bitstream"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Locale"%>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.app.webui.components.RecentSubmissions" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.core.NewsManager" %>
<%@ page import="org.dspace.browse.ItemCounter" %>
<%@ page import="org.dspace.content.Metadatum" %>
<%@ page import="org.dspace.content.Item" %>

<%
    Community[] communities = (Community[]) request.getAttribute("communities");

    Locale sessionLocale = UIUtil.getSessionLocale(request);
    Config.set(request.getSession(), Config.FMT_LOCALE, sessionLocale);
    String sideNews = NewsManager.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-side.html"));

    boolean feedEnabled = ConfigurationManager.getBooleanProperty("webui.feed.enable");
    String feedData = "NONE";
    if (feedEnabled)
    {
        feedData = "ALL:" + ConfigurationManager.getProperty("webui.feed.formats");
    }
    
    ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));

    RecentSubmissions submissions = (RecentSubmissions) request.getAttribute("recent.submissions");
%>


<dspace:layout locbar="nolink" titlekey="jsp.home.title" feedData="<%= feedData %>">

	<div class="container">
		<form method="get" action="<%= request.getContextPath() %>/simple-search" class="form-horizontal col-md-12 form-group form-group-lg" scope="search" role="form">
						
			<div id="logo-deposita" class="col-md-11 text-center">
				<a  id="link-logo-deposita" href="<%= request.getContextPath() %>/community-list">
					<img src="<%= request.getContextPath() %>/image/Diadorim.png" usemap="#mapa-brasil">		
				</a>
			</div>
			
			
		<div class="col-md-12 searchbox">
			<div class="col-md-11"><input type="text" class="form-control" placeholder="Buscar no Diretório"/></div>				
			<div class="col-md-1">
			   <button type="submit" class="btn btn-primary pull-right search-button"><span class="glyphicon glyphicon-search"></span></button>
			</div>
		</div>
		
		
		</form>
	</div>

<div class="container row">

			<img src="<%= request.getContextPath() %>/image/RD.png">
			<img src="<%= request.getContextPath() %>/image/Diretorio de revistas cientificas do Brasil.png"id= "Distancia">
			<img src="<%= request.getContextPath() %>/image/BDTD.png"id= "Distancia">
			<img src="<%= request.getContextPath() %>/image/diadorim logo.png"id= "Distancia2">
			<img src="<%= request.getContextPath() %>/image/Riobaldo.png"id= "Distancia">
</div>
</dspace:layout>
