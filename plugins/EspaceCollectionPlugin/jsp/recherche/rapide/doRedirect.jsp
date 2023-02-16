<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%
String recherche = "jcms/navigation/recherche-generale/por_5166";
String rechrecheAv = "jcms/navigation/recherche-avancee/por_7160";

String textQuery = Util.getString(request.getParameter("textRechercehRapide[text]"), "");
String[] textQueryArray = new String[]{textQuery};
String textQueryUrl = "";

String typeRecherche = Util.getString(request.getParameter("op[value]"), "recherche");
String redirectUrl = "";

Map<String, String[]> parametersMap = new HashMap<>(request.getParameterMap());
if ("recherche".equalsIgnoreCase(typeRecherche)) {
    redirectUrl = recherche;
    if (Util.notEmpty(textQuery)) {
        // textform-element-por_5166por_5165[value]=aquam&textform-element-por_5166por_5165[text]=aquam
//         textQueryUrl += "#textform-element-por_5166por_5165[value]=" + textQuery
//             + "&textform-element-por_5166por_5165[text]=" + textQuery + "&textform-element-por_5166por_5165[metadata]=";
        parametersMap.put("textform-element-por_5166por_5165[value]", textQueryArray);
        parametersMap.put("textform-element-por_5166por_5165[text]", textQueryArray);
    }
} else {
    redirectUrl = rechrecheAv;
    // TODO
}

String url = URLUtils.buildUrl(redirectUrl, parametersMap);
// url += textQueryUrl;

//Fix error HTTPS infra (mixed content). Passe en url absolue
if (url.indexOf("http") != 0) {
    url = channel.getUrl() + url;
}

sendRedirect(url);
%>
