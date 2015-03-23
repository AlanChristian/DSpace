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
<%@ page import="org.dspace.content.DCValue" %>
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

	<p align='center'><h1><strong><font color='CornflowerBlue'>Documentos Úteis</font></strong></h1></p>
	<br>
		<h3>Textos</h3>
		<a href='http://www.planalto.gov.br/ccivil_03/leis/L9610.htm'>» Lei n° 9.610: Lei de direitos autorais</a>
		<br>
		<a href='http://diadorim.ibict.br/about/docs/documento_apoio_servico_diadorim.pdf'>» Documento de apoio ao serviço Diadorim</a>
		<br>
		<a href='http://diadorim.ibict.br/about/docs/guia_cadastro.pdf'>» Guia para o cadastro</a>
		<br>
		<br>
		<h3>Vídeos</h3>
		<a href='http://www.youtube.com/watch?v=2lB4bdu8dAM'>» Sobre o Diadorim</a>
		<br>
		<a href='http://www.youtube.com/watch?v=MzhHUA4VcAg&list=PL72338478F1306EC8&feature=mh_lolz'>» Controlar seus direitos facilita o acesso aberto</a>
		<br>
		<br>
		<h3>Materiais de divulgação</h3>
		<a href='http://diadorim.ibict.br/about/docs/folder_divulga_diadorim.pdf'>» Folder de divulgação do Diadorim</a>
		<br>
		<a href='http://diadorim.ibict.br/about/docs/cartaz_divulga_diadorim.pdf'>» Cartaz de divulgação do Diadorim</a>
		<br>
		<br>
		
		
		
		

</dspace:layout>
