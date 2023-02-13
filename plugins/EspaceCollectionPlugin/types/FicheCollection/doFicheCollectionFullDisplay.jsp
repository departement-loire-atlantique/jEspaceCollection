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

%><%@ include file='/front/doFullDisplay.jspf'%>

	<section class="ds44-container-large">
		<%@ include
			file='/plugins/EspaceCollectionPlugin/jsp/header/headerSimple.jspf'%>

		<div class="ds44-inner-container ds44-mt3 ds44--l-padding-t">
			<div class="grid-12-small-1">
				<div class="col-7">
					<section class="ds44-contenuArticle" id="section1">
						<p class="ds44-introduction">
              <%= obj.getDescription() %>
            </p>
					</section>
				</div>

				<div class="col-1 grid-offset ds44-hide-tiny-to-medium"></div>

				<aside class="col-4">
        <section class="ds44-box">
            <div class="ds44-posRel">
              <img src="../../assets/images/sample-media.jpg" alt=""
                class="ds44-box__img ds44-hiddenPrint" /></span>
            </div>
					</section>
					<section class="ds44-box ds44-theme ds44-mb3">
						<div class="ds44-innerBoxContainer">
							<p role="heading" aria-level="2" class="ds44-box-heading">
                Infos pratiques
              </p>
						</div>
					</section>
				</aside>
			</div>
		</div>
	</section>
<%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%>
<%

%><%-- 4Ul7kOQKa3GUpMAhUeOjIw== --%>