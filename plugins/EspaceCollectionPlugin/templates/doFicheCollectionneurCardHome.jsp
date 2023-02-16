<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

if (data == null) {
  return;
}

FicheCollectionneur obj = (FicheCollectionneur) data;
%>
  <section class="ds44-card ds44-js-card ds44-card--contact ds44-box ds44-darkContext">
      <picture class="ds44-container-imgRatio">
            <jalios:if predicate="<%= Util.notEmpty(obj.getVisuel()) %>">
                <% CarouselElement image = (CarouselElement)channel.getData(CarouselElement.class, obj.getVisuel().getId()); %>
                    <img src="<%= image.getImage() %>" alt="<%= image.getImageLegend() %>" class="ds44-imgRatio"/>
            </jalios:if>
        </picture>
      
      <div class="ds44-card__section ">
        <p class="ds44-cardSelect pa0 ma0">
            <button class="pas" type="button" aria-describedby="cs6" title="Sélectionner Confort service"><i class="icon icon-star-empty" aria-hidden="true"></i><span class="visually-hidden">Sélection</span></button>
        </p>
        <div class="ds44-innerBoxContainer">
            <p role="heading" aria-level="2" class="ds44-card__title">
              <jalios:link data="<%= obj %>" css="ds44-card__globalLink">
                <%=obj.getTitle()%>
              </jalios:link>
            </p>
            <jalios:if predicate="<%= Util.notEmpty(obj.getDateDeNaissance()) && Util.notEmpty(obj.getDateDeMort()) %>">
              <p>
                <% SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY"); %>
                <%= simpleDateFormat.format(obj.getDateDeNaissance()).toUpperCase() %>
                - <%= simpleDateFormat.format(obj.getDateDeMort()).toUpperCase() %>
               </p>
            </jalios:if>
        </div>
        <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
      </div>
  </section>