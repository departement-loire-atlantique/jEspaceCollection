<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%><%

PortletJsp obj = (PortletJsp)portlet; 
%>

<section class="ds44-container-large">
	<ds:titleNoImage title="<%= obj.getTitle(userLang) %>" breadcrumb="true" ></ds:titleNoImage>

  <section class="ds44-ongletsContainer">
    <div class="js-tabs ds44-tabs" data-existing-hx="h2" data-tabs-prefix-class="ds44" id="onglets">
        <nav role="navigation" aria-label="xxx" id="yyy" class="ds44-flex-container ds44-fg1 ds44-navOnglets ds44-theme ds44-hiddenPrint">
            <ul class="ds44-tabs__list ds44-fg1 ds44-flex-container ds44-list js-tabs" id="tabs">
                <li class="ds44-tabs__item ds44-fg1" id="tabs__1">
                    <a id="label_id_first" href="#id_first" class="js-tablist__link ds44-tabs__link" aria-current="true"><%= glp("jcmsplugin.espaceCollection.contact.onglet.phototheque")%></a>
                </li>
                <li class="ds44-tabs__item ds44-fg1" id="tabs__2">
                    <a id="label_id_second" href="#id_second" class="js-tablist__link ds44-tabs__link" aria-disabled="true"><%= glp("jcmsplugin.espaceCollection.contact.onglet.documentation")%></a>
                </li>
                <li class="ds44-tabs__item ds44-fg1" id="tabs__3">
                    <a id="label_id_third" href="#id_third" class="js-tablist__link ds44-tabs__link" aria-disabled="true"><%= glp("jcmsplugin.espaceCollection.contact.onglet.bibliotheque")%></a>
                </li>
                <li class="ds44-tabs__item ds44-fg1" id="tabs__4">
                    <a id="label_id_fourth" href="#id_fourth" class="js-tablist__link ds44-tabs__link" aria-disabled="true"><%= glp("jcmsplugin.espaceCollection.contact.onglet.conservation")%></a>
                </li>
            </ul>
        </nav>

        <div id="id_first" class="js-tabcontent ds44-tabs__content ds44-inner-container ds44-xl-margin-tb" style='display:none'>
            <a name="onglet-1" id="onglet-1"></a>
            <h2 class="visually-hidden" tabindex="-1">1er onglet - <%= glp("jcmsplugin.espaceCollection.contact.onglet.phototheque")%></h2>
            <p class="ds44-box-heading ds44-mb-std" role="heading" aria-level="2"><%=  glp("jcmsplugin.espaceCollection.contact.title.phototheque") %></p>
            <jsp:include page="editFormGPLAContact.jsp" />
            <p class="ds44-keyboard-show"><a href="#label_id_first">Revenir au premier onglet</a></p>
        </div>

        <div id="id_second" class="js-tabcontent ds44-tabs__content ds44-inner-container ds44-xl-margin-tb" style='display:none'>
            <a name="onglet-2" id="onglet-2"></a>
            <h2 class="visually-hidden" tabindex="-1">2e onglet - <%= glp("jcmsplugin.espaceCollection.contact.onglet.documentation")%></h2>
            <p class="ds44-box-heading ds44-mb-std" role="heading" aria-level="2"><%=  glp("jcmsplugin.espaceCollection.contact.title.documentation") %></p>
            <jsp:include page="editFormGPLAContactDocumentation.jsp" /> 
            <p class="ds44-keyboard-show"><a href="#label_id_second">Revenir au deuxième onglet</a></p>
        </div>

        <div id="id_third" class="js-tabcontent ds44-tabs__content ds44-inner-container ds44-xl-margin-tb" style='display:none'>
            <a name="onglet-3" id="onglet-3"></a>
            <h2 class="visually-hidden" tabindex="-1">3e onglet - <%= glp("jcmsplugin.espaceCollection.contact.onglet.bibliotheque")%></h2>
            <p class="ds44-box-heading ds44-mb-std" role="heading" aria-level="2"><%=  glp("jcmsplugin.espaceCollection.contact.title.bibliotheque") %></p>
            <jsp:include page="editFormGPLAContactBibliotheque.jsp" />
            <p class="ds44-keyboard-show"><a href="#label_id_third">Revenir au troisième onglet</a></p>
        </div>

        <div id="id_fourth" class="js-tabcontent ds44-tabs__content ds44-inner-container ds44-xl-margin-tb" style='display:none'>
            <a name="onglet-4" id="onglet-4"></a>
            <h2 class="visually-hidden" tabindex="-1">4e onglet - <%= glp("jcmsplugin.espaceCollection.contact.onglet.conservation")%></h2>
            <p class="ds44-box-heading ds44-mb-std" role="heading" aria-level="2"><%=  glp("jcmsplugin.espaceCollection.contact.title.conservation") %></p>
            <jsp:include page="editFormGPLAContactConservation.jsp" />
            <p class="ds44-keyboard-show"><a href="#label_id_fourth">Revenir au quatrième onglet</a></p>
        </div>
      </div>
    </div>
  </section>
</section>