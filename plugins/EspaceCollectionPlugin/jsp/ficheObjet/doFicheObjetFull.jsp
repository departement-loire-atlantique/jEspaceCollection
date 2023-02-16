<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Metadatum"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.KeepeekUtil"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Media"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.pojo.Value"%>
<%@page import="fr.digiwin.module.espacecollection.keepeek.KeepeekApiEndPoint"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 

//Obj Keepeek
String idKeepeek = (String) request.getAttribute("idKeepeek");

if(Util.isEmpty(idKeepeek)){
    idKeepeek = getStringParameter("idKeepeek", "", ".*");
}


if(Util.isEmpty(idKeepeek)){
    // TODO
    return;
}

Media media = KeepeekApiEndPoint.getMedia(idKeepeek);

if (Util.isEmpty(media)) {
    return;
}

Metadatum metadatas = null; // For include

// Obj JCMS
FicheObjetBaseDeDonnees obj = (FicheObjetBaseDeDonnees)request.getAttribute(PortalManager.PORTAL_PUBLICATION); 

if(Util.isEmpty(obj)){
    obj = null; // TODO get with idKeepeek
}
%>
<%@ include file='/front/doFullDisplay.jspf' %>

<section class="ds44-container-large">
<%--     <%@ include file='/plugins/EspaceCollectionPlugin/jsp/header/headerSimple.jspf'%> --%>
    <div class="ds44-lightBG ds44-posRel ds44--m-padding-b">
      <div
        class="ds44-inner-container ds44--xl-padding-t ds44--m-padding-b ds44-tablette-reduced-pt">
        <div class="ds44-grid12-offset-2">
                    <!-- Fil d'ariane -->
          <jalios:if predicate='<%= Util.notEmpty(Channel.getChannel().getProperty("jcmsplugin.socle.portlet.filariane.id"))%>'>
            <jalios:include id='<%=Channel.getChannel().getProperty("jcmsplugin.socle.portlet.filariane.id")%>' />
          </jalios:if>
          <h1 class="h1-like">
            <%= media.getTitle() %>
          </h1>
        </div>
      </div>
    </div>

  <div class="ds44-inner-container ds44-mt3 ds44--l-padding-t">
    <div class="grid-12-small-1">
      <div class="col-7">
        <%--  --%>
        <%
        Metadatum description = KeepeekUtil.getMediaMetadata(media, "description");
        %>
        <jalios:if predicate="<%= Util.notEmpty(description) %>">
            <section class="ds44-contenuArticle" id="section1">
              <h2 class="h2-like underline center"> <%= glp("jcmsplugin.espaceCollection.title.desc") %></h2>
              <p class="ds44-introduction">
                <%= description.getValue() %>
              </p>
            </section>
        </jalios:if>

<!--         <section class="ds44-contenuArticle" id="section2"> -->
<%--           <h2 class="h2-like underline center"> <%= glp("jcmsplugin.espaceCollection.title.image") %></h2> --%>
<!--           <p class="ds44-mb2"> -->
<%--             <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.en-image.desc") %> --%>
<!--           </p> -->
<%--             <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/imageMosaique.jspf'%> --%>
<!--         </section> -->

        <%-- JCMS --%>
        <jalios:if predicate="<%= Util.notEmpty(obj) %>">
	       <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/3dVerticale.jspf'%>
        </jalios:if>

        <section class="ds44-contenuArticle" id="section3">
          <h2 class="h2-like underline center"> <%= glp("jcmsplugin.espaceCollection.title.detail") %></h2>
          <section>
            <%-- Identification --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.identification") %></h3>
            <table>
              <tbody>
              
                <%
                Metadatum numInv = KeepeekUtil.getMediaMetadata(media, "numero_dinventaire");
                %>
                <jalios:if predicate="<%=Util.notEmpty(numInv)%>">
                <tr>
                  <td class="table-detail"><b>Numéro d’inventaire</b></td>
                  <td class="table-detail"><%= numInv.getValue() %></td>
                </tr>
                </jalios:if>

                <%
                Metadatum departement = KeepeekUtil.getMediaMetadata(media, "institution__departement");
                metadatas = departement;
                %>
                <jalios:if predicate="<%=Util.notEmpty(departement)%>">
                <tr>
                  <td class="table-detail"><b>Département</b></td>
                  <td class="table-detail">
                  
                  <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
