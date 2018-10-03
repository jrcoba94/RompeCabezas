<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Nivel2.aspx.cs" Inherits="StartBlocklyALPHA.JuegoPerro.Nivel2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <html>
  <script src="Juego1/js1/jquery-2.1.4.min.js" type="text/javascript"></script>
  <script src="../boostrap/bootstrap.min.js"></script>
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">      
  <title>Blockly</title>
  
  <link rel="stylesheet" href="../css/header.css">
<!--<link rel="stylesheet" href="css/main.css">-->
<link rel="stylesheet" href="../css/style.css">
<!--<link rel="stylesheet" href="css/modalPlugin.css">-->
<link rel="stylesheet" href="../boostrap/bootstrap.min.css">

<link rel="stylesheet" href="../js1/highlight/railscasts.css">
  <script src="Juego1/juego/level/json/tileSimbolo.js"></script>
<script src="Juego1/blocky_compressed.js"></script>
<script src="Juego1/blocks_compressed.js"></script>
<script src="Juego1/javascript_compressed.js"></script>
<script src="Juego1/js/es.js"></script>
<script src="Juego1/blocks/movimiento.js"></script>
<script src="Juego1/generators/movimiento.js"></script>
<script src="Juego1/jsinterpreter/acorn_interpreter.js"></script>
</head> 
  <body>
       &nbsp;&nbsp;<img src="img/about/imag22.png" />
    <div id="container" class="container-fluid">
      <input id="i-level" type="hidden" value="1" />
      <input id="i-maxlevel" type="hidden"
             value="20" />
      
      <div class="row">
        <header>

</header> 

        <div class="col-xs-5 top-space" style="background-color: white">
             <br />
          <br />  
          <br /> 
          <div id="gameDiv"></div>

<!--<div id="current-level"><div>Nivel 1</div></div>-->
<%--<div id="buttons">--%>
    <br />
    <asp:HyperLink ID="HyperLink1" onclick="ejecutar_javascript()" runat="server" BorderColor="#FFCC00" CssClass="btn active" BackColor="#FED136" ForeColor="White">INICIAR</asp:HyperLink>
    &nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" onclick="mostrar_javascript()" runat="server" BorderColor="#FFCC00" CssClass="btn active" BackColor="#FED136" ForeColor="White">MOSTRAR CÓDIGO</asp:HyperLink>
    &nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink3" href="../GUI/Juegos.aspx" runat="server" BorderColor="#FFCC00" CssClass="btn active" BackColor="#FED136" ForeColor="White">SALIR</asp:HyperLink>
  <%--<div class="col-xs-6" style="padding: 5px 5px 5px 0">
    <button class="btn-lg btn btn-success btn-block" id="exec-button1"
    onclick="ejecutar_javascript()">Iniciar <span class="glyphicon glyphicon-play"></span></button>
  </div>--%>
<%--  <div class="col-xs-6" style="padding: 5px 0 5px 5px">
    <button class="btn btn-lg btn-info btn-block" id="js-button" onclick="mostrar_javascript()">Mostrar c&oacute;digo</button>
  </div>--%>
<%--</div>--%>

<div id="game-info" class="col-xs-12" style="padding-left: 0px;
                                             padding-right: 0px;">
  <span id="game-info-title"></span>
    <br />
 <%-- <div class="bg-info" id="game-info-desc">
      Descripci&oacute;n del nivel actual (este texto es para rellenar
      la descripci&oacute;n)
  </div>--%>
</div>
        </div>
        
        <div class="col-xs-7 top-space">
          <div class="col-xs-4" style="padding-left: 0;
                                       padding-right: 0">
            <h5>Acciones disponibles</h5>
          </div>
          <div class="col-xs-4" style="padding-left: 0;
                                       padding-right: 0">
            <h5>Acciones a realizar </h5>
          </div>
            <div class="col-xs-4" style="padding-left: 0;
                                       padding-right: 0">
            <h5>NIVELES DEL JUEGO</h5>
                 &nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink9" href="Nivel1.aspx" runat="server">1</asp:HyperLink>
               &nbsp;&nbsp;
              <asp:HyperLink ID="HyperLink10" href="Nivel2.aspx" runat="server">2</asp:HyperLink>
              &nbsp;&nbsp;
              <asp:HyperLink ID="HyperLink11" href="Nivel3.aspx" runat="server">3</asp:HyperLink>
               &nbsp;&nbsp;
              <asp:HyperLink ID="HyperLink12" href="Nivel4.aspx" runat="server">4</asp:HyperLink>
              &nbsp;&nbsp;
              <asp:HyperLink ID="HyperLink13" href="Nivel5.aspx" runat="server">5</asp:HyperLink>
          </div>
	  <div id="blocklyDiv"></div>
          
        </div>
      </div>


      
          
      <xml id="toolbox" style="display: none">
    <block type="avanzar"></block>
	<block type="girar">
		<field name="sentido">izquierda</field>
	</block>
	<block type="girar">
		<field name="sentido">derecha</field>
	</block>
  </xml>

  <xml id="startBlocks" style="display: none">
	<block type="al_ejecutar" x="32" y="32"></block>
  </xml>
<div class="modal modalWindowMessages">
  <div id="hoc-fm1" >Bienvenido! Has sido escogido para aprender a utilizar el poder infinito de la programaci&oacute;n! (o cualquier mensaje que se desee c:).</div>
  <div id="sizedMessages">
    <span id="hoc-sm1">Pantalla de juego</span>
    <span id="hoc-sm2">Arrastra m&aacute;s bloques debajo de este!</span>
    <span id="hoc-sm3">Revisa el c&oacute;digo que has creado y ejec&uacute;talo en el juego!</span>
  </div>
