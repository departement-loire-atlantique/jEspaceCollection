<%@page import="fr.digiwin.module.espacecollection.keepeek.KeepeekConst"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.advSearch.NewAdvSearch"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.search.adv.EModifier"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.search.adv.KeepeekAdvSearchQuery"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.MediaLight"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.KeepeekApiEndPoint"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.SearchResult"%>
<%@page import="fr.cg44.plugin.socle.queryfilter.CategoryFacetUtil"%>
<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@page import="com.jalios.io.IOUtil"%><%
%><%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%><%
%><%@page import="com.google.gson.JsonObject"%><%
%><%@page import="com.google.gson.JsonArray"%><%

request.setAttribute("inFO", Boolean.TRUE);

%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

response.setContentType("application/json");

// PortletRechercheFacettes  boxTmp = (PortletRechercheFacettes) (channel.getPublication(request.getParameter("boxId"))).clone();  
// PortletRechercheFacettes box = new PortletRechercheFacettes(boxTmp);

// if(Util.notEmpty(box.getIdDeLaCategorieTag())) {
//   request.setAttribute("tagRootCatId", box.getIdDeLaCategorieTag());
// }

// Pager
boolean hasPager = true; //box.getPager();
Integer pager = getIntParameter("page", 1);
int maxResult = 20; //box.getMaxResults(); TODO

%><%
String oldIdAdvSearch = Util.getString(session.getAttribute(KeepeekConst.SESSION_ATR_ADV_SEARCH_ID), "");
String idAdvSearch = "";

if (pager > 1 && Util.notEmpty(oldIdAdvSearch)) {
    idAdvSearch = oldIdAdvSearch;
} else {
    int nbL = getIntParameter("nbL", 1);

    // Prefix
    String sep = "-";
    String ligne = "L";
    String fieldFilter = "filter";
    String fieldText = "field-text";
    String fieldModifieur = "field-modifieur";

    KeepeekAdvSearchQuery advSearchQuery = new KeepeekAdvSearchQuery();

    for (int l = 1; l <= nbL; l++) {
        String filterVal = getStringParameter(fieldFilter + sep + ligne + l, "", ".*");
        String textVal = getStringParameter(fieldText + sep + ligne + l, "", ".*");
        String modifVal = getStringParameter(fieldModifieur + sep + ligne + l, "", ".*");

        if (Util.notEmpty(filterVal)) {
            String[] filterValSplit = filterVal.split(":");
            if (filterValSplit.length == 2) {
                filterVal = filterValSplit[0];
            } else {
                filterVal = "";
            }
        }

        if (Util.notEmpty(filterVal) && Util.notEmpty(textVal) && Util.notEmpty(modifVal)) {
            advSearchQuery.add(filterVal, EModifier.valueOf(modifVal), textVal);
        }
    }
    if (!advSearchQuery.isEmpty()) {
        NewAdvSearch advSearch = KeepeekApiEndPoint.createAdvancedSearch(advSearchQuery);

        idAdvSearch = advSearch.getId();
    }
}

SearchResult searchResult = null;
List<MediaLight> collection = null;
if (Util.notEmpty(idAdvSearch)) {
    
    searchResult = KeepeekApiEndPoint.advSearchMedia(idAdvSearch, pager, maxResult);

    collection = searchResult.getEmbeddedResult().getMedias();
}
%>

<%

JsonArray jsonArray = new JsonArray();
JsonObject jsonObject = new JsonObject();

// Gestion du pager
if(hasPager) {
  jsonObject.addProperty("page-index", pager);
} else {
  jsonObject.addProperty("max-result", maxResult);
}


jsonObject.addProperty("nb-result", searchResult != null ? searchResult.getTotalCount() : 0);
jsonObject.addProperty("nb-result-per-page", maxResult);

jsonObject.add("result", jsonArray);





// Id unique de la recherche stocké en bdd et généré depuis la jsp displayResultDecodeParams.jsp (null si pas de ré-écriture d'url)
jsonObject.addProperty("id", request.getParameter("searchId"));


session.setAttribute("isSearchFacetLink", true);

%><%

%>

<%-- skip='<%= (pager - 1) * maxResult  %>' --%>
<jalios:foreach collection="<%= collection %>" name="itMediaLight" type="MediaLight" max='<%= maxResult %>' >

    <jalios:buffer name="itPubListGabarit">
        <% request.setAttribute("itMediaLight", itMediaLight); %>
        <jalios:include jsp="/plugins/EspaceCollectionPlugin/jsp/ficheObjet/doFicheObjetTuile.jsp" />
        <%    
    %></jalios:buffer><%
    
    %><%
    JsonObject itJsonObject = new JsonObject();
    
    itJsonObject.addProperty("value", itMediaLight.getTitle());
    itJsonObject.addProperty("id", itMediaLight.getId());
    
    JsonObject itMetaJsonObject = new JsonObject();
    itMetaJsonObject.addProperty("url", "TODO");
    itMetaJsonObject.addProperty("html_list", itPubListGabarit);
    itMetaJsonObject.addProperty("html_marker", itPubListGabarit);
    itJsonObject.add("metadata", itMetaJsonObject);
    
//      jsonArray.add(SocleUtils.publicationToJsonObject(itPub, itPubListGabarit, itPubListGabarit, null));
     jsonArray.add(itJsonObject);
    %><%
                                        
%></jalios:foreach> <%
request.removeAttribute("tagRootCatId");
%><%= jsonObject %>