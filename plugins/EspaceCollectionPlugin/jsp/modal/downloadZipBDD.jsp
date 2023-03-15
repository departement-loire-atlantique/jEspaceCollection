<%@page import="fr.digiwin.module.espacecollection.exportZip.ExportZip"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

  String idObjet = (String) session.getAttribute("idObjet");
  FicheObjetBaseDeDonnees obj = (FicheObjetBaseDeDonnees)channel.getData(idObjet);

  Map.Entry<String,String[]> entry = request.getParameterMap().entrySet().iterator().next();

  if(Util.notEmpty(obj) && Util.notEmpty(entry)) {

    String key = entry.getKey();
    String[] value = entry.getValue();

    if(Util.notEmpty(value[0]) && Integer.parseInt(value[0]) == 0) {
      System.out.println("1");
      ExportZip zip = new ExportZip();
      CarouselElement[] listeElem = new CarouselElement[]{obj.getVisuel()};
      zip.exportZip(listeElem, obj.getTitle()).sendToDownloadUrl(request, response); 

    } else if(Util.notEmpty(value[0]) && Integer.parseInt(value[0]) == 1) {
      System.out.println("2");
      ExportZip zip = new ExportZip();
      Carousel carrousel = (Carousel)channel.getData(Carousel.class, obj.getGalerieDeVisuels().getId());
      CarouselElement[] listeElem = carrousel.getElements1();
      zip.exportZip(listeElem, obj.getTitle()).sendToDownloadUrl(request, response); 
    }
  
  }
  
  session.removeAttribute("idObjet");
%>	