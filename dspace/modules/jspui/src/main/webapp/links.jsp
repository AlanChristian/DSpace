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

	<p align='center'><h1><strong><font color='CornflowerBlue'>Links Úteis</font></strong></h1></p>
	<br>
	<p align='center'><h2><strong><font color='RoyalBlue '>Iniciativas Similares</font></strong></h2></p>
		<h3><a href='http://www.sherpa.ac.uk/romeo/'>Romeo</a></h3>
		<p align='justify'><br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbspServiço de difusão de políticas de editoras européias, canadenses, norte americanas e australianas. O serviço consiste em reunir e disponibilizar um resumo das autorizações dadas pelos editores científicos, como parte do acordo de transferência dos direitos de copia sobre o trabalho publicado. é desenvolvido pelo grupo Sherpa e atualmente financiado pelo grupo JISC.
		<br><br></p>
        <h3><a href='https://sites.google.com/site/projectoblimunda/'>Dulcinea</a></h3>
		<p align='justify'><br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbspServiço desenvolvido pelo Ministério da Educação e Ciência da Espanha, a Universidade de Valência e a Universidade de Barcelona, que assim como o projeto Romeo, é um serviço de difusão de política para a publicação de artigos de editoras, nesse caso, espanholas. O serviço tem como objetivo identificar e analisar as políticas das revistas espanholas a respeito do acesso aos seus textos para avaliar como essas políticas podem afetar o depósito nos Repositórios Institucionais ou Temáticos.
		<br><br></p>
		<h3><a href='http://www.accesoabierto.net/dulcinea/'>Blimunda</a></h3>
		<p align='justify'><br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbspServiço que reúne e difunde as políticas das editoras portuguesas. Tem como objetivo compilar as políticas de auto-arquivamento dos editores científicos portugueses e registrar essas informações na base de dados Romeo. Para tanto, estabelece com uma de suas atividades a tradução do portal Romeo para o português. é uma iniciativa financiada e apoiada pela Fundação para a Computação Científica Nacional (FCCN), com desenvolvimento na Divisão de Documentação e Biblioteca da Faculdade de Ciências e Tecnologia da Universidade Nova de Lisboa.
		<br><br></p>
		<h3><a href='http://www.oaklist.qut.edu.au/'>OAKList</a></h3>
		<p align='justify'><br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbspServiço de difusão de políticas de editoras australianas e européias. O objetivo desse projeto é fornecer as permissões de direitos autorais para que possam ser consultados na hora do depósito e desenvolver protocolos para a gestão de copyright no contexto do Acesso Aberto. é um serviço desenvolvido pelo projeto OAK Law.
		<br><br>
		</p>

</dspace:layout>
