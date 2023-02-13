<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

if (data == null) {
  return;
}

FicheObjetBaseDeDonnees obj = (FicheObjetBaseDeDonnees) data;
%>
  <section class="ds44-card ds44-js-card ds44-card--contact ds44-box ds44-bgGray ">
      <picture class="ds44-container-imgRatio">
        <%-- image --%>
      </picture>
      
      <div class="ds44-card__section">
        <p class="ds44-cardSelect pa0 ma0">
            <button class="pas" type="button" aria-describedby="cs6" title="Sélectionner Confort service"><i class="icon icon-star-empty" aria-hidden="true"></i><span class="visually-hidden">Sélection</span></button>
        </p>
        <div class="ds44-innerBoxContainer">
            <p role="heading" aria-level="2" class="h4-like ds44-cardTitle">
              <jalios:link data="<%= obj %>" css="ds44-card__globalLink">
                <%=obj.getTitle()%>
              </jalios:link>
            </p>
            <jalios:if predicate="<%= Util.notEmpty(obj.getDateEpoque()) %>">
              <p class="ds44-docListElem ds44-mt-std">
                <i class="icon icon-tag ds44-docListIco" aria-hidden="true">
                <%= obj.getDateEpoque() %>
              </p>
            </jalios:if>
            <jalios:if predicate="<%= Util.notEmpty(obj.getNumeroDinventaire()) %>">
              <p class="ds44-docListElem ds44-mt-std">
                <i class="icon icon-date ds44-docListIco" aria-hidden="true">
                <%= obj.getNumeroDinventaire() %>
              </p>
            </jalios:if>
            <jalios:if predicate="<%= Util.notEmpty(obj.getDomaine(loggedMember)) %>">
              <ul class="ds44-list ds44-list--tag ds44-mt1">
                  <jalios:foreach collection="<%= obj.getDomaine(loggedMember) %>" type="Category" name="itCategory" >
                    <li><% if (itCategory != null) { %><span class="ds44-btnStd ds44-btnStd--tag ds44-btnInnerText"><%= itCategory.getAncestorString(channel.getCategory("fde_5050"), " > ", true, userLang) %></span><% } %></li>
                  </jalios:foreach>
              </ul>
            </jalios:if>
        </div>
        <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
      </div>
  </section>