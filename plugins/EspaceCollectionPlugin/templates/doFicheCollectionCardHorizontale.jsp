<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

if (data == null) {
  return;
}

FicheCollection obj = (FicheCollection) data;
%>
<section class="ds44-card ds44-js-card ds44-card--horizontal">
  <div class="ds44-flex-container ds44-flex-valign-center">
    <div class="ds44-card__section--horizontal--img">
       <picture class="ds44-container-imgRatio ds44-container-imgRatio--carre">
         <img src="<%= "image" %>" alt="" class="ds44-imgRatio" />
      </picture>
   </div>
    <div class="ds44-card__section--horizontal">
      <p role="heading" aria-level="2" class="ds44-card__title">
        <jalios:link data="<%= obj %>" css="ds44-card__globalLink">
          <%=obj.getTitle()%>
        </jalios:link>
      </p>
      <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
    </div>
  </div>
</section>