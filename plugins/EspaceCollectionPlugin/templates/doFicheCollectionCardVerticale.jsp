<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

if (data == null) {
  return;
}

FicheCollection obj = (FicheCollection) data;
%>
<li class="swiper-slide">
    <section class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext">
        <picture class="ds44-container-imgRatio">
            <jalios:if predicate="<%= Util.notEmpty(obj.getVisuel()) %>">
                <% CarouselElement image = (CarouselElement)channel.getData(CarouselElement.class, obj.getVisuel().getId()); %>
                    <img src="<%= image.getImage() %>" alt="<%= image.getImageLegend() %>" class="ds44-imgRatio"/>
            </jalios:if>
        </picture>
        <div class="ds44-card__section">
            <p role="heading" aria-level="2" class="ds44-card__title">
                <jalios:link data="<%= obj %>" css="ds44-card__globalLink">
                    <%=obj.getTitle()%>
                </jalios:link>
            </p>
            <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
        </div>
    </section>
</li>
