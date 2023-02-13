<%@ page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%@ include file='/plugins/SoclePlugin/jsp/facettes/commonParamsFacettes.jspf'%>
<%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%>
<% 

    PortletJsp obj = (PortletJsp)portlet;


    isInRechercheFacette = true;
    
    // SEO : bloque l'indexation des pages de résultats
    if(isInRechercheFacette){
      request.setAttribute("noindex", true);
      
      // Analytics : personnalisation du titre de page
      String pubTitle = "";
      if(Util.notEmpty(request.getParameter("pubId[value]"))){
        Publication pub = channel.getPublication(request.getParameter("pubId[value]"));
        pubTitle = " - " + pub.getTitle();
      }
      jcmsContext.setPageTitle(glp("jcmsplugin.socle.title.recherche-facettes") + pubTitle);
    }
    
//     String query = Util.notEmpty(obj.getQueries()) ? obj.getQueries()[0] : "";
//     request.setAttribute("query", query);
    
//     Boolean hasFonctionsAdditionnelles = obj.getAfficherSelection() || obj.getAfficherPDF() ||  obj.getAfficherCSV();
//     Boolean showFiltres = isInRechercheFacette && Util.notEmpty(obj.getFacettesSecondaires()) || hasFonctionsAdditionnelles;
//     request.setAttribute("showFiltres", showFiltres);
    
    request.setAttribute("rechercheId", obj.getId());
%>


<div class="ds44-container-large">

<%-- <ds:titleNoBanner title="<%= obj.getTitre(userLang) %>" breadcrumb="true"></ds:titleNoBanner> --%>
<div class="">
    <div class="ds44--xl-padding-t pbs large-w66 mauto">
        <jalios:if predicate='<%= Util.notEmpty(Channel.getChannel().getProperty("jcmsplugin.socle.portlet.filariane.id")) %>'>
            <jalios:include id='<%=Channel.getChannel().getProperty("jcmsplugin.socle.portlet.filariane.id") %>'/>
        </jalios:if>
        <h1 class="h2-like mbm mtm" id="titre-recherche"><%= obj.getDisplayTitle(userLang) %></h1>
    </div>
    
    <div class="ds44-inner-container ds44--mobile--m-padding-b">
        <header class="ds44--l-padding-b">
            <p class="/*ds44-component-chapo*/ ds44-centeredBlock">
                <%= obj.getDescription(userLang) %>
            </p>
        </header>
    </div>
</div>

<div class="ds44-loader-text visually-hidden" tabindex="-1" aria-live="polite"></div>
<div class="ds44-loader hidden">
    <div class="ds44-loader-body">
        <svg class="ds44-loader-circular" focusable="false" aria-hidden="true">
            <circle class="ds44-loader-path" cx="30" cy="30" r="20" fill="none" stroke-width="5" stroke-miterlimit="10"></circle>
        </svg>
    </div>
</div>





<div class="ds44-facette">
    <div class="ds44-facette-body">
        
        <% 
        // Url en utilsant le titre de la facette et non le titre du portal général facette
        // Permet d'avoir une url différente par recherche mais l'id reste celui du portal
        
//         Publication portalFacet = channel.getPublication("$jcmsplugin.socle.recherche.facettes.portal");
//         String urlFacet = DescriptiveURLs.getDescriptiveURL(portalFacet, userLocale);
        
//         String descPortal = DescriptiveURLs.cleanDescriptiveURLText(portalFacet.getTitle(userLang), userLocale);
//         String descFacet = DescriptiveURLs.cleanDescriptiveURLText(obj.getTitre(userLang), userLocale);
            
        // Remplace le titre de l'url par le titre de la recherche à facette au lieu du titre du portail
//         String seoUrl = urlFacet.replaceAll(descPortal, descFacet);
        String seoUrl = "#";
        %>

