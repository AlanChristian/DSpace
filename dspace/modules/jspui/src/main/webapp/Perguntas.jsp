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

	<p align='center'><h1><strong><font color='CornflowerBlue'>Perguntas e Respostas</font></strong></h1></p>
	<br>
	<h5><a href="#oqdiadorim">O que é Diadorim?</a></h5>
  <h5><a href="#servediadorim">Para que serve o Diadorim?</a></h5>
  <h5><a href="#cadastrarpolitica">Por que é importante para o editor cadastrar a politica editorial da sua Revista no Diadorim?</a></h5>
  <h5><a href="#sistemadecores">Como funciona o sistema de cores?</a></h5>
  <h5><a href="#pqsistemadecores">Por que o Diadorim usa este sistema de cores para cetegorizar as politicas?</a></h5>
  <h5><a href="#pqdiadorim">Curiosidade: Por que o nome Diadorim?</a></h5>
  <h5><a href="#visualizo">Como visualizo as Revistas cadastradas?</a></h5>
  <h5><a href="#cadastrorevista">Como cadastro minha Revista?</a></h5>
  <h5><a href="#qualquerrevista">Qualquer Revista pode se cadastrar?</a></h5>
  <h5><a href="#revistaestrangeiras">E as Revistas estrangeiras?</a></h5>
  <h5><a href="#aposcadastro">O que acontece após o cadastro?</a></h5>
  <h5><a href="#informacoesregistro">Como altero as informações do registro?</a></h5>
  <h5><a href="#acessoaberto">O que é Acesso Aberto?</a></h5>
  <h5><a href="#aconteceacesso">Como acontece o Acesso Aberto à informação científica?</a></h5>
  <h5><a href="#repositoriosdigitais">O que são repositórios digitais de informação científica?</a></h5>
  <h5><a href="#posprint">Versão pós-print refere-se somente à versão final das revistas impressas, ou inclui a versão definitiva no caso das revistas somente eletrônicas?</a></h5>
  <h5><a href="#diferencapos">Qual a diferença do pós-print, versão do autor e o pós-print, PDF da Revista?</a></h5>
  <h5><a href="#armazenamentopre">No armazenamento da versão pré-print, qual é o arquivo que é armazenado?</a></h5>
  <h5><a href="#armazenadooriginal">Caso seja armazenado o arquivo original(enviado pelos autores), quem terá acesso a esse arquivo?</a></h5>
  <h5><a href="#vantagemarmazenamento">Qual é a vantagem de permitir o armazenamento da versão pré-print além da pós-print?</a></h5>
  <h5><a href="#editoracentralize">É possível que uma editora centralize todos os registros de suas revistas?</a></h5>
  <h5><a href="#necessariocadastramento">O que é necessário para o cadastramento?</a></h5>
  <h5><a href="#vigencia">Tem vigência de permanência e custo para participação e permanência?</a></h5>
  <h5><a href="#"></a></h5>
  <h5>&nbsp;</h5>
 
<h2><a name="oqdiadorim"><strong>O que é Diadorim?</strong></a></h2>
<p>O Diadorim é um diretório de informações da política editorial das Revistas científicas brasileiras sobre o armazenamento dos artigos das Revistas Científicas Brasileiras em Repositórios Institucionais de Acesso Aberto (RI).</p>

<h2><a name="servediadorim"><strong>Para que serve o Diadorim?</strong></a></h2>
<p>O Diadorim serve para localizar informações sobre a política editorial das Revistas Científicas Brasileiras sobre a permissão para o armazenamento de artigos em repositórios institucionais. É um serviço que serve para os autores, editores das Revistas e para os gestores de repositórios institucionais.</p>
<h3>>> Para os autores:</h3>
<p>Serve para que os autores saibam se a Revista em que pretendem publicar suas pesquisas permite o armazenamento de uma cópia de seu artigo em repositórios institucionais. Desta forma, os autores podem selecionar uma Revista Científica que atenda as suas necessidades específicas.</p>
<h3>>> Para os editores:</h3>
<p>Serve para que os editores informem ou estabeleçam a política editorial de suas Revistas sobre o armazenamento dos artigos em repositórios institucionais, suas condições de acesso e de uso. Divulgando sua política editorial sobre o armazenamento, acesso e uso dos artigos no contexto do acesso aberto, a possibilidade de cumprimento do acordo estabelecido entre autores e editores torna-se mais fácil de ser respeitado, uma vez que se torna mais conhecido.</p>
<h3>>> Para os gestores dos RI:</h3>
<p>Serve para que os gestores dos repositórios institucionais saibam se a Editora que publicou determinado artigo permite que este artigo seja armazenado em um RI e quais são as condições de armazenamento, permissões de acesso e uso.</p>

