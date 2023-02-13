<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: FicheObjetBaseDeDonnees display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% FicheObjetBaseDeDonnees obj = (FicheObjetBaseDeDonnees)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>



<section class="ds44-container-large">
	<%@ include file='/plugins/EspaceCollectionPlugin/jsp/header/headerSimple.jspf'%>

  <div class="ds44-inner-container ds44-mt3 ds44--l-padding-t">
    <div class="grid-12-small-1">
      <div class="col-7">
        <section class="ds44-contenuArticle" id="section1">
          <h2 class="h2-like underline center"> <%= glp("jcmsplugin.espaceCollection.title.desc") %></h2>
          <p class="ds44-introduction">
            <%= obj.getDescription() %>
          </p>
        </section>

        <section class="ds44-contenuArticle" id="section2">
          <h2 class="h2-like underline center"> <%= glp("jcmsplugin.espaceCollection.title.image") %></h2>
          <p class="ds44-introduction">
            <%= obj.getTitle() %>
          </p>
		    <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/imageMosaique.jspf'%>
        </section>

	      <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/3dVerticale.jspf'%>

        <section class="ds44-contenuArticle" id="section3">
          <h2 class="h2-like underline center"> <%= glp("jcmsplugin.espaceCollection.title.detail") %></h2>
          <section>
            <%-- Identification --%>
            <h3 class="h3-like"> <%= glp("jcmsplugin.espaceCollection.oeuvre-bdd.full.detail.identification") %></h3>
            <table>
              <tbody>
                <jalios:if predicate="<%=Util.notEmpty(obj.getNumeroDinventaire(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "numeroDinventaire", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getNumeroDinventaire(userLang) %></td>
                </tr>
				        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getDepartement(loggedMember))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "departement", userLang) %></b></td>
                  <td class="table-detail">
                  <jalios:foreach collection="<%= obj.getDepartement(loggedMember) %>" type="Category" name="itCategory" > 
		                <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/motCle.jspf'%>
                  </jalios:foreach>
                  </td>
                </tr>
				        </jalios:if>

                <jalios:if predicate="<%=Util.notEmpty(obj.getTitre(userLang))%>">
                <tr>  
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "titre", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getTitre(userLang) %></td>
                </tr>
				        </jalios:if>
                
                <jalios:if predicate="<%=Util.notEmpty(obj.getDenomination(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "denomination", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getDenomination(userLang) %></td>
                </tr>
				        </jalios:if>
                
                <jalios:if predicate="<%=Util.notEmpty(obj.getAutresDesignations(userLang))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "autresDesignations", userLang) %></b></td>
                  <td class="table-detail"><%= obj.getAutresDesignations(userLang) %></td>
                </tr>
				        </jalios:if>
                
                <jalios:if predicate="<%=Util.notEmpty(obj.getDomaine(loggedMember))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "domaine", userLang) %></b></td>
                  <td class="table-detail">
                  <jalios:foreach collection="<%= obj.getDomaine(loggedMember) %>" type="Category" name="itCategory" >
		                <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/motCle.jspf'%>
                  </jalios:foreach>
                  </td>
                </tr>
				        </jalios:if>
                
                <jalios:if predicate="<%=Util.notEmpty(obj.getCollectionneur(loggedMember))%>">
                <tr>
                  <td class="table-detail"><b><%= channel.getTypeFieldLabel(FicheObjetBaseDeDonnees.class, "collectionneur", userLang) %></b></td>
                  <td class="table-detail">
                  <jalios:foreach collection="<%= obj.getCollectionneur(loggedMember) %>" type="Category" name="itCategory" >
		                <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/motCle.jspf'%>
                  </jalios:foreach>
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

      <aside class="col-4">
      <section class="ds44-box ds44-mb3">
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
        <section class="ds44-box ds44-theme ds44-mb3">
          <div class="ds44-innerBoxContainer">
            <button class="ds44-btnStd ds44-btn--invert"> 
              <span class="ds44-btnInnerText"><%=glp("jcmsplugin.espaceCollection.objet.tuile.fiche-media")%></span>
              <i class="icon icon-long-arrow-right" aria-hidden="true"></i>
            </button>
            <button class="ds44-btnStd"> 
              <i class="icon icon-star-empty" aria-hidden="true"></i>
              <span class="ds44-btnInnerText"><%=glp("jcmsplugin.espaceCollection.objet.tuile.ajout-selection")%></span>
            </button>
            
	          <%@ include file='/plugins/EspaceCollectionPlugin/jsp/modal/modalToutesLesImages.jspf'%>
            
          </div>
        </section>
      </aside>
    </div>
  </div>
</section>

<%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 6Uqnq1xAwSMyQHprMbDuuw== --%>