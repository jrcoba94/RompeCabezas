<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Juegos.aspx.cs" Inherits="StartBlocklyALPHA.GUI.Juegos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- ===========================
    TESTIMONIAL SECTION START
    =========================== -->
    <div id="testimonials" class="container">
        <div class="sectionhead wow bounceInUp" data-wow-duration="2s">
           <span class="bigicon icon-bubbles"></span>
           <h3>Juegos</h3>
           <h4>Bienvenido a la sección de juegos de StartBlockly</h4>
           <hr class="separetor"/>            
        </div><!-- TESTIMONIAL SECTIONHEAD END -->
        
        <!-- TESTIMONIAL ITEMS START -->
        <div class="">
            <!-- 1ST TESTIMONIAL ITEM -->
            <div class="col-md-6 wow bounceIn" data-wow-duration="2s">
                <div class="clientsphoto">
                    <img src="../Recursos/imgenes/static_avatar.png" alt="Dan" style="width:160px"/>
                </div>
                
                <div class="quote">
                    <blockquote> 
                       <p>Este juego consiste en dibujar fíguras geométricas utilizando los bloques, para poder pasar de nivel debes de terminar de dibujar la figura, el juego consiste en 3 niveles diferentes.</p>                        
                    </blockquote>
                    <h5>Juego Dibujar</h5>
                    <a href="../MasterPage/JuegoDibujar.aspx">Ir al Juego</a>
                </div>                
            </div><!-- 1ST TESTIMONIAL ITEM END -->
            <br /><br /><br /><br /><br /><br /><br />
            <!-- 2ND TESTIMONIAL ITEM -->
            <div class="col-md-6 wow bounceIn" data-wow-duration="3s">
                <div class="clientsphoto">
                    <img src="../Recursos/imgenes/pato.png" alt="Bill" style="width:160px"/>
                </div>
                
                <div class="quote">
                    <blockquote>
                       <p>Este juego consiste en 3 niveles en que el usuario controle un pato intentando volar, desplazandose de arriba a bajo con el fin de llegar hacia el objetivo que se encuentra ubicado en diferentes posiciones.</p>                        
                    </blockquote>
                    <h5>Juego Pato</h5>
                    <a href="../MasterPage/JuegoPato.aspx">Ir al Juego</a>
                </div>                
            </div><!-- 2ND TESTIMONIAL ITEM END -->
            <br /><br /><br /><br /><br />
            <!-- 3RD TESTIMONIAL ITEM -->
            <div class="col-md-6 wow bounceIn" data-wow-duration="3s">
                <div class="clientsphoto">
                    <img src="../Recursos/imgenes/12.png" alt="Eric" style="width:160px"/>
                </div>
                
                <div class="quote">
                    <blockquote>
                       <p>Este juego consite en hacer que el personaje llegue hacia el objetivo que es encontrar su mascota.</p>                        
                    </blockquote>
                    <h5>Perro Perdido</h5>
                    <a href="../JuegoPerro/Nivel1.aspx">Ir al Juego</a>
                </div>                
            </div><!-- 3RD TESTIMONIAL ITEM END -->
            
            <!-- 4TH TESTIMONIAL ITEM --
            <div class="col-md-6 wow bounceIn" data-wow-duration="2s">
                <div class="clientsphoto">
                    <img src="../MasterPage/img/ramil.jpg" alt="Ramil"/>
                </div>
                
                <div class="quote">
                    <blockquote>
                       <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia et pariatur ipsam tempora officia ea iusto expedita, nulla, hic odit saepe repellat nesciunt dolorum, officiis laborum ad, aliquam. Quos, et.</p>                        
                    </blockquote>
                    <h5>Ramil Derogongun</h5>
                    <p>Visual Designer, Bluroon</p>
                </div>                
            </div><!-- 4TH TESTIMONIAL ITEM END -->
        </div>        
    </div><!-- TESTIMONIAL SECTION END -->
    <br /><br /><br /><br /><br />
</asp:Content>