<h2><a name="cadastrarpolitica"><strong>Por que é importante para o editor cadastrar a politica editorial da sua Revista no Diadorim?</strong></a></h2>
<p>Porque ao cadastrar a política editorial sobre o Acesso Aberto de sua Revista os editores tornam mais visíveis a permissão e as condições para o armazenamento dos artigos em RI de Acesso Aberto. Tornar estas informações mais visíveis favorece que seja respeitado, pelos RI, o acordo estabelecido entre os autores e os editores.</p>

<h2><a name="sistemadecores"><strong>Como funciona o sistema de cores?</strong></a></h2>
<p>O sistema de cores funciona para categorizar as políticas editorias segundo a permissão de armazenamento dos artigos em RI. Existem quatro categorias para as permissões, são elas:</p>
<p><a><strong>Verde: </strong>Permite o armazenamento das versões pré-print e pós-print de um artigo
Nesta categoria estão as Revistas que permitem que os RI armazenem cópia dos seus artigos, tanto a versão pré-print (versão do autor – manuscrito digital) como a versão pós-print (versão de publicação do artigo, ou seja, versão avaliada pelos pares e corrigida pelos autores e o PDF da Revista).</a></p>
<p><a><strong>Azul: </strong>Permite o armazenamento da versão pós-print de um artigo
Nesta categoria estão as Revistas que permitem que os RI armazenem cópia dos seus artigos, somente na versão pós-print (versão de publicação do artigo, ou seja, versão avaliada pelos pares e corrigida pelos autores e o PDF da Revista).</a></p>
<p><a><strong>Amarela: </strong>Permite o armazenamento da versão pré-print de um artigo
Nesta categoria estão as Revistas que permitem que os RI armazenem cópia dos seus artigos, somente na versão pré-print (versão tal como submetida pelo autor – manuscrito digital).</a></p>
<p><a><strong>Branca: </strong>Não permite o armazenamento
Nesta categoria estão as Revistas não permitem o armazenamento em RI dos artigos.</a></p>

<h2><a name="pqsistemadecores"><strong>Por que o Diadorim usa este sistema de cores para cetegorizar as politicas?</strong></a></h2>
<p>Porque este é o sistema mais utilizado internacionalmente para categorizar as políticas editorias sobre o Acesso Aberto das Revistas Científicas. O sistema foi criado pelo diretório Sherpa/Romeo1, que é um serviço similar ao Diadorim, mas tem o foco na região européia. Assim como o Diadorim e o Sherpa/Romeo existem outros diretórios para as políticas editorais sobre o Acesso Aberto de Revistas Científicas. A exemplo destas outras iniciativas Portugal desenvolveu o serviço Blimunda2 e a Espanha o diretório Dulcinea3.</p>

<h2><a name="pqdiadorim"><strong>Curiosidade: Por que o nome Diadorim?</strong></a></h2>
<p>Porque assim como os outros diretórios para a mesma finalidade, o Diadorim homenageia uma grande obra da literatura brasileira. Diadorim é o nome da personagem do livro Grande Sertão Veredas de Guimarães Rosa.</p>

<h2><a name="visualizo"><strong>Como visualizo as Revistas cadastradas?</strong></a></h2>
<p>Para visualizar as Revistas que estão cadastradas, basta acessar a página http://diadorim.ibict.br/ e navegar pelo diretório. O diretório disponibiliza listas com todas as Revistas e Editoras cadastradas e sistemas de busca por qualquer palavra do nome da Revista ou da Editora e pelas permissões concedidas pelas Revistas. Mais informações sobre como realizar uma pesquisa no diretório estão disponíveis no link Ajuda4.</p>

