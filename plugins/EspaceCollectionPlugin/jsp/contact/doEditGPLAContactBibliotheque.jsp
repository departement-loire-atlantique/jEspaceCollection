<%-- This file has been automatically generated. --%>
<%--
  @Summary: GPLAContactBibliotheque content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditGPLAContactBibliothequeHandler formHandler = (EditGPLAContactBibliothequeHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.GPLAContactBibliotheque.class);
%>

<p><%= glp("jcmsplugin.espaceCollection.contact.subtitle") %></p>
<p><%= glp("jcmsplugin.socle.facette.champs-obligatoires") %></p>

<ul class="ds44-list grid-12 form-margin">
<%-- Name ------------------------------------------------------------ --%>
<% String nomLabel = glp("jcmsplugin.socle.nom"); %>
<li class="col-6 ds44-minTiny-margin-r">
    <div class="ds44-form__container">
        <div class="ds44-posRel">
            <label for="form-element-nom-bibliotheque" class="ds44-formLabel">
              <span class="ds44-labelTypePlaceholder"><span><%= nomLabel %><sup aria-hidden="true">*</sup></span></span>
            </label>
            <input type="text" id="form-element-nom-bibliotheque" name="nomBibliotheque"
                class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", nomLabel) %>"
                required autocomplete="family-name">
            <button class="ds44-reset" type="button">
                <i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", nomLabel) %></span>
            </button>
        </div>
    </div>
</li>
 
<%-- Prenom ------------------------------------------------------------ --%>
<% String prenomLabel = glp("jcmsplugin.socle.prenom"); %>
<li class="col-6 ds44-minTiny-margin-l">
    <div class="ds44-form__container">
        <div class="ds44-posRel">
            <label for="form-element-prenom-bibliotheque" class="ds44-formLabel">
              <span class="ds44-labelTypePlaceholder"><span><%= prenomLabel %><sup aria-hidden="true">*</sup></span></span>
            </label>
            <input type="text" id="form-element-prenom-bibliotheque" name="prenomBibliotheque" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", prenomLabel) %>"
                required autocomplete="given-name">
            <button class="ds44-reset" type="button">
                <i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", prenomLabel) %></span>
            </button>
        </div>
    </div>
</li>
 
<%-- OrganismeinstitutionDeRattac ------------------------------------------------------------ --%>
<% String orgaLabel = glp("jcmsplugin.espaceCollection.contact.champs.orga"); %>
<li class="col-12">
    <div class="ds44-form__container">
        <div class="ds44-posRel">
            <label for="form-element-orga-bibliotheque" class="ds44-formLabel">
              <span class="ds44-labelTypePlaceholder"><span><%= orgaLabel %></span></span>
            </label>
            <input type="text" id="form-element-orga-bibliotheque" name="orgaBibliotheque" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", orgaLabel) %>">
            <button class="ds44-reset" type="button">
                <i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", orgaLabel) %></span>
            </button>
        </div>
    </div>
</li>
 
<%-- Courriel ------------------------------------------------------------ --%>
<% String mailLabel = glp("jcmsplugin.socle.mail"); %>
<li class="col-12">
    <div class="ds44-form__container">
        <div class="ds44-posRel">
            <label for="form-element-mail-bibliotheque" class="ds44-formLabel">
                <span class="ds44-labelTypePlaceholder"><span><%= mailLabel %><sup aria-hidden="true">*</sup></span></span>
            </label>
            <input type="email" id="form-element-mail-bibliotheque" name="mailBibliotheque" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", mailLabel) %>"
                required autocomplete="email" aria-describedby="explanation-form-element-mail-bibliotheque">
            <button class="ds44-reset" type="button">
                <i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", mailLabel) %></span>
            </button>
        </div>
        <div class="ds44-field-information" aria-live="polite">
            <ul class="ds44-field-information-list ds44-list">
                <li id="explanation-form-element-mail-bibliotheque" class="ds44-field-information-explanation"><%= glp("jcmsplugin.socle.form.exemple.email") %></li>
            </ul>
        </div>
    </div>
</li>
 
