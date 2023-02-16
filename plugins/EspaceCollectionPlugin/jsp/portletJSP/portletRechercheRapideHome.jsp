<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%

%>
<div class="col-4-small-1 col-4-large-5 ds44-bgGray ds44--m-padding-tb">
    <section id="recherche-rapide"
        class="ds44-mlr35 ds44-mtb2 ds44-mobile-reduced-mar">
        <h2 class="h2-like underline" id="titreEn1Clic">
            <%= channel.getProperty("jcmsplugin.espacecollection.home.recherche.title") %>
        </h2>
        
        <p class="ds44-centeredBlock">
            <%= channel.getProperty("jcmsplugin.espacecollection.home.recherche.desc") %>
        </p>

        <form role="search" method="get" action="plugins/EspaceCollectionPlugin/jsp/recherche/rapide/doRedirect.jsp">
            <div class="ds44-form__container">
                <div class="ds44-posRel">
                    <label for="searchtext" class="ds44-formLabel">
                        <span class="ds44-labelTypePlaceholder">
                            <span>
                                Une recherche précise, le n° d’inventaire...
                            </span>
                        </span>
                    </label>
                    <input type="text" id="searchtext"
                        name="textRechercehRapide" value="" <%-- textform-element-por_5166por_5165 => champ rechreche page de recherche --%>
                        class="ds44-inpStd"
                        title="Une recherche précise, le n° d’inventaire..."
                        aria-describedby="inp-rech"
                        data-bkp-aria-describedby="inp-rech">

                    <button class="ds44-reset" type="button">
                        <i class="icon icon-cross icon--sizeXL" aria-hidden="true"></i>
                        <span class="visually-hidden">
                            Effacer le contenu saisi dans le champ : Une recherche précise, le n° d’inventaire…
                        </span>
                    </button>
                </div>
            </div>
            <button type="submit" class="ds44-fullWBtn ds44-btnStd ds44-btn--contextual"
                title="Valider votre recherche" data-submit-key="op" data-submit-value="recherche">
                <span class="ds44-btnInnerText">Rechercher</span><i
                    class="icon icon-long-arrow-right"
                    aria-hidden="true"></i>
            </button>
            <button type="submit" class="ds44-fullWBtn ds44-btnStd--tag"
                title="Valider votre recherche avancé" data-submit-key="op" data-submit-value="RechercheAV">
                <span class="ds44-btnInnerText">Recherche avancée</span>
            </button>
        </form>
    </section>
</div>