<%--                         <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/motCle.jspf'%> --%>
                  </td>
                </tr>
                </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(media.getTitle())%>">
                <tr>  
                  <td class="table-detail"><b>Titre</b></td>
                  <td class="table-detail"><%= media.getTitle() %></td>
                </tr>
                </jalios:if>
                
                <%
                Metadatum denomination = KeepeekUtil.getMediaMetadata(media, "denomination_objet");
                metadatas = denomination;
                %>
                <jalios:if predicate="<%=Util.notEmpty(denomination)%>">
                <tr>
                  <td class="table-detail"><b>Dénomination</b></td>
                  <td class="table-detail">
                  <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>
                
                
                <%
                Metadatum autreDesign = KeepeekUtil.getMediaMetadata(media, "autres_designations");
                %>
                <jalios:if predicate="<%=Util.notEmpty(autreDesign)%>">
                <tr>
                  <td class="table-detail"><b>Autres désignations</b></td>
                  <td class="table-detail"><%= autreDesign.getValue() %></td>
                </tr>
                </jalios:if>
                
                <%
                Metadatum domaine = KeepeekUtil.getMediaMetadata(media, "domaine");
                metadatas = domaine;
                %>
                <jalios:if predicate="<%=Util.notEmpty(domaine)%>">
                <tr>
                  <td class="table-detail"><b>Domaine</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>

                <%
                Metadatum collectioneur = KeepeekUtil.getMediaMetadata(media, "collection");
                metadatas = collectioneur;
                %>
                <jalios:if predicate="<%=Util.notEmpty(collectioneur)%>">
                <tr>
                  <td class="table-detail"><b>Collectionneur</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />

