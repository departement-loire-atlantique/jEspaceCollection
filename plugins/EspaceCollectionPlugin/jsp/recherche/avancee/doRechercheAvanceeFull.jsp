<%@page import="fr.digiwin.module.espacecollection.keepeek.search.adv.EModifier"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.search.adv.KeepeekAdvSearchQuery"%>
<%@page import="fr.digiwin.module.espacecollection.CollectionUtil"%>
<%@ page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%@ include
    file='/plugins/SoclePlugin/jsp/facettes/commonParamsFacettes.jspf'%>
<%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%>
<%
PortletJsp obj = (PortletJsp) portlet;

isInRechercheFacette = true;

// SEO : bloque l'indexation des pages de résultats
if (isInRechercheFacette) {
    request.setAttribute("noindex", true);

    // Analytics : personnalisation du titre de page
    String pubTitle = "";
    if (Util.notEmpty(request.getParameter("pubId[value]"))) {
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

// Filtre posible
List<Category> filters = CollectionUtil.finAllSubRootSearch();
%>


<div class="ds44-container-large rechercheAv">

    <%-- <ds:titleNoBanner title="<%= obj.getTitre(userLang) %>" breadcrumb="true"></ds:titleNoBanner> --%>
    <div class="">
        <div class="ds44--xl-padding-t pbs large-w66 mauto">
            <jalios:if
                predicate='<%=Util.notEmpty(Channel.getChannel().getProperty("jcmsplugin.socle.portlet.filariane.id"))%>'>
                <jalios:include
                    id='<%=Channel.getChannel().getProperty("jcmsplugin.socle.portlet.filariane.id")%>' />
            </jalios:if>
            <h1 class="h2-like mbm mtm" id="titre-recherche"><%=obj.getDisplayTitle(userLang)%></h1>
        </div>

        <div class="ds44-inner-container ds44--mobile--m-padding-b">
            <header class="ds44--l-padding-b">
                <p class="/*ds44-component-chapo*/ ds44-centeredBlock">
                    <%=obj.getDescription(userLang)%>
                </p>
            </header>
        </div>
    </div>

    <div class="ds44-loader-text visually-hidden" tabindex="-1"
        aria-live="polite"></div>
    <div class="ds44-loader hidden">
        <div class="ds44-loader-body">
            <svg class="ds44-loader-circular" focusable="false"
                aria-hidden="true">
            <circle class="ds44-loader-path" cx="30" cy="30" r="20"
                    fill="none" stroke-width="5" stroke-miterlimit="10"></circle>
        </svg>
        </div>
    </div>


    <div class="ds44-facette">
        <div class="ds44-facette-body">
            <form role="search" method='<%= channel.getBooleanProperty("jcmsplugin.socle.url-rewriting", false) ? "POST" : "GET" %>' data-is-ajax="true" data-auto-load="true" action="plugins/EspaceCollectionPlugin/jsp/recherche/avancee/displayResultDecodeParamsAV.jsp">
                <div class="ds44-facetteContainer ds44-bgDark">
                    <%-- Ligne --%>
                    <div class="ds44-flex-container ds44--l-padding-b ds44-medium-flex-col" data-duplicate-line>
                        <%-- Field 1 --%>
                        <div class="ds44-fieldContainer ds44-fg1 ds44-fieldContainer--select ds44-js-linked-fields" data-linked-fields-content=".ds44-js-linked-fields-content-__LINE_DUPLICATE_ID__">
                            <div class="ds44-form__container">
                                <div class="ds44-select__shape ds44-inpStd">
                                    <p class="ds44-selectLabel" aria-hidden="true">Filtre</p>
                                    <div id="form-line-element-filtre" data-name="form-line-element-filtre" class="ds44-js-select-standard ds44-selectDisplay" data-required="true"></div>
                                    <button type="button" id="button-form-line-element-filtre" class="ds44-btnIco ds44-posAbs ds44-posRi ds44-btnOpen" aria-expanded="false">
                                        <i class="icon icon-down icon--sizeL" aria-hidden="true"></i>
                                        <span id="button-message-form-line-element-filtre" class="visually-hidden">Filtre</span>
                                    </button>
                                    <button class="ds44-reset" type="button">
                                        <i class="icon icon-cross icon--sizeL" aria-hidden="true"></i>
                                        <span class="visually-hidden">Effacer le contenu saisi dans le champ : Filtre</span>
                                    </button>
                                </div>
                                <div class="ds44-select-container hidden">
                                    <div class="ds44-listSelect">
                                        <ul class="ds44-list" role="listbox" id="listbox-form-line-element-filtre" aria-labelledby="button-message-form-line-element-filtre" >
                                            <jalios:foreach name="itFilter" type="Category" collection="<%= filters %>">
                                                <li
                                                    class="ds44-select-list_elem"
                                                    data-value="<%= itFilter.getId() %>"
                                                    tabindex="0"
                                                    role="option">
                                                    <%= itFilter.getName(userLang) %>
                                                </li>
                                            </jalios:foreach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- Field 2 --%>
                        <div class="ds44-fieldContainer ds44-fg1 ds44-fieldContainer--select">
                            <div class="ds44-form__container">
                                <div class="ds44-select__shape ds44-inpStd">
                                    <p class="ds44-selectLabel" aria-hidden="true">Modifieur</p>
                                    <div id="form-line-element-modifieur" data-name="form-line-element-modifieur" class="ds44-js-select-standard ds44-selectDisplay" data-required="true"></div>
                                    <button type="button" id="button-form-line-element-modifieur" class="ds44-btnIco ds44-posAbs ds44-posRi ds44-btnOpen" aria-expanded="false">
                                        <i class="icon icon-down icon--sizeL" aria-hidden="true"></i>
                                        <span id="button-message-form-line-element-modifieur" class="visually-hidden">Modifieur</span>
                                    </button>
                                    <button class="ds44-reset" type="button">
                                        <i class="icon icon-cross icon--sizeL" aria-hidden="true"></i>
                                        <span class="visually-hidden">Effacer le contenu saisi dans le champ : Modifieur</span>
                                    </button>
                                </div>
                                <div class="ds44-select-container hidden">
                                    <div class="ds44-listSelect">
                                        <ul class="ds44-list" role="listbox" id="listbox-form-line-element-modifieur" aria-labelledby="button-message-form-line-element-modifieur" >
                                            <jalios:foreach name="itModif" type="EModifier" array="<%= EModifier.values() %>">
                                                <li
                                                    class="ds44-select-list_elem"
                                                    data-value="<%= itModif.name() %>"
                                                    tabindex="0"
                                                    role="option">
                                                    <%= itModif.lbl %>
                                                </li>
                                            </jalios:foreach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- Field 3 --%>
                        <div class="ds44-fieldContainer ds44-fg1 ds44-js-linked-fields-content-__LINE_DUPLICATE_ID__">
                            <%--
                            <div class="ds44-form__container">
                                <div class="ds44-posRel">
                                    <label for="form-line-element-70478" class="ds44-formLabel"><span class="ds44-labelTypePlaceholder"><span>Champ standard</span></span></label>
                                    
                                    <input type="text" id="form-line-element-70478" name="form-line-element-70478" value="" class="ds44-inpStd"      />
                                    
                                    <button class="ds44-reset" type="button"><i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden">Effacer le contenu saisi dans le champ : Champ standard</span></button>
                                
                                </div>
                            </div>
                            data-latence="1000"
                            --%>
                            <ds:facetteAutoCompletion idFormElement='<%= ServletUtil.generateUniqueDOMId(request, glp("jcmsplugin.socle.facette.form-line-element")) %>'
                                name="form-line-element-text"
                                request="<%= request %>"
                                isFacetteObligatoire='<%= true %>'
                                dataUrl='<%= "plugins/EspaceCollectionPlugin/jsp/recherche/avancee/acFieldText.jsp?filtre=$parentValue" %>'
                                label="Une recherche précise, tapez le n° d’inventaire... ou le nom d’une oeuvre."
                                isLarge="<%= false %>"
                                dataMode="select-only"/>
                                <%-- select-only | free-text --%>
                        </div>
                        <%-- Btn --%>
                        <div class="ds44-fieldContainer ds44-small-fg1" data-line-add data-no-duplicate>
                            <button class="ds44-btnStd ds44-green " title="Ajouter une ligne de champs de recherche"><span class="visually-hidden">Ajouter une ligne de champs de recherche</span><i class="icon icon-plus" aria-hidden="true"></i></button>
                        </div>
                        <div class="ds44-fieldContainer ds44-small-fg1" data-line-remove data-no-first-line>
                            <button class="ds44-btnStd ds44-red " title="Supprimer une ligne de champs de recherche"><span class="visually-hidden">Supprimer une ligne de champs de recherche</span><i class="icon icon-minus" aria-hidden="true"></i></button>
                        </div>
                        <%-- END Btn --%>
                    </div><%-- END Ligne --%>
                    <button class="ds44-btnStd ds44-theme ds44-w100 " title="Lancer la recherche"><span class="ds44-btnInnerText">Rechercher</span><i class="icon icon-long-arrow-right" aria-hidden="true"></i></button>
                </div>
            </form>
        </div>
        <div class="ds44-facette-mobile-button ds44-bgDark ds44--l-padding ds44-show-tiny-to-medium ds44-hide-medium">
            <button class="ds44-btnStd ds44-btn--contextual ds44-w100 ds44-js-toggle-search-view">
                <span class="ds44-btnInnerText ds44-facette-mobile-button-collapse">Modifier ou affiner ma recherche</span>
                <span class="ds44-btnInnerText ds44-facette-mobile-button-expand">Masquer ma recherche</span>
            </button>
        </div>
    </div>

    <jalios:if predicate='<%=isInRechercheFacette%>'>


        <div
            class='ds44-flex-container ds44-results ds44-results ds44-results--empty'>
            <div
                class="ds44-listResults ds44-innerBoxContainer ds44-innerBoxContainer--list">
                <div class="ds44-js-results-container">
                    <div class="ds44-js-results-card"
                        data-url="plugins/SoclePlugin/jsp/facettes/displayPub.jsp"
                        aria-hidden="true"></div>
                    <div class="ds44-js-results-list"
                        data-display-mode='<%=true ? "external" : "inline"%>'>
                        <p aria-level="2" role="heading"
                            id="ds44-results-new-search"
                            class="h3-like mbs txtcenter center ds44--3xl-padding-t ds44--3xl-padding-b">
                            <span aria-level="2" role="heading"><%=glp("jcmsplugin.socle.faire.recherche")%></span>
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

<jalios:javascript>
//FormFieldSelectStandardClass

document.querySelectorAll("[name^=filter-]").forEach(element => 
    element.addEventListener('change', (event) => {
      let val = event.value;
      console.log(val);
    })
);

</jalios:javascript>
