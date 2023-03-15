<%@page import="com.jalios.jcms.handler.QueryHandler"%>
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
FicheObjetBaseDeDonnees obj = null;
Publication pub = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);

if(pub instanceof FicheObjetBaseDeDonnees){
    obj = (FicheObjetBaseDeDonnees) pub; 
}

if(Util.isEmpty(obj)){
    QueryHandler ficheObjetQH = new QueryHandler();
    ficheObjetQH.setLoggedMember(loggedMember);
    ficheObjetQH.setTypes(new String[] { FicheObjetBaseDeDonnees.class.getName() } );
    ficheObjetQH.setMode(QueryHandler.TEXT_MODE_ADVANCED);
    ficheObjetQH.setText("numeroDinventaire:"+idKeepeek);
    
    Set<Publication> result = ficheObjetQH.getResultSet();
    
    if(Util.notEmpty(result)){
        obj = (FicheObjetBaseDeDonnees) Util.getFirst(result);
        request.setAttribute(PortalManager.PORTAL_PUBLICATION, obj);
    }
}

// Build title
String titleBuild = media.getTitle();

Metadatum numInvMetadata = KeepeekUtil.getMediaMetadata(media, "numero_dinventaire");
String numInv = Util.notEmpty(numInvMetadata) ? numInvMetadata.getValue() : "";
if(Util.notEmpty(numInv)){
    titleBuild = titleBuild.replace(numInv + " ", "");
    titleBuild += " (" + numInv + ")";
}
%>
<%@ include file='/front/doFullDisplay.jspf' %>
<section class="ds44-container-large">
    <%
    request.setAttribute(PortalManager.PORTAL_CURRENTCATEGORY, channel.getCategory("fde_5008"));
    request.setAttribute("titleHeader", titleBuild);
    request.setAttribute("dataInHeaderStr", media.getUpdateDate());
    %>
    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/header/headerSimple.jspf'%>

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

        <%-- JCMS --%>
        <jalios:if predicate="<%= Util.notEmpty(obj) %>">
            <section class="ds44-contenuArticle" id="section2">
              <h2 class="h2-like underline center"> <%= glp("jcmsplugin.espaceCollection.title.image") %></h2>
              <p class="ds44-mb2">
                <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.en-image.desc") %>
              </p>
                <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/imageMosaique.jspf'%>
            </section>
        </jalios:if>

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
//                 Metadatum numInv = KeepeekUtil.getMediaMetadata(media, "numero_dinventaire");
                %>
                <jalios:if predicate="<%=Util.notEmpty(numInv)%>">
                <tr>
                  <td class="table-detail"><b>Numéro d’inventaire</b></td>
                  <td class="table-detail"><%= numInv %></td>
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

            <%-- Création / Exécution --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.crea") %></h3>
            <table>
              <tbody>
                <%
                Metadatum artisteCreateur = KeepeekUtil.getMediaMetadata(media, "personnes");
                %>
                <jalios:if predicate="<%=Util.notEmpty(artisteCreateur)%>">
                <tr>
                  <td class="table-detail"><b>Artiste / créateur</b></td>
                  <td class="table-detail"><%= artisteCreateur.getValue() %></td>
                </tr>
                </jalios:if>

                <%
                Metadatum datation = KeepeekUtil.getMediaMetadata(media, "datation");
                metadatas = datation;
                %>
                <jalios:if predicate="<%=Util.notEmpty(datation)%>">
                <tr>  
                  <td class="table-detail"><b>Date / époque</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>
                
                <%
                Metadatum lieuCreation = KeepeekUtil.getMediaMetadata(media, "lieu");
                metadatas = lieuCreation;
                %>
                <jalios:if predicate="<%=Util.notEmpty(lieuCreation)%>">
                <tr>
                  <td class="table-detail"><b>Lieu de création</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Matière et technique --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.matiere") %></h3>
            <table>
              <tbody>
                <%
                Metadatum matiere = KeepeekUtil.getMediaMetadata(media, "matiere");
                metadatas = matiere;
                %>
                <jalios:if predicate="<%=Util.notEmpty(matiere)%>">
                <tr>
                  <td class="table-detail"><b>Matière</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>

                <%
                Metadatum technique = KeepeekUtil.getMediaMetadata(media, "technique");
                metadatas = technique;
                %>
                <jalios:if predicate="<%=Util.notEmpty(technique)%>">
                <tr>  
                  <td class="table-detail"><b>Technique</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>

                <%
                Metadatum mesures = KeepeekUtil.getMediaMetadata(media, "mesures");
                %>
                <jalios:if predicate="<%=Util.notEmpty(mesures)%>">
                <tr>
                  <td class="table-detail"><b>Dimensions et poids</b></td>
                  <td class="table-detail"><%= mesures.getValue() %></td>
                </tr>
                </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Inscriptions --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.inscriptions") %></h3>
            <table>
              <tbody>
                <%
                Metadatum typeDinscription = KeepeekUtil.getMediaMetadata(media, "type_dinscription");
                metadatas = typeDinscription;
                %>
                <jalios:if predicate="<%=Util.notEmpty(typeDinscription)%>">
                <tr>
                  <td class="table-detail"><b>Inscriptions</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>
                
                <%
                Metadatum transcription = KeepeekUtil.getMediaMetadata(media, "transcription_de_linscription");
                %>
                <jalios:if predicate="<%=Util.notEmpty(transcription)%>">
                <tr>  
                  <td class="table-detail"><b>Transcription</b></td>
                  <td class="table-detail"><%= transcription.getValue() %></td>
                </tr>
                </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Fonction d’usage --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.usage") %></h3>
            <table>
              <tbody>
                
                <%
                Metadatum foncEtContext = KeepeekUtil.getMediaMetadata(media, "fonctionnement_et_contexte");
                %>
                <jalios:if predicate="<%=Util.notEmpty(foncEtContext)%>">
                <tr>
                  <td class="table-detail"><b>Fonctionnement et contexte</b></td>
                  <td class="table-detail"><%= foncEtContext.getValue() %></td>
                </tr>
                </jalios:if>

                <%
                Metadatum utilisation = KeepeekUtil.getMediaMetadata(media, "utilisation");
                metadatas = utilisation;
                %>
                <jalios:if predicate="<%=Util.notEmpty(utilisation)%>">
                <tr>  
                  <td class="table-detail"><b>Utilisation</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>

                <%
                Metadatum utilisateur = KeepeekUtil.getMediaMetadata(media, "utilisateur");
                %>
                <jalios:if predicate="<%=Util.notEmpty(utilisateur)%>">
                <tr>  
                  <td class="table-detail"><b>Utilisateur</b></td>
                  <td class="table-detail"><%= utilisateur.getValue() %></td>
                </tr>
                </jalios:if>

                <%
                Metadatum evenementAssocie = KeepeekUtil.getMediaMetadata(media, "evenement_associe");
                %>
                <jalios:if predicate="<%=Util.notEmpty(evenementAssocie)%>">
                <tr>  
                  <td class="table-detail"><b>Événement associé à l’utilisation de l’objet</b></td>
                  <td class="table-detail"><%= evenementAssocie.getValue() %></td>
                </tr>
                </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Thèmes et iconographie --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.theme") %></h3>
            <table>
              <tbody>
              
                <%
                Metadatum themes = KeepeekUtil.getMediaMetadata(media, "thesaurus_garnier_theme");
                metadatas = themes;
                %>
                <jalios:if predicate="<%=Util.notEmpty(themes)%>">
                <tr>
                  <td class="table-detail"><b>Thèmes et iconographie</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>
                
                <%
                Metadatum personnesRepresentees = KeepeekUtil.getMediaMetadata(media, "personnes_representees");
                %>
                <jalios:if predicate="<%=Util.notEmpty(personnesRepresentees)%>">
                <tr>  
                  <td class="table-detail"><b>Personne(s) représentée(s)</b></td>
                  <td class="table-detail"><%= personnesRepresentees.getValue() %></td>
                </tr>
                </jalios:if>

                <%
                Metadatum lieuRepresente = KeepeekUtil.getMediaMetadata(media, "lieu_represente");
                metadatas = lieuRepresente;
                %>
                <jalios:if predicate="<%=Util.notEmpty(lieuRepresente)%>">
                <tr>  
                  <td class="table-detail"><b>Lieu représenté</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>

                <%
                Metadatum evenementRepresente = KeepeekUtil.getMediaMetadata(media, "evenement_represente");
                %>
                <jalios:if predicate="<%=Util.notEmpty(evenementRepresente)%>">
                <tr>  
                  <td class="table-detail"><b>Événement représenté</b></td>
                  <td class="table-detail"><%= evenementRepresente.getValue() %></td>
                </tr>
                </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Histoire de la collecte --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.collecte") %></h3>
            <table>
              <tbody>
              
                <%
                Metadatum collecteur = KeepeekUtil.getMediaMetadata(media, "collecteur");
                %>
                <jalios:if predicate="<%=Util.notEmpty(collecteur)%>">
                <tr>
                  <td class="table-detail"><b>Collecteur</b></td>
                  <td class="table-detail"><%= collecteur.getValue() %></td>
                </tr>
                </jalios:if>

                <%
                Metadatum provenanceGeographique = KeepeekUtil.getMediaMetadata(media, "provenance_geographique");
                metadatas = provenanceGeographique;
                %>
                <jalios:if predicate="<%=Util.notEmpty(provenanceGeographique)%>">
                <tr>  
                  <td class="table-detail"><b>Lieu de la découverte</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Localisation --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.localisation") %></h3>
            <table>
              <tbody>

              <%
                Metadatum lieuConservation = KeepeekUtil.getMediaMetadata(media, "lieu_de_conservation");
                metadatas = lieuConservation;
                %>
                <jalios:if predicate="<%=Util.notEmpty(lieuConservation)%>">
                <tr>
                  <td class="table-detail"><b>Lieu de conservation</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>

                <%
                Metadatum localisation = KeepeekUtil.getMediaMetadata(media, "localisation");
                metadatas = localisation;
                %>
                <jalios:if predicate="<%=Util.notEmpty(localisation)%>">
                <tr>  
                  <td class="table-detail"><b>Localisation permanente</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>

                <%
                Metadatum visibiliteOeuvre = KeepeekUtil.getMediaMetadata(media, "visibilite_de_loeuvre");
                metadatas = visibiliteOeuvre;
                %>  
                <jalios:if predicate='<%=Util.notEmpty(visibiliteOeuvre)%>'>
                <tr>  
                  <td class="table-detail"><b>Emplacement actuel</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>

                <%
                Metadatum mouvement = KeepeekUtil.getMediaMetadata(media, "mouvement");
                metadatas = mouvement;
                %>
                <jalios:if predicate="<%=Util.notEmpty(mouvement)%>">
                <tr>  
                  <td class="table-detail"><b>Mouvement</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>
                
                <%
                Metadatum mouvementDebut = KeepeekUtil.getMediaMetadata(media, "date_de_debut_du_mouvement");
                metadatas = mouvementDebut;
                %>
                <jalios:if predicate="<%=Util.notEmpty(mouvementDebut)%>">
                <tr>  
                  <td class="table-detail"><b>Date de début du mouvement</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                </jalios:if>
                
                <%
                Metadatum mouvementFin = KeepeekUtil.getMediaMetadata(media, "date_de_fin_du_mouvement");
                metadatas = mouvementFin;
                %>
                <jalios:if predicate="<%=Util.notEmpty(mouvementFin)%>">
                <tr>  
                  <td class="table-detail"><b>Date de fin du mouvement</b></td>
                  <td class="table-detail">
                    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/keepeekMetadataDisplay.jspf'%>
                  </td>
                </tr>
                 </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
            
            <%-- Autre --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.autre") %></h3>
            <table>
              <tbody>
                
                <%
                Metadatum objetsAssocies = KeepeekUtil.getMediaMetadata(media, "objets_associes");
                %>
                <jalios:if predicate="<%=Util.notEmpty(objetsAssocies)%>">
                <tr>
                  <td class="table-detail"><b>Objet(s) associé(s)</b></td>
                  <td class="table-detail"><%= objetsAssocies.getValue() %></td>
                </tr>
                </jalios:if>
                
                <%
                Metadatum statutAdministratif = KeepeekUtil.getMediaMetadata(media, "statut_administratif");
                %>
                <jalios:if predicate="<%=Util.notEmpty(statutAdministratif)%>">
                <tr>  
                  <td class="table-detail"><b>Statut administratif</b></td>
                  <td class="table-detail"><%= statutAdministratif.getValue() %></td>
                </tr>
                </jalios:if>
              </tbody>
            </table>
            <hr class="mbs" aria-hidden="true" />
          </section>
        </section>
      </div>

      <div class="col-1 grid-offset ds44-hide-tiny-to-medium"></div>

      <aside class="col-4 /*ds44-hide-tinyToLarge*/ ds44-js-aside-summary">
        <section class="ds44-box">
          <section class="ds44-box ds44-mb3 ">
            <jalios:select>
                <jalios:if predicate="<%= Util.notEmpty(obj) && Util.notEmpty(obj.getVisuel()) %>">
                    <% CarouselElement image = obj.getVisuel(); %>
                    <picture class="ds44-container-imgRatio">
                        <img src="<%= image.getImage() %>" alt="<%= image.getImageLegend() %>" class="ds44-imgRatio"/>
                        <jalios:if predicate="<%= Util.notEmpty(image.getImageCopyright()) %>">
                            <figcaption class="ds44-imgCaption"><%= image.getImageCopyright() %></figcaption>
                        </jalios:if>
                    </picture>
                </jalios:if>
                <jalios:if predicate="<%= Util.notEmpty(media.getLinks().getPreview()) %>">
                    <picture class="ds44-container-imgRatio">
                        <img src="<%= media.getLinks().getPreview().getHref() %>" class="ds44-imgRatio"/>
                    </picture>
                </jalios:if>
            </jalios:select>
          </section>

          <section class="ds44-box ds44-theme">
            <div class="ds44-innerBoxContainer">
              <jalios:if predicate="<%= Util.notEmpty(obj) && Util.notEmpty(obj.getFicheObjetMediatisee())%>">
                <jalios:link data="<%= obj.getFicheObjetMediatisee() %>" css="ds44-btnStd ds44-btn--invert ds44-mb1">
                  <span class="ds44-btnInnerText"><%=glp("jcmsplugin.espaceCollection.objet.tuile.fiche-media")%></span>
                  <i class="icon icon-long-arrow-right" aria-hidden="true"></i>
                </jalios:link>
              </jalios:if>

              <button class="ds44-btnStd ds44-mb1"> 
                <i class="icon icon-star-empty" aria-hidden="true"></i>
                <span class="ds44-btnInnerText"><%=glp("jcmsplugin.espaceCollection.objet.tuile.ajout-selection")%></span>
              </button>
              
              <%@ include file='/plugins/EspaceCollectionPlugin/jsp/modal/modalToutesLesImagesDetails.jspf'%>
            </div>
          </section>
        </section>
      </aside>
    </div>
  </div>
</section>
