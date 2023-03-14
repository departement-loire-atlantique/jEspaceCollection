<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.AutocompleteThesaurus"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.KeepeekApiEndPoint"%>
<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@page import="com.jalios.jcms.handler.QueryHandler"%><%
%><%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%><%
%><%@page import="com.google.gson.JsonObject"%><%
%><%@page import="com.google.gson.JsonArray"%>
<%-- jcore/autocomplete/accategory.jsp --%><%

request.setAttribute("inFO", Boolean.TRUE);

%><%@ include file='/jcore/doInitPage.jspf' %><%
response.setContentType("application/json");

JsonArray propositions = new JsonArray();

// acFieldText.jsp?filtre=institution__departement:94&q=fdfs

String textSearch = getUntrustedStringParameter("q","").trim();
textSearch = JcmsUtil.escapeHtml(textSearch);

String idCat = getStringParameter("filtre","", ".*");
Category catRoot = channel.getCategory(idCat);

TreeSet<Category> resultCollection = new TreeSet<>(Category.getNameComparator(userLang));
DataSelector selector = new Category.NameSelector(textSearch, userLang, true);

if (Util.notEmpty(catRoot)) {
    resultCollection.addAll(catRoot.getDescendantSet());
}

TreeSet<Category> filteredResultCollection = new TreeSet<>(Category.getNameComparator(userLang));

// Filter the result -> skip categories according to the following conditions: 
// - not matched by the DataSelector, 
// - not selectable,
for(Category itCategory : resultCollection) {
  
  if (!selector.isSelected(itCategory)) { continue; }
  if (!itCategory.isSelectable()) { continue; }
  if (Util.isEmpty(itCategory.getDescription())) { continue; }
  if (Util.isEmpty(itCategory.getSynonyms())) { continue; }

  filteredResultCollection.add(itCategory);
}

if (Util.notEmpty(filteredResultCollection)) {
//     AutocompleteThesaurus result = KeepeekApiEndPoint.getAutocompleteThesaurus(filtreSplit[1], textSearch);
//     if (result != null && result.getEmbedded() != null && result.getEmbedded().getThesaurus() != null) {
        filteredResultCollection.forEach(itCat -> {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("id", itCat.getId());
            jsonObj.addProperty("value", itCat.getName());
            
            propositions.add(jsonObj);
        });
//     }
}
%><% 
%><%= propositions.toString() %>