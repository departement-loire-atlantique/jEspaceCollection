<%@page import="fr.digiwin.module.espacecollection.keepeek.KeepeekSearchQuery"%>
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

PortletRechercheFacettes  boxTmp = (PortletRechercheFacettes) (channel.getPublication(request.getParameter("boxId"))).clone();  
PortletRechercheFacettes box = new PortletRechercheFacettes(boxTmp);

if(Util.notEmpty(box.getIdDeLaCategorieTag())) {
  request.setAttribute("tagRootCatId", box.getIdDeLaCategorieTag());
}

// Pager
boolean hasPager = box.getPager();
Integer pager = getIntParameter("page", 1);
int maxResult = box.getMaxResults(); 

%><%
// /plugins/SoclePlugin/jsp/facettes/doQueryText.jspf
String text = request.getParameter("text");
if(Util.notEmpty(text) && !text.matches("^\\d*$")){
    text += "*"; // pour rechercher tous les mots débutent par le terme recherché
}

KeepeekSearchQuery searchQuery = new KeepeekSearchQuery();

// /plugins/SoclePlugin/jsp/facettes/doQueryBoolean.jspf
String[] booleanParams = request.getParameterValues("boolean");
// OeuvresIncontournables Avec_Image Vue_3D
if(Util.notEmpty(booleanParams)){
    for (String itBoolParam : booleanParams) {
        if (itBoolParam.equalsIgnoreCase("Vue_3D")) {
            searchQuery.add("tagsInMedia", "52");
        } else if(itBoolParam.equalsIgnoreCase("OeuvresIncontournables")) {
            searchQuery.add("tagsInMedia", "40");
        } else if(itBoolParam.equalsIgnoreCase("Avec_Image")) {
//             searchQuery.add("metaModelType", "40");
        }
    }
}

// String[] cidBranches = request.getParameterValues("cidBranches");
String[] cids = request.getParameterValues("cids");
if (Util.notEmpty(cids)) {
    for (String itCid : cids){
        Category itCat = Channel.getChannel().getCategory(itCid);
        if (Util.notEmpty(itCat) && itCat.canBeReadBy(loggedMember)) {
            String idThesaurus = itCat.getDescription();
            String keyQuery = Util.getFirst(itCat.getSynonyms());
            if (Util.notEmpty(idThesaurus) && Util.notEmpty(keyQuery)) {
                searchQuery.add(keyQuery, idThesaurus);
            }
        }
    }
}

SearchResult searchResult = null;
List<MediaLight> collection = null;
if(Util.notEmpty(text) || !searchQuery.isEmpty()){
    searchResult = KeepeekApiEndPoint.searchMedia(text, searchQuery, pager, maxResult);

    collection = searchResult.getEmbeddedResult().getMedias();
}


// /types/PortletQueryForeach/doQuery.jspf
// /plugins/SoclePlugin/jsp/facettes/doQueryCids.jspf
// /plugins/SoclePlugin/jsp/facettes/doQueryBoolean.jspf
// /plugins/SoclePlugin/jsp/facettes/doQueryGeoloc.jspf
// /types/PortletQueryForeach/doSort.jspf
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
	    <% request.setAttribute("idKeepeek", itMediaLight.getId()+""); %>
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