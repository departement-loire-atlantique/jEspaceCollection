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
String headerTitle = box.getTitreVisuel();
String headerText = box.getSoustitre();
String headerSubTitle = box.getTitreVisuel();
%>

<section class="ds44-container-large">
	<%@ include file='/plugins/EspaceCollectionPlugin/jsp/header/headerEncart.jspf'%>

	<section class="ds44-container-fluid ds44--xxl-padding-tb">

		<%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/tuileMiseEnAvantCollectionneurs.jspf'%>
			<div class="ds44-mobile-extra-smt">
				<div class="mod--hidden ds44-list swipper-carousel-wrap ds44-posRel ds44-container-large" data-nb-visible-slides="3" data-mobile-only="true">
					<div class="swiper-container">
							<h2 class="h2-like"><%= glp("jcmsplugin.espaceCollection.collectionneur.liste.title.collectionneurs")%></h2>
							<ul class="swiper-wrapper ds44-list grid-3-small-1 has-gutter-l ds44-carousel-swiper">
									<jalios:foreach name="itContent" type="Content" collection="<%= allContents %>" max="<%= box.getMaxResults() %>">
										<jalios:if predicate="<%=  (Util.notEmpty(box.getLienInterne()) && !box.getLienInterne().equals(itContent)) || Util.isEmpty(box.getLienInterne()) %>">
											<li class="swiper-slide">
												<jalios:media data="<%=itContent %>" template="card"/>
											</li>
										</jalios:if>
									</jalios:foreach>
							</ul>
					</div>
					<button class="swiper-button-prev swiper-button-disabled" type="button">
							<i class="icon icon-left" aria-hidden="true"></i>
							<span class="visually-hidden"></span>
					</button>
					<button class="swiper-button-next swiper-button-disabled" type="button">
							<i class="icon icon-right" aria-hidden="true"></i>
							<span class="visually-hidden"></span>
					</button>
				</div>
			</div>

	</section>
</section>