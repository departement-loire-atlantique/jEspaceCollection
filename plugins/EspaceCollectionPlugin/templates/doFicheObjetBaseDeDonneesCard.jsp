<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

if (data == null) {
  return;
}

FicheObjetBaseDeDonnees obj = (FicheObjetBaseDeDonnees) data;
%>
  <section class="ds44-card ds44-js-card ds44-card--contact ds44-box ds44-darkContext ">
      <picture class="ds44-container-imgRatio">
        <jalios:if predicate="<%= Util.notEmpty(obj.getVisuel()) %>">
            <% CarouselElement image = (CarouselElement)channel.getData(CarouselElement.class, obj.getVisuel().getId()); %>
            <img src="<%= image.getImage() %>" alt="<%= image.getImageLegend() %>" class="ds44-imgRatio"/>
        </jalios:if>
      </picture>
      
      <div class="ds44-card__section">
        <p class="ds44-cardSelect pa0 ma0">
            <button class="pas" type="button" aria-describedby="cs6" title="Sélectionner Confort service"><i class="icon icon-star-empty" aria-hidden="true"></i><span class="visually-hidden">Sélection</span></button>
        </p>
        <div class="ds44-innerBoxContainer">
            <p role="heading" aria-level="2" class="ds44-card__title">
              <jalios:link data="<%= obj %>" css="ds44-card__globalLink">
                <%=obj.getTitle()%>
              </jalios:link>
            </p>
            <jalios:if predicate="<%= Util.notEmpty(obj.getDateEpoque()) %>">
              <p class="ds44-docListElem ds44-mt-std">
                <i class="icon icon-date ds44-docListIco" aria-hidden="true"></i>
                <%= obj.getDateEpoque() %>
              </p>
            </jalios:if>
            <jalios:if predicate="<%= Util.notEmpty(obj.getCollectionneur(loggedMember)) %>">
              <p class="ds44-docListElem ds44-mt-std">
                <i class="icon icon-user ds44-docListIco" aria-hidden="true"></i>
                <jalios:foreach collection="<%= obj.getCollectionneur(loggedMember) %>" type="Category" name="itCategory" >
                    <%= itCategory.getName() %>
                </jalios:foreach>
              </p>
            </jalios:if>
        </div>
        <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
      </div>
  </section>