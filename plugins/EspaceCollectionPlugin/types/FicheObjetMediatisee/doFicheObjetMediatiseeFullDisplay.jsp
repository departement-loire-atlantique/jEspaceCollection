<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: FicheObjetMediatisee display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% FicheObjetMediatisee obj = (FicheObjetMediatisee)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%>
<section class="ds44-container-large">
	<%@ include file='/plugins/EspaceCollectionPlugin/jsp/header/headerTuileObjet.jspf'%>
  
	<section class="ds44-container-fluid ds44--xxl-padding-tb">
    <div class="ds44-inner-container ds44-mtb3">
      <div class="ds44-grid12-offset-2">
        <jalios:wysiwyg><%= obj.getDescription() %></jalios:wysiwyg>
      </div>
    </div>
	<%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/share.jspf'%>
	</section>
  
	<%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/3dHorizontale.jspf'%>
</section>

<%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- N7oZMNVL+mCSFp0M8shCKg== --%>