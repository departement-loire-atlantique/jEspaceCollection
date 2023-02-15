<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.AutocompleteThesaurus"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.KeepeekApiEndPoint"%>
<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@page import="com.jalios.jcms.handler.QueryHandler"%><%
%><%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%><%
%><%@page import="com.google.gson.JsonObject"%><%
%><%@page import="com.google.gson.JsonArray"%><%

request.setAttribute("inFO", Boolean.TRUE);

%><%@ include file='/jcore/doInitPage.jspf' %><%
response.setContentType("application/json");

JsonArray propositions = new JsonArray();

// acFieldText.jsp?filtre=institution__departement:94&q=fdfs

String textSearch = getStringParameter("q", "", ".*");

String filtre = getStringParameter("filtre","", ".*");
String[] filtreSplit = filtre.split(":");

if (filtreSplit.length == 2 && Util.notEmpty(textSearch) && textSearch.length() >= 2) {
    AutocompleteThesaurus result = KeepeekApiEndPoint.getAutocompleteThesaurus(filtreSplit[1], textSearch);
    if (result != null && result.getEmbedded() != null && result.getEmbedded().getThesaurus() != null) {
        result.getEmbedded().getThesaurus().forEach(prop -> {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("id", prop.getId());
            jsonObj.addProperty("value", prop.getTitle());
            
            propositions.add(jsonObj);
        });
    }
}
%><% 
%><%= propositions.toString() %>