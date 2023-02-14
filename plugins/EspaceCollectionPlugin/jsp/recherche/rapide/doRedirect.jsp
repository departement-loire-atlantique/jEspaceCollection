<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%

String recherche = "jcms/navigation/recherche-generale/por_5166";
String rechrecheAv = "jcms/navigation/recherche-avancee/por_7160";

String typeRecherche = Util.getString(request.getParameter("op"), "recherche");
String redirectUrl = "recherche".equalsIgnoreCase(typeRecherche) ? recherche : rechrecheAv;

String url = URLUtils.buildUrl(redirectUrl, request.getParameterMap());

//Fix error HTTPS infra (mixed content). Passe en url absolue
if(url.indexOf("http") != 0) {
    url = channel.getUrl() + url;
}

sendRedirect(url);
%>
