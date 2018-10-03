<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="StartBlocklyALPHA.GUI.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
       <header>
             
        <!-- ===========================
        HERO AREA
        =========================== -->
        <div id="hero" style="background-color:#d7f6ff">
            <div class="container herocontent" >
                <h1 class="wow fadeInUp" data-wow-duration="2s" style="font-size:70px; font-weight:bolder">Bienvenido a Start Blockly</h1>                
                <h3 class="wow fadeInDown" data-wow-duration="3s" style="font-size:40px;font-weight:bolder">
                    Aprende A Programar ¡Ya!
                </h3>            
            </div>
            <!-- Featured image on the Hero area -->
            <img class="heroshot wow bounceInUp" data-wow-duration="4s" src="../MasterPage/img/Startblockly.png" 
                alt="Featured Work" height="612"/>            
        </div><!--HERO AREA END-->        
                
     </header><!--header end-->     

    <!-- ===========================
    ABOUT SECTION START
    =========================== -->
     <div id="about" class="container">
        
        <!-- LEFT PART OF THE ABOUT SECTION -->
         <div class="col-md-6">
             <br /><br />
            <div class="row">
             <br /><br /><br /><br /><br /><br /><br />
             <h2 class="wow fadeInDown" data-wow-duration="2s">Bloques de Diversión</h2>

             <h4 class="wow fadeInUp" data-wow-duration="3s"> Programar nunca fue tan divertido. Start Blockly maneja bloques de colores llamativos para generar código.</h4>
             
             <!--<p class="wow fadeInDown" data-wow-duration="3s">I'm gonna build me an airport, put my name on it. Why, Michael? So you can fly away from your feelings? I don't care if it takes from now till the end of Shrimpfest.</p>-->
             <!--<p class="wow fadeInDown" data-wow-duration="3s">Bugger bag egg's old boy willy jolly scrote munta skive pillock, bloody shambles nose rag blummin' scrote narky ever so, Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>-->
             
             <!--<a class="dribbble-follow-button wow bounce" href="http://dribbble.com/srizon">Follow</a>-->
             </div> <!-- ABOUT INFO END -->
             
            
            <!--<div class="myapps row">
                <h5>Tools and apps I use everyday:</h5>
                
                <ul><!-- FAVORITE APP ICONS START --
                    <li><img class="wow animated bounceInUp" data-wow-duration="1s" src="img/photoshop.svg" alt="Photoshop"></li>
                    <li><img class="wow bounceInUp" data-wow-duration="2s" src="img/illustrator.svg" alt="Illustrator"></li>
                    <li><img class="wow bounceInUp" data-wow-duration="3s" src="img/flash.svg" alt="Adobe Flash"></li>
                    <li><img class="wow animated bounceInUp" data-wow-duration="4s" src="img/after_effects.svg" alt="After Effects"></li>
                    <li><img class="wow bounceInUp" data-wow-duration="5s" src="img/indesign.svg" alt="InDesign"></li>
                </ul><!-- FAVORITE APP ICONS END --
            </div>-->
         </div><!-- LEFT PART OF THE ABOUT SECTION END -->
        <!--Left part end-->
         
         <!-- RIGHT PART OF THE ABOUT SECTION -->
         <div class="col-md-6 wow fadeInUp myphoto" data-wow-duration="4s">
             <img src="../MasterPage/img/user.png" alt="Mamun Srizon"/>
         </div><!-- RIGHT PART OF THE ABOUT SECTION END -->        
     </div><!-- ABOUT SECTION END -->
    <hr/><!-- SECTION SEPARETOR LINE -->
        
    <!-- ===========================
    SERVICE SECTION START
    =========================== -->
    <div id="services" class="container">
       
        <!-- SERVICE SECTION HEADING START -->
        <div class="sectionhead  row wow fadeInUp">
            <!--<span class="bigicon icon-cup "></span>-->
            <h3>¿Qué es Blockly?</h3>
            <hr class="separetor"/>
         </div><!--SERVICE SECTION HEADING END-->
         
        <!-- SERVICE ITEMS START -->
        <div class="row">
               <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
                   <img src="../MasterPage/img/s1.png" alt=""/>
                   <h4>Lenguaje Gráfico</h4>
                   <p>Start Blockly es un lenguaje de programación visual compuesto por un sencillo conjunto de comandos que podemos combinar como si fueran las piezas de un rompecabezas. Es una herramienta muy útil para el que quiera aprender a programar de una forma intuitiva y simple.</p>
                </div> <!-- ITEM END -->

                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
                   <img src="../MasterPage/img/s2.png" alt=""/>
                   <h4>Fácil</h4>
                   <p>Start Blockly permite arrastrar los distintos componentes de control, lógica, operaciones matemáticas, texto, listados y procesos para crear sencillos scripts que podremos exportar al lenguaje coloquial. De momento, Blockly se encuentra en una versión preliminar la cual de acuerdo a los bloques traduce al lenguaje de programación C#, nosotros crearemos la versión dirigida a aquellos programadores principales ya que los bloques lo traduciremos al lenguaje coloquial lo cual ayudara a entender la lógica de programación.</p>
                </div> <!-- ITEM END -->

                <!--<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
                   <img src="../MasterPage/img/s3.png" alt=""/>
                   <h4>iOS App Design</h4>
                   <p>Grinder affogato, dark, sweet carajillo, flavour seasonal aroma single origin cream. Percolator. Eligendi impedit dolores nulla.</p>
                </div> <!-- ITEM END -->

               <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
                   <img src="../MasterPage/img/s4.png" alt=""/>
                   <h4>Accesible</h4>
                   <p>Start Blockly permite a los programadores principiantes a concentrarse en la lógica. Se le ofrece una serie de comandos y cómo se pueden colocar juntos. No hay paréntesis desequilibrados, cadenas de escape, no hay puntos y coma que falten.</p>
                </div> <!-- ITEM END -->

                <!--<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
                   <img src="../MasterPage/img/s5.png" alt=""/>
                   <h4>Brand Identity Design</h4>
                   <p>Grinder affogato, dark, sweet carajillo, flavour seasonal aroma single origin cream. Percolator. Eligendi impedit dolores nulla.</p>
                </div> <!-- ITEM END -->

                <!--<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
                   <img src="../MasterPage/img/s6.png" alt=""/>
                   <h4>CMYK Print Design</h4>
                   <p>Grinder affogato, dark, sweet carajillo, flavour seasonal aroma single origin cream. Percolator. Eligendi impedit dolores nulla.</p>
                </div> <!-- ITEM END -->
        </div><!-- SERVICE ITEMS END-->
    </div><!-- SERVICE SECTION END -->
    
    <!-- ===========================
    PORTFOLIO SECTION START
    =========================== --
    <div id="portfolio">
        <div class="sectionhead wow bounceInUp" data-wow-duration="2s">
          <span class="bigicon icon-rocket"></span>
           <h3>A few recent works</h3>
           <hr class="separetor">            
        </div><!-- PORTFOLIO SECTION HEAD END --   
        
        <!-- PORTFOLIO ITEMS START --
        <div class="portfolioitems container">
            <ul>
                <div id="shotsByPlayerId"></div>
            </ul><!--REFER TO THE js/drifolio.js--
        </div><!-- PORTFOLIO ITEMS END -->
        
        <!--Replace the URL below with your dribbble profile URL--
        <a class="btn btn-default wow fadeInUp" href="http://dribbble.com/srizon" role="button">
            <span class="btnicon icon-social-dribbble"></span>
            <span class="button_text">View all items</span>
        </a> 
    </div><!-- PORTFOLIO SECTION END --> 
    <br /><br /><br /> 
</asp:Content>