<%-- TODO --%>
            <%-- Création / Exécution --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.crea") %></h3>
            <table>
              <tbody>
                <jalios:if predicate="<%=Util.notEmpty(obj.getArtisteCreateur(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "artisteCreateur", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getArtisteCreateur(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getDateEpoque(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "dateEpoque", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getDateEpoque(userLang) %></td>
                </tr>
                        </jalios:if>
                
                <jalios:if predicate="<%=Util.notEmpty(obj.getLieuDeCreation(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "lieuDeCreation", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getLieuDeCreation(userLang) %></td>
                </tr>
                        </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Matière et technique --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.matiere") %></h3>
            <table>
              <tbody>
                <jalios:if predicate="<%=Util.notEmpty(obj.getMatiere(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "matiere", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getMatiere(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getTechnique(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "technique", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getTechnique(userLang) %></td>
                </tr>
                        </jalios:if>
                
                <jalios:if predicate="<%=Util.notEmpty(obj.getDimensionsEtPoids(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "dimensionsEtPoids", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getDimensionsEtPoids(userLang) %></td>
                </tr>
                        </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Inscriptions --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.inscriptions") %></h3>
            <table>
              <tbody>
                <jalios:if predicate="<%=Util.notEmpty(obj.getInscriptions(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "inscriptions", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getInscriptions(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getTranscription(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "transcription", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getTranscription(userLang) %></td>
                </tr>
                        </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Fonction d’usage --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.usage") %></h3>
            <table>
              <tbody>
                <jalios:if predicate="<%=Util.notEmpty(obj.getFonctionnementEtContexte(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "fonctionnementEtContexte", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getFonctionnementEtContexte(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getFonctionnementEtContexte(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "utilisation", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getFonctionnementEtContexte(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getUtilisateur(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "utilisateur", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getUtilisateur(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getEvenementAssocieALutilisationDeL(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "evenementAssocieALutilisationDeL", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getEvenementAssocieALutilisationDeL(userLang) %></td>
                </tr>
                        </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Thèmes et iconographie --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.theme") %></h3>
            <table>
              <tbody>
                <jalios:if predicate="<%=Util.notEmpty(obj.getThemesEtIconographie(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "themesEtIconographie", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getThemesEtIconographie(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getPersonnesRepresentees(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "personnesRepresentees", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getPersonnesRepresentees(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getLieuRepresente(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "lieuRepresente", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getLieuRepresente(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getEvenementRepresente(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "evenementRepresente", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getEvenementRepresente(userLang) %></td>
                </tr>
                        </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Histoire de la collecte --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.collecte") %></h3>
            <table>
              <tbody>
                <jalios:if predicate="<%=Util.notEmpty(obj.getCollecteur(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "collecteur", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getCollecteur(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getLieuDeLaDecouverte(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "lieuDeLaDecouverte", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getLieuDeLaDecouverte(userLang) %></td>
                </tr>
                        </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Localisation --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.localisation") %></h3>
            <table>
              <tbody>
                <jalios:if predicate="<%=Util.notEmpty(obj.getLieuDeConservation(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "lieuDeConservation", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getLieuDeConservation(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getLocalisationPermanente(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "localisationPermanente", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getLocalisationPermanente(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getEmplacementActuel(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "emplacementActuel", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getEmplacementActuel(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getMouvement(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "mouvement", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getMouvement(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getDateDeDebutDuMouvement(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "dateDeDebutDuMouvement", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getDateDeDebutDuMouvement(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getDateDeFinDuMouvement(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "dateDeFinDuMouvement", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getDateDeFinDuMouvement(userLang) %></td>
                </tr>
                        </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Autre --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.autre") %></h3>
            <table>
              <tbody>
                <jalios:if predicate="<%=Util.notEmpty(obj.getObjetsAssocies(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "objetsAssocies", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getObjetsAssocies(userLang) %></td>
                </tr>
                        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getStatutAdministratif(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "statutAdministratif", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getStatutAdministratif(userLang) %></td>
                </tr>
                        </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
          </section>
        </section>
      </div>

      <div class="col-1 grid-offset ds44-hide-tiny-to-medium"></div>

      <aside class="col-4 ds44-hide-tinyToLarge ds44-js-aside-summary">
        <section class="ds44-box">
          <section class="ds44-box ds44-mb3 ">
            <jalios:if predicate="<%= Util.notEmpty(obj.getVisuel()) %>">
                <% CarouselElement image = (CarouselElement)channel.getData(CarouselElement.class, obj.getVisuel().getId()); %>
                <picture class="ds44-container-imgRatio">
                    <img src="<%= image.getImage() %>" alt="<%= image.getImageLegend() %>" class="ds44-imgRatio"/>
                    <jalios:if predicate="<%= Util.notEmpty(image.getImageCopyright()) %>">
                        <figcaption class="ds44-imgCaption"><%= image.getImageCopyright() %></figcaption>
                    </jalios:if>
                </picture>
            </jalios:if>
          </section>

          <section class="ds44-box ds44-theme">
            <div class="ds44-innerBoxContainer">
              <jalios:if predicate="<%=Util.notEmpty(obj.getFicheObjetMediatisee())%>">
                <jalios:link data="<%= obj.getFicheObjetMediatisee() %>" css="ds44-btnStd ds44-btn--invert ds44-mb1">
                  <span class="ds44-btnInnerText"><%=glp("jcmsplugin.espaceCollection.objet.tuile.fiche-media")%></span>
                  <i class="icon icon-long-arrow-right" aria-hidden="true"></i>
                </jalios:link>
              </jalios:if>

              <button class="ds44-btnStd ds44-mb1"> 
                <i class="icon icon-star-empty" aria-hidden="true"></i>
                <span class="ds44-btnInnerText"><%=glp("jcmsplugin.espaceCollection.objet.tuile.ajout-selection")%></span>
              </button>
              
              <%@ include file='/plugins/EspaceCollectionPlugin/jsp/modal/modalToutesLesImages.jspf'%>
            </div>
          </section>
        </section>
      </aside>
    </div>
  </div>
</section>
