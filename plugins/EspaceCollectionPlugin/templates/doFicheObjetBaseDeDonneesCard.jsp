<%@page import="fr.digiwin.module.espacecollection.keepeek.KeepeekUtil"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Metadatum"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Media"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Value"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.KeepeekApiEndPoint"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

if (data == null) {
  return;
}

FicheObjetBaseDeDonnees obj = (FicheObjetBaseDeDonnees) data;

//Obj Keepeek
Media media = null;
String idKeepeek = obj.getNumeroDinventaire();

if(Util.notEmpty(idKeepeek)){
    media = KeepeekApiEndPoint.getMedia(idKeepeek);
}
%>
  <section class="ds44-card ds44-js-card ds44-card--contact ds44-box ds44-darkContext ">
      <picture class="ds44-container-imgRatio">
        <jalios:if predicate="<%= Util.notEmpty(obj.getVisuel()) %>">
            <% CarouselElement image = (CarouselElement)channel.getData(CarouselElement.class, obj.getVisuel().getId()); %>
            <img src="<%= image.getImage() %>" alt="<%= image.getImageLegend() %>" class="ds44-imgRatio"/>
        </jalios:if>
      </picture>
      
      <div class="ds44-card__section">
        <p class="ds44-cardSelect pa0 ma0">
            <button class="pas" type="button" aria-describedby="cs6" title="Sélectionner Confort service"><i class="icon icon-star-empty" aria-hidden="true"></i><span class="visually-hidden">Sélection</span></button>
        </p>
        <div class="ds44-innerBoxContainer">
            <p role="heading" aria-level="2" class="ds44-card__title">
              <jalios:link data="<%= obj %>" css="ds44-card__globalLink">
                <%= Util.notEmpty(media) ? media.getTitle() : obj.getTitle() %>
              </jalios:link>
            </p>
            <%
            Metadatum datation = KeepeekUtil.getMediaMetadata(media, "datation");
            %>
            <jalios:if predicate="<%= Util.notEmpty(datation) %>">
              <p class="ds44-docListElem ds44-mt-std">
                <i class="icon icon-date ds44-docListIco" aria-hidden="true"></i>
                <%= Util.getFirst(datation.getEmbedded().getValue()).getTitle() %>
              </p>
            </jalios:if>
            <%
            Metadatum collectioneur = KeepeekUtil.getMediaMetadata(media, "collection");
            %>
            <jalios:if predicate="<%= Util.notEmpty(collectioneur) %>">
              <p class="ds44-docListElem ds44-mt-std">
                <i class="icon icon-user ds44-docListIco" aria-hidden="true"></i>
                <jalios:foreach collection="<%= datation.getEmbedded().getValue() %>" type="Value" name="itCollectioneur" >
                    <%= itCollectioneur.getTitle() %>
                </jalios:foreach>
              </p>
            </jalios:if>
        </div>
        <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
      </div>
  </section>