<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Value"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Metadatum"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Media"%>
<%@page
    import="fr.digiwin.module.espacecollection.keepeek.KeepeekApiEndPoint"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%
String idKeepeek = (String) request.getAttribute("idKeepeek");

if (Util.isEmpty(idKeepeek)) {
    return;
}

Media media = KeepeekApiEndPoint.getMedia(idKeepeek);

if (Util.isEmpty(media)) {
    return;
}

String epoque = "";
Metadatum datation = media.getEmbedded().getMetadata()
    .stream()
    .filter(it -> "datation".equalsIgnoreCase(it.getId()))
    .findFirst()
    .orElse(null);

if(null != datation ){
    Value firstVal = Util.getFirst(datation.getEmbedded().getValue());
    epoque = null == firstVal ? "" : firstVal.getTitle();
}

%>
<section
    class="ds44-card ds44-js-card ds44-card--contact ds44-box ds44-bgGray  ">

    <picture class="ds44-container-imgRatio">
        <img src="<%= media.getLinks().getPreview().getHref() %>" alt="" class="ds44-imgRatio" />
    </picture>

    <div class="ds44-card__section">
        <div class="ds44-innerBoxContainer">
            <p role="heading" aria-level="2" class="h4-like ds44-cardTitle">
                <a href="TODO" class="ds44-card__globalLink">
                    <%= media.getTitle() %>
                </a>
            </p>
<!--             <hr class="mbs" aria-hidden="true" /> -->
            <p class="ds44-docListElem ds44-mt-std">
                <i class="icon icon-date ds44-docListIco" aria-hidden="true"></i>
                <%= epoque %>
            </p>
            <p class="ds44-docListElem ds44-mt-std">
                <i class="icon icon-tag ds44-docListIco" aria-hidden="true"></i>
                <%= media.getId() %>
            </p>
        </div>
<!--         <i class="icon icon-arrow-right ds44-cardArrow" -->
<!--             aria-hidden="true"></i> -->
    </div>
</section>
