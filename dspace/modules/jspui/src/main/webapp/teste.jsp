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

<div>
	<h1><p><strong><font color='CornflowerBlue'>Diadorim</font></strong></p></h1>
	
	<p align='center'><h2><strong><font color='RoyalBlue '>Sistema de classificação das revistas</font></strong></h2></p>
	
		<p align='justify'><br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbspO Diadorim é um serviço de informações relativas às autorizações concedidas para o armazenamento e o acesso dos artigos das revistas brasileiras em repositórios digitais de acesso aberto. Faz parte do conjunto de serviços de acesso aberto do Instituto Brasileiro de Informação em Ciência e Tecnologia. As informações aqui divulgadas são coletadas diretamente com os editores das revistas científicas brasileiras, a quem agradecemos pelo envio e atualização das informações.
		<br><br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbspO objetivo deste serviço é identificar, sistematizar e disponibilizar as informações das políticas estabelecidas pelas editoras dos periódicos brasileiros referentes ao armazenamento dos artigos nos repositórios institucionais. Constitui-se em uma fonte de consulta importante para que autores e gestores de repositórios não descumpram o acordo de publicação estabelecido entre o autor e a revista, quando do arquivamento de artigos no repositório da instituição. Veja no item do menu "Permissão de depósito" os detalhes do sistema de classificação das revistas.
		</p>
</div>
</dspace:layout>
