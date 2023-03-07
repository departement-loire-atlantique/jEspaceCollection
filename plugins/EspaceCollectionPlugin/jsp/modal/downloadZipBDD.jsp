<%@page import="fr.digiwin.module.espacecollection.exportZip.ExportZip"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

  String idObjet = (String) session.getAttribute("idObjet");
  String radio = (String) request.getParameter("telechargerImage"); //renvoie null 
  FicheObjetBaseDeDonnees obj = (FicheObjetBaseDeDonnees)channel.getData(idObjet);

  if(Util.notEmpty(obj)) {
    ExportZip zip = new ExportZip();
    Carousel carrousel = (Carousel)channel.getData(Carousel.class, obj.getGalerieDeVisuels().getId());
    CarouselElement[] listeElem = carrousel.getElements1();
    zip.exportZip(listeElem, obj.getTitle()).sendToDownloadUrl(request, response); 
  }
%>	