</div>
     <%-- <!--Welcome-->
<div id="welcomeModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title text-center">Nivel 1</h3>
      </div>
      <div class="modal-body" style="height: 120px">
        <div class="col-xs-2">
          <div class="welcome-image"><img src="" width="64"/></div>
        </div>
        <div class="col-xs-10">
          <p id="welcome-message">One fine body&hellip;</p>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar esta ventana</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->--%>

<!--Help-->
<div id="helpModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title text-center help-title">¿Necesitas ayuda?</h3>
      </div>
      <div class="modal-body">
        <p class="help-message">One fine body&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar esta ventana</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!--Muralla-->
<div id="murallaModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title text-center">¡Oh, no!</h3>
      </div>
      <div class="modal-body">
        <p>Has chocado con un obst&aacute;culo. Revisa bien tus pasos y gira cuando sea necesario.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger completed-repeat-btn">Reintentar</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar esta ventana</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!--forModal ?-->
<div id="emptyForErrorModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title text-center">Nivel 1</h3>
      </div>
      <div class="modal-body">
        <p id="welcome-message">One fine body&hellip;</p>
        <div class="welcome-image"><img src="" /></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger completed-repeat-btn">Reintentar</button>
        <button type="button" class="btn btn-warning completed-help-btn">Necesito ayuda</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Bloques sueltos -->
<div id="errorModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title text-center">¡Oh, no!</h3>
      </div>
      <div class="modal-body">
        <p>&iexcl;Tienes bloques sueltos! Aseg&uacute;rate de que todos los bloques que uses est&aacute;n conectados al bloque "al inicio".</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar esta ventana</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- JS -->
<div id="jsModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title text-center">Código generado</h3>
      </div>
      <div class="modal-body">
        <div class="col-xs-6">
          <p class="text-left">Llevas <strong id="codelines"></strong> líneas de código.</p>
        </div>
        <%--<div class="col-xs-6">
          <p class="text-right">Has
          completado <strong id="nlevels"></strong> niveles.</p>
        </div>--%>
        <p>
          <pre><code id="codigoJS" class="javascript"></code></pre>
        </p>
      </div>
      <div class="modal-footer">
        <%--<button type="button" class="btn btn-success completed-next-btn invisible">Siguiente Nivel &nbsp;<span class="glyphicon glyphicon-play"></span></button>--%>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar esta ventana</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Codigo vacio -->
<div id="codigoVacioModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title text-center">¡Oh, no!</h3>
      </div>
      <div class="modal-body">
        <p>No has puesto bloques... Arrastra bloques en "Acciones disponibles" hasta el bloque "al inicio" para que estos se ejecuten.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar esta ventana</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Nivel completado -->
<div id="completedModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title text-center">¡Has completado el nivel!</h3>
      </div>
      <div class="modal-body">
        <p>Completaste el nivel. ¡Felicidades!</p>
        <%--<p class="completedExtra">Este nivel pudo ser completado utilizando solamente <span class="blockNumber"></span> bloques. Puedes volver a intentarlo.</p>--%>
      </div>
      <div class="modal-footer">
        <a href="Nivel3.aspx" class="page-scroll btn btn-primary">Siguiente Nivel</a>
        <button type="button" class="btn btn-primary completed-repeat-btn">Repetir nivel</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar esta ventana</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div id="incompletedModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title text-center">¡Aún no has completado este nivel!</h3>
      </div>
      <div class="modal-body">
        <p>Intenta utilizar tus bloques de manera diferente o agregar m&aacute;s para alcanzar los objetivos.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger completed-repeat-btn">Reintentar</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar esta ventana</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- failed -->
<div id="failedModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title text-center">¡Has fallado!</h3>
      </div>
      <div class="modal-body">
        <p>Debes utilizar el bloque <b><span class="incompleted-block">bloque_x</span></b> para completar este nivel.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger completed-repeat-btn">Reintentar</button>
        <button type="button" class="btn btn-warning completed-help-btn">Necesito ayuda</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- video -->
<div id="videoModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div id="video-modal-body" class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar esta ventana</button>
      </div>
    </div><!-- /.modal-content --> 
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%--<!-- Copyright -->
<div id="copyrightModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title text-center">Copyright</h3>
      </div>
      <div class="modal-body" style="font-size: 14px">
        <p>
          Agradecemos a todos quienes han colaborado con el desarrollo
          y diseño de este juego, además de la producción y edición de
          los vídeos tutoriales.
        </p>
        <p>
          Personaje Mario Hugo pertenece a &copy; Producciones Aplaplac Ltda.
          Todos los derechos reservados.
        </p>
        <p>
          Juego desarrollado
          en <a href="https://developers.google.com/blockly/">Blockly</a>
          y <a href="http://craftyjs.com/">Crafty</a>.
        </p>--%>
<%--        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar esta ventana</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->--%>


      
      <!--<script src="js/modalPlugin.js"></script>-->
      
      <script src="Juego1/level_2.js"></script>
      <script src="Juego1/js1/content.js"></script>
      <script src="Juego1/crafty/crafty-min.js"></script>
      <script src="Juego1/juego/juego4.js"></script>
      <script src="Juego1/js1/blockyInit.js"></script>

      <script src="Juego1/js1/highlight.packs.js"></script>


    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-67801102-2', 'auto');
        ga('send', 'pageview');

</script>
        <br /><br /><br /><br /><br />
  </body>
</html>
</asp:Content>
