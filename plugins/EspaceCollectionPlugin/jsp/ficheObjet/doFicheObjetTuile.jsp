<%@page import="fr.digiwin.module.espacecollection.keepeek.KeepeekUtil"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.MediaLight"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Value"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Metadatum"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Media"%>
<%@page
    import="fr.digiwin.module.espacecollection.keepeek.KeepeekApiEndPoint"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%
MediaLight media = (MediaLight) request.getAttribute("itMediaLight");

if (Util.isEmpty(media)) {
    return;
}

String epoque = "";
Metadatum datation = KeepeekUtil.getMediaMetadata(media, "datation");

if(null != datation ){
    Value firstVal = Util.getFirst(datation.getEmbedded().getValue());
    epoque = null == firstVal ? "" : firstVal.getTitle();
}

Metadatum numInv = KeepeekUtil.getMediaMetadata(media, "numero_dinventaire");
%>
<section
    class="ds44-card ds44-js-card ds44-card--contact ds44-box ds44-bgGray  ">

    <picture class="ds44-container-imgRatio">
        <img src="<%= media.getLinks().getPreview().getHref() %>" alt="" class="ds44-imgRatio" />
    </picture>

    <div class="ds44-card__section">
        <div class="ds44-innerBoxContainer">
            <p role="heading" aria-level="2" class="h4-like ds44-cardTitle">
                <a href=<%="plugins/EspaceCollectionPlugin/jsp/ficheObjet/doFicheObjetFull.jsp?idKeepeek=" + media.getId() %> 
                        class="ds44-card__globalLink">
                    <%= media.getTitle() %>
                </a>
            </p>
<!--             <hr class="mbs" aria-hidden="true" /> -->
            <jalios:if predicate="<%= Util.notEmpty(epoque) %>">
                <p class="ds44-docListElem ds44-mt-std">
                    <i class="icon icon-date ds44-docListIco" aria-hidden="true"></i>
                    <%= epoque %>
                </p>
            </jalios:if>
            <jalios:if predicate="<%= Util.notEmpty(numInv) %>">
                <p class="ds44-docListElem ds44-mt-std">
                    <i class="icon icon-tag ds44-docListIco" aria-hidden="true"></i>
                    <%= numInv.getValue() %>
                </p>
            </jalios:if>
        </div>
<!--         <i class="icon icon-arrow-right ds44-cardArrow" -->
<!--             aria-hidden="true"></i> -->
    </div>
</section>