<h2><a name="cadastrorevista"><strong>Como cadastro minha Revista?</strong></a></h2>
<p>Para cadastrar a Revista é necessário acessar a página http://diadorim.ibict.br/, cadastrar o editor responsável pela Revista e depois responder um formulário de 14 questões informando as permissões e condições estabelecidas para a Revista. Mais informações sobre este processo estão disponíveis no » Guia para o cadastro5.</p>

<h2><a name="qualquerrevista"><strong>Qualquer Revista pode se cadastrar?</strong></a></h2>
<p>Não, somente as Revistas Científicas publicadas no Brasil. Dentre as Revistas Científicas Brasileiras qualquer uma pode se cadastrar, independente da área de conhecimento. No entanto, todo cadastro é sujeito a aprovação.</p>

<h2><a name="revistaestrangeiras"><strong>E as Revistas estrangeiras?</strong></a></h2>
<p>Boa parte das Revistas Científicas estrangeiras está cadastrada nos outros diretórios de política editorial sobre Acesso Aberto, citados anteriormente6. Para consultá-las basta acessar a página destes diretórios.
O Diadorim está desenvolvendo um projeto de parceria com o Sherpa/Romeo para que a pesquisa das Revistas Científicas estrangeiras cadastradas no Sherpa/Romeo possa ser feita pelo próprio portal do Diadorim.</p>

<h2><a name="aposcadastro"><strong>O que acontece após o cadastro?</strong></a></h2>
<p>Após o cadastro, as informações da política editorial da Revista cadastrada ficam registradas no Diretório e disponíveis para qualquer pessoa acessar no portal Diadorim. Futuramente, os dados das Revistas Científicas brasileiras serão enviados também para o diretório Sherpa/Romeo e estarão visíveis também neste diretório internacional.
Concluído o cadastro cada Revista recebe, por e-mail, um link identificador do registro no diretório que serve para a Revista citar sua política editorial sobre o Acesso Aberto.</p>

<h2><a name="informacoesregistro"><strong>Como altero as informações do registro?</strong></a></h2>
<p>Para alterar alguma informação do registro da Revista entre em contato com a Equipe Diadorim pelo e-mail diadorim@ibict.br ou pelo telefone: (61) 3217-6449. Vale ressaltar que as informações registradas são disponibilizadas pelos próprios editores e que cabe a eles informar sobre as alterações nas políticas para que o registro seja atualizado.</p>

<h2><a name="acessoaberto"><strong>O que é Acesso Aberto?</strong></a></h2>
<p>Acesso Aberto é o acesso à informação científica que está em formato digital livre de custos e das restrições de acesso. As iniciativas pelo Acesso Aberto à informação científica são resultados de uma reivindicação dos próprios pesquisadores, que a partir dos anos 90, vêem pensando formas de tornar a comunicação científica mais eficiente e dinâmica.</p>

<h2><a name="aconteceacesso"><strong>Como acontece o Acesso Aberto à informação científica?</strong></a></h2>
<p>Atualmente, consideram-se duas estratégias para alcançar o Acesso Aberto à informação científica. Um delas, a chamada via dourada, se dá por meio da disponibilização das próprias Revistas dos artigos publicados. Já a outra estratégia, também conhecida como via verde, diz respeito a disponibilização da informação científica por meio dos repositórios digitais de informação científica.</p>

<h2><a name="repositoriosdigitais"><strong>O que são repositórios digitais de informação científica?</strong></a></h2>
<p>Repositórios digitais são bases de dados onde são armazenadas e geridas informações científicas. Existem dois tipos de repositórios digitais de informação científica:
1. Repositórios temáticos – são bases de dados de informação científica voltadas para o armazenamento e divulgação da produção intelectual de determinadas áreas de conhecimento. Normalmente são criadas e mantidas por conselhos e associações específicas;
2. Repositórios institucionais (RI) – são bases de dados de informação científica, criadas e mantidas por instituições de ensino e pesquisa para preservação e disseminação da produção intelectual de seus membros e colaboradores.</p>

<h2><a name="posprint"><strong>Versão pós-print refere-se somente à versão final das revistas impressas, ou inclui a versão definitiva no caso das revistas somente eletrônicas?</strong></a></h2>
<p>A versão pós-print refere-se à versão final da revista, tanto a imprensa quanto à eletrônica. Os artigos das revistas impressas, normalmente, são digitalizados para serem depositados nos repositórios.</p>

