<%@ page contentType="text/html; charset=UTF-8"%>
<%

%><%-- This file has been automatically generated. --%>
<%

%><%--
  @Summary: FicheCollection display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%

%><%@ include file='/jcore/doInitPage.jspf'%>
<%

%>
<%
FicheCollection obj = (FicheCollection) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
%>
<%

%>

	<section class="ds44-container-large">
		<%@ include
			file='/plugins/EspaceCollectionPlugin/jsp/header/headerSimple.jspf'%>

		<div class="ds44-inner-container ds44-mt3 ds44--l-padding-t">
			<div class="grid-12-small-1">
				<div class="col-7">
					<section class="ds44-contenuArticle" id="section1">
						<p class="ds44-introduction">
							<jalios:wysiwyg>
              	<%= obj.getDescription() %>
							</jalios:wysiwyg>
            </p>
					</section>
					
					<%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/share.jspf'%>
				</div>

				<div class="col-1 grid-offset ds44-hide-tiny-to-medium"></div>

				<aside class="col-4 ds44-hide-tinyToLarge ds44-js-aside-summary">
					<section class="ds44-box">
						<section class="ds44-box ds44-mb3">
							<jalios:if predicate="<%= Util.notEmpty(obj.getVisuel()) %>">
								<% CarouselElement image = (CarouselElement)channel.getData(CarouselElement.class, obj.getVisuel().getId()); %>
								<picture class="ds44-container-imgRatio">
										<img src="<%= image.getImage() %>" alt="<%= image.getImageLegend() %>" class="ds44-imgRatio"/>
										<jalios:if predicate="<%= Util.notEmpty(image.getImageCopyright()) %>">
												<figcaption class="ds44-imgCaption"><%= image.getImageCopyright() %></figcaption>
										</jalios:if>
								</picture>
							</jalios:if>
						</section>

            <jalios:if predicate="<%= Util.notEmpty(obj.getMail()) %>">
							<section class="ds44-box ds44-theme">
								<div class="ds44-innerBoxContainer">
									<p role="heading" aria-level="2" class="ds44-box-heading">
										<%= glp("jcmsplugin.espaceCollection.title.pratique") %>
									</p>
									<p class="ds44-docListElem mts">
										<i class="icon icon-mail ds44-docListIco" aria-hidden="true"></i>
										<a href="mailto:<%=obj.getMail()%>" title="Contacter par mail : <%=obj.getMail()%>">
										<%= glp("jcmsplugin.espaceCollection.btn.mail") %>
										</a>
									</p>
								</div>
							</section>
						</jalios:if>
					</section>
				</aside>
			</div>
		</div>
	</section>
	
<%@ include file='/plugins/EspaceCollectionPlugin/jsp/carrousel/carrouselCollectionOeuvres.jspf'%>
<%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%>
<%

%><%-- 4Ul7kOQKa3GUpMAhUeOjIw== --%>