<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%><%
%><% PortletMiseEnAvantDeContenus box = (PortletMiseEnAvantDeContenus)portlet; %><%
List<Content> allContents = new ArrayList<>();
if (Util.notEmpty(box.getFirstPublications())) {
    allContents.addAll(Arrays.asList(box.getFirstPublications()));
}
%>

<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>

<%
if (Util.notEmpty(collection)) {
    allContents.addAll(collection);
}
%>

<% 
String headerTitle =  glp("jcmsplugin.espaceCollection.departement.header.liste.image");
String headerSubTitle =  glp("jcmsplugin.espaceCollection.departement.header.liste.fil-ariane");
String headerImage =  "";
String headerImageAlt =  "";

if(box.getLienInterne() instanceof CarouselElement) {
	CarouselElement lienInterne = (CarouselElement) box.getLienInterne();
	CarouselElement image = (CarouselElement)channel.getData(CarouselElement.class, lienInterne.getId());
	headerImage = image.getImage();
	headerImageAlt = image.getImageLegend();
}
%>

<%@ include file='/plugins/EspaceCollectionPlugin/jsp/header/headerImage.jspf'%>

<section class="ds44-container-fluid ds44--xxl-padding-tb">
    <header class="txtcenter ds44--xl-padding-b ds44-container-large">
      <h2 class="h2-like underline center" id="titreMEA<%= box.getId() %>"><%= box.getTitreVisuel(userLang) %></h2>
			<jalios:if predicate='<%=Util.notEmpty(box.getSoustitre()) %>'>
	        <h4><%= box.getSoustitre(userLang) %></h4>
	    </jalios:if>
    </header>

    <div class="ds44-mobile-extra-smt">
	    <div class="mod--hidden ds44-list swipper-carousel-wrap ds44-posRel ds44-container-large" data-nb-visible-slides="3" data-mobile-only="true">
		    <div class="swiper-container">
		        <ul class="swiper-wrapper ds44-list grid-3-small-1 has-gutter-l ds44-carousel-swiper">
		            <jalios:foreach name="itContent" type="Content" collection="<%= allContents %>" max="<%= box.getMaxResults() %>">
									<li class="swiper-slide">
                    <jalios:media data="<%=itContent %>" template="card-horizontale"/>
									</li>
		            </jalios:foreach>
		        </ul>
		    </div>
		    <button class="swiper-button-prev swiper-button-disabled black-btn-swiper" type="button">
		        <i class="icon icon-left" aria-hidden="true"></i>
		        <span class="visually-hidden"></span>
		    </button>
		    <button class="swiper-button-next swiper-button-disabled black-btn-swiper" type="button">
		        <i class="icon icon-right" aria-hidden="true"></i>
		        <span class="visually-hidden"></span>
		    </button>
	    </div>
    </div>

</section>