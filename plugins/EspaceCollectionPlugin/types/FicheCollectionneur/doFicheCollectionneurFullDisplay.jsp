<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% FicheCollectionneur obj = (FicheCollectionneur)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%>

<section class="ds44-container-large">
  <%@ include
    file='/plugins/EspaceCollectionPlugin/jsp/header/headerSimple.jspf'%>

  <div class="ds44-inner-container ds44-mtb3 ds44--l-padding-t">
    <div class="grid-12-small-1">
      <div class="col-7">
        <section class="ds44-contenuArticle" id="section1">
          <p class="ds44-introduction">
            <jalios:wysiwyg>
              <%= obj.getDescription() %>
            </jalios:wysiwyg>
          </p>
        </section>
        
        <%@ include file='/plugins/EspaceCollectionPlugin/jsp/utils/share.jspf'%>
      </div>

      <div class="col-1 grid-offset ds44-hide-tiny-to-medium"></div>

      <aside class="col-4 ds44-hide-tinyToLarge ds44-js-aside-summary">
        <section class="ds44-box">
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

          <section class="ds44-box ds44-theme">
            <div class="ds44-innerBoxContainer">
              <div class="ds44-mb3">
                <jalios:if predicate="<%= Util.notEmpty(obj.getNom()) %>">
                  <p class="ds44-docListElem mts">
                    <i class="icon icon-user ds44-docListIco" aria-hidden="true"></i>
                    <%= obj.getNom() %>
                  </p>
                </jalios:if>

                <jalios:if predicate="<%= Util.notEmpty(obj.getDateDeNaissance()) && Util.notEmpty(obj.getDateDeMort()) %>">
                  <p class="ds44-docListElem ds44-mt-std ds44-mb1">
                  <i class="icon icon-date ds44-docListIco" aria-hidden="true"></i>
                  <% 
                  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY");
                  %>
                  <%= simpleDateFormat.format(obj.getDateDeNaissance()).toUpperCase() %>
                    - <%= simpleDateFormat.format(obj.getDateDeMort()).toUpperCase() %></p>
                </jalios:if>

                <jalios:if predicate="<%= Util.notEmpty(obj.getDomaine(loggedMember)) %>">
                  <p class="ds44-docListElem ds44-mt-std ds44-mb2">
                    <i class="icon icon-directory ds44-docListIco" aria-hidden="true"></i>
                    <jalios:foreach collection="<%= obj.getDomaine(loggedMember) %>" type="Category" name="itCategory" >
                        <b><%= itCategory.getName() %></b>
                    </jalios:foreach>
                  </p>
                </jalios:if>
              </div>

              <div>
                <jalios:if predicate="<%= Util.notEmpty(obj.getDocumentTelechargeable()) %>">
                  <a href="<%= obj.getDocumentTelechargeable()%>" class="ds44-btnStd ds44-btn--invert ds44-mb1" download> 
                    <span class="ds44-btnInnerText"><%=glp("jcmsplugin.espaceCollection.btn.telecharger")%></span>
                    <i class="icon icon-long-arrow-right" aria-hidden="true"></i>
                  </a>
                </jalios:if>

                <button class="ds44-btnStd"> 
                  <i class="icon icon-star-empty" aria-hidden="true"></i>
                  <span class="ds44-btnInnerText"><%=glp("jcmsplugin.espaceCollection.objet.tuile.ajout-selection")%></span>
                </button>
              </div>

            </div>
          </section>
        </section>
      </aside>
    </div>
  </div>
</section>

<%@ include file='/plugins/EspaceCollectionPlugin/jsp/carrousel/carrouselCollectionneurOeuvres.jspf'%>
