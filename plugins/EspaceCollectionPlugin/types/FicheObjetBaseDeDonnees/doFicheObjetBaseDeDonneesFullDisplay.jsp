<%@page import="generated.FicheObjetBaseDeDonnees"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%

FicheObjetBaseDeDonnees obj = (FicheObjetBaseDeDonnees)request.getAttribute(PortalManager.PORTAL_PUBLICATION); 

request.setAttribute("idKeepeek", obj.getNumeroDinventaire());
%>
<jsp:include page="/plugins/EspaceCollectionPlugin/jsp/ficheObjet/doFicheObjetFull.jsp"></jsp:include>