<%-- TypeDeRecherche ------------------------------------------------------------ --%>
<% String rechercheLabel = glp("jcmsplugin.espaceCollection.contact.champs.recherche"); %>
<li class="col-12">
  <div class="ds44-form__container">
    <div class="ds44-select__shape ds44-inpLarge">
        <p class="ds44-selectLabel" aria-hidden="true"><%= rechercheLabel %><sup aria-hidden="true">*</sup></p>
        <div id="form-element-recherche-bibliotheque" data-name="form-element-recherche-bibliotheque" class="ds44-js-select-standard ds44-selectDisplay"  data-required="true"></div>
        <button type="button" id="button-form-element-recherche-bibliotheque" class="ds44-btnIco ds44-posAbs ds44-posRi ds44-btnOpen" aria-expanded="false" title="Select simple large - obligatoire"  >
          <i class="icon icon-down icon--sizeXL" aria-hidden="true"></i>
          <span id="button-message-form-element-recherche-bibliotheque" class="visually-hidden"><%= rechercheLabel %></span>
        </button>
        <button class="ds44-reset" type="button">
          <i class="icon icon-cross icon--sizeXL" aria-hidden="true"></i>
          <span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", rechercheLabel) %></span>
        </button>

    </div>
    <div class="ds44-select-container hidden">
        <div class="ds44-listSelect">
            <ul class="ds44-list" role="listbox" id="listbox-form-element-recherche-bibliotheque" aria-labelledby="button-message-form-element-recherche-bibliotheque"  aria-required="true">
                <li class="ds44-select-list_elem" data-value="1" tabindex="0" role="option">
                    <%= glp("jcmsplugin.espaceCollection.contact.champs.recherche.opt1") %>
                </li>
                <li class="ds44-select-list_elem" data-value="2" tabindex="0" role="option">
                    <%= glp("jcmsplugin.espaceCollection.contact.champs.recherche.opt1") %>
                </li>
                <li class="ds44-select-list_elem" data-value="3" tabindex="0" role="option">
                    <%= glp("jcmsplugin.espaceCollection.contact.champs.recherche.opt3") %>
                </li>
                <li class="ds44-select-list_elem" data-value="4" tabindex="0" role="option">
                    <%= glp("jcmsplugin.espaceCollection.contact.champs.recherche.opt4") %>
                </li>
            </ul>
        </div>
    </div>
  </div>
</li>
 
<%-- ObjetDeLaDemande ------------------------------------------------------------ --%>
<% String objetLabel = glp("jcmsplugin.espaceCollection.contact.champs.objet"); %>
<li class="col-12">
    <div class="ds44-form__container">
        <div class="ds44-posRel">
            <label for="form-element-objet-bibliotheque" class="ds44-formLabel">
              <span class="ds44-labelTypePlaceholder"><span><%= objetLabel %><sup aria-hidden="true">*</sup></span></span>
            </label>
            <input type="text" id="form-element-objet-bibliotheque" name="objetEnvisageeBibliotheque" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", objetLabel) %>" required>
            <button class="ds44-reset" type="button">
                <i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", objetLabel) %></span>
            </button>
        </div>
    </div>
</li>
 
<%-- Livre ------------------------------------------------------------ --%>
<% String livreLabel = glp("jcmsplugin.espaceCollection.contact.champs.livre"); %>
<li class="col-12">
    <div class="ds44-form__container">
        <div class="ds44-posRel">
            <label for="form-element-livre-bibliotheque" class="ds44-formLabel">
              <span class="ds44-labelTypePlaceholder"><span><%= livreLabel %></span></span>
            </label>
            <input type="text" id="form-element-livre-bibliotheque" name="livreEnvisageeBibliotheque" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", livreLabel) %>">
            <button class="ds44-reset" type="button">
                <i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", livreLabel) %></span>
            </button>
        </div>
    </div>
</li>
 
<%-- PeriodiqueOuRevue ------------------------------------------------------------ --%>
<% String periodiqueLabel = glp("jcmsplugin.espaceCollection.contact.champs.periodique"); %>
<li class="col-12">
    <div class="ds44-form__container">
        <div class="ds44-posRel">
            <label for="form-element-periodique-bibliotheque" class="ds44-formLabel">
              <span class="ds44-labelTypePlaceholder"><span><%= periodiqueLabel %></span></span>
            </label>
            <input type="text" id="form-element-periodique-bibliotheque" name="periodiqueEnvisageeBibliotheque" class="ds44-inpStd" title="<%= glp("jcmsplugin.socle.facette.champ-obligatoire.title", periodiqueLabel) %>">
            <button class="ds44-reset" type="button">
                <i class="icon icon-cross icon--sizeL" aria-hidden="true"></i><span class="visually-hidden"><%= glp("jcmsplugin.socle.facette.effacer-contenu-champ", periodiqueLabel) %></span>
            </button>
        </div>
    </div>
</li>

</ul>
 
<p class="ds44-mb2">
  <input class="checkbox-pos" type="checkbox" onchange="document.getElementById('formConditionsValiderBibliotheque').disabled = !this.checked;">
  <%=glp("jcmsplugin.espaceCollection.contact.conditions-utilisation.lu")%>
  <a><%=glp("jcmsplugin.espaceCollection.contact.conditions-utilisation.conditions")%></a>
</p>

<p class="ds44-mb2">
<%= glp("jcmsplugin.espaceCollection.contact.reglementation") %>
<a href="https://www.cnil.fr" target="blank">www.cnil.fr</a>).
</p>

<button 
    id="formConditionsValiderBibliotheque"
    class="jcms-js-submit ds44-btnStd ds44-btn--invert ds44-bntALeft"
    title="Valider l'envoi de votre demande" 
    disabled>
    <span class="ds44-btnInnerText"><%= glp("jcmsplugin.socle.valider") %></span><i
        class="icon icon-long-arrow-right" aria-hidden="true"></i>
</button>
 

<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("GPLAContactBibliotheque.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 1sw4RrE1rOQuSbDZbDaIOQ== --%>