<%@page import="fr.digiwin.module.espacecollection.keepeek.KeepeekGetFilter"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%
if (!loggedMember.isAdmin()) {
    sendForbidden(request, response);
}
KeepeekGetFilter filters = new KeepeekGetFilter();
filters.process();
%>