<h2><a name="diferencapos"><strong>Qual a diferença do pós-print, versão do autor e o pós-print, PDF da Revista?</strong></a></h2>
<p>O pós-print corresponde a versão do trabalho submetido pelo autor, já corrigido e publicado. A versão do autor é o documento do autor, já alterado pelas correções sugeridas pelos avaliadores, mas sem as edições de formatação da revista. Já o PDF da Revista é uma cópia do artigo tal como ele foi publicado.</p>

<h2><a name="armazenamentopre"><strong>No armazenamento da versão pré-print, qual é o arquivo que é armazenado?<</strong></a></h2>
<p>Quando a Editora concede o direito para o armazenamento somente da versão pré-print, os gestores dos repositórios devem entrar em contato com o autor e solicitar a versão do autor que foi aceita para a publicação. Esta versão corresponde a versão que foi enviada pelo autor à revista e que recebeu o aceite. Quando armazenada esta versão, deverá ser informada em qual revista o artigo foi publicado.</p>

<h2><a name="armazenadooriginal"><strong>Caso seja armazenado o arquivo original(enviado pelos autores), quem terá acesso a esse arquivo?</strong></a></h2>
<p>Todos os arquivos armazenados nos repositórios institucionais, caso não tenham sido embargados, são de livre acesso para qualquer pessoa, mesmo sendo a versão pré-print (versão do autor, aceita para a publicação). Para ser embargado e restringir o acesso a algum artigo, a editora deve informar que o armazenamento só pode ser feito sobre a condição de embargo e determinar o tempo deste embargo.</p>

<h2><a name="vantagemarmazenamento"><strong>Qual é a vantagem de permitir o armazenamento da versão pré-print além da pós-print?</strong></a></h2>
<p>A vantagem de permitir o armazenamento da versão pré-print, além da pós-print, é expandir as possibilidades de depósito de determinado artigo e com isto aumentar sua visibilidade. É importante ressaltar que os artigos na versão pré-print devem fazer referência à revista que o publicou.</p>

<h2><a name="editoracentralize"><strong>É possível que uma editora centralize todos os registros de suas revistas?</strong></a></h2>
<p>Sim, é possível. Isto pode ser feito por meio de um cadastro único da Editora, que poderá cadastrar todas as suas revistas. Ao criar sua conta no Diadorim, a Editora passa a possuir uma área pessoal, onde podem ser realizados quantos cadastros de revistas forem necessário, como mostrado na figura a seguir. Outra medida recomendável para que o contato, inclusive dos usuários das informações, seja centralizado e cadastrar o mesmo e-mail e telefone em todos os registros das Revistas.</p>

<h2><a name="necessariocadastramento"><strong>O que é necessário para o cadastramento?</strong></a></h2>
<p>Para se cadastrar no Diadorim é necessário ser revistas de conteúdo científico e ser publicada no Brasil. Qualquer revista que cumpra essas condições pode se cadastrar no diretório. Para tanto, basta acessar a página do Diadorim <http://diadorim.ibict.br/>, clicar em Cadastrar/Editar Política, na página que será aberta clicar em Clique aqui para se cadastrar. e continuar o processo. Mais informações de como realizar esses passos estão disponíveis no » Guia para o cadastro . Envio-lhe em anexo e está disponível no diretório na página Documentos Úteis. Qualquer dúvida ou problema neste processo pode ser comunicado por meio deste e-mail <diadorim@ibict.br>.</p>

<h2><a name="vigencia"><strong>Tem vigência de permanência e custo para participação e permanência?</strong></a></h2>
<p>Não existe um tempo limite de permanência no Diadorim. Este é um serviço, de caráter permanente oferecido pelo Instituto Brasileiro de Informação em Ciência e Tecnologia (Ibict) que tem o objetivo de auxiliar, com informações, os
12
gestores de RI, os autores e as editoras científicas. Nesse sentido o serviço não apresenta custo de participação nem de permanência.</p>

<h2><a name=""><strong></strong></a></h2>

<p><a name=""></a><strong></strong> </p>

</dspace:layout>