<%--        <form role="search" method='<%= channel.getBooleanProperty("jcmsplugin.socle.url-rewriting", false) ? "POST" : "GET" %>' data-seo-url='<%= channel.getProperty("jcmsplugin.socle.url-rewriting")%>' data-search-url="plugins/SoclePlugin/jsp/facettes/displayParameters.jsp" data-is-ajax='<%= isInRechercheFacette ? "true" : "false" %>' data-auto-load='<%= isInRechercheFacette ? "true" : "false" %>' action='<%= isInRechercheFacette ? "plugins/SoclePlugin/jsp/facettes/displayResultDecodeParams.jsp" : seoUrl + "?boxId=" + obj.getId() %>'> --%>
        <form role="search" method='<%= channel.getBooleanProperty("jcmsplugin.socle.url-rewriting", false) ? "POST" : "GET" %>' data-seo-url='<%= channel.getProperty("jcmsplugin.socle.url-rewriting")%>' data-search-url="plugins/SoclePlugin/jsp/facettes/displayParameters.jsp" data-is-ajax='<%= isInRechercheFacette ? "true" : "false" %>' data-auto-load='<%= isInRechercheFacette ? "true" : "false" %>' action='<%= isInRechercheFacette ? "plugins/EspaceCollectionPlugin/jsp/recherche/displayResultDecodeParams.jsp" : seoUrl + "?boxId=" + obj.getId() %>'>

            <div class="ds44-facetteContainer ds44-bgDark ds44-flex-container ds44-medium-flex-col">
            
                <% request.removeAttribute("isSelectFacette"); %>
        
                <div class="ds44-fieldContainer ds44-small-fg1">
                    <button class='<%= "jcms-js-submit ds44-btnStd ds44-btnStd--large ds44-theme" %>' title='<%= HttpUtil.encodeForHTMLAttribute(glp("jcmsplugin.socle.lancer.recherche")) %>'>
                        <span class="ds44-btnInnerText"><%= glp("jcmsplugin.socle.rechercher") %></span>
                        <i class="icon icon-long-arrow-right" aria-hidden="true"></i>
                    </button>                   
                </div>
        
            </div>
            
<%--             <%@ include file='/plugins/SoclePlugin/types/PortletRechercheFacettes/doSearchHiddenParams.jspf' %> --%>
            <input type="hidden" name='<%= "boxId" + glp("jcmsplugin.socle.facette.form-element") %>' value='<%= obj.getId() %>' data-technical-field />
            <input type="hidden" name='pubId' value='<%= Util.notEmpty(request.getAttribute("publication")) ? ((Publication)request.getAttribute("publication")).getId() : "" %>' data-technical-field />
        
    
            
            <jalios:if predicate='<%= HttpUtil.hasParameter(request, "") %>'>
              <input type="hidden" name="redirectUrl" value="<%= request.getParameter("redirectUrl") %>" data-technical-field />
            </jalios:if>
        </form>
    </div>
    
</div>



<jalios:if predicate='<%= isInRechercheFacette %>'>

    
      <div class='ds44-flex-container ds44-results ds44-results ds44-results--empty'>
          <div class="ds44-listResults ds44-innerBoxContainer ds44-innerBoxContainer--list">
              <div class="ds44-js-results-container">
                  <div class="ds44-js-results-card" data-url="plugins/SoclePlugin/jsp/facettes/displayPub.jsp" aria-hidden="true"></div>
                  <div class="ds44-js-results-list" data-display-mode='<%= true ? "external" : "inline" %>'>
                      <p aria-level="2" role="heading" id="ds44-results-new-search" class="h3-like mbs txtcenter center ds44--3xl-padding-t ds44--3xl-padding-b">
                        <span aria-level="2" role="heading"><%= glp("jcmsplugin.socle.faire.recherche") %></span>
                      </p>            
                  </div>
              </div>
          </div>
          
          
      </div>

</jalios:if>

</div>

<% 
request.removeAttribute("rechercheId");
%>

