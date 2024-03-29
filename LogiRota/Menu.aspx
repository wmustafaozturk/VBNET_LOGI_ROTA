﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Menu.aspx.vb" Inherits="LogiRota.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rota 61</title>
   <link rel="stylesheet" href="css/reset.css" type="text/css" media="all"/>
      <link href='http://fonts.googleapis.com/css?family=Asap' rel='stylesheet' type='text/css'/>
       <link rel="stylesheet" href="css/grid.css" type="text/css" media="all" />
      <script type="text/javascript" src="js/jquery-1.6.js" ></script>
      <script type="text/javascript" src="js/script.js"></script>
      <script type="text/javascript" src="js/content_switch.js"></script>
      <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
      <script type="text/javascript" src="js/superfish.js"></script>
      <script type="text/javascript" src="js/forms.js"></script>
      <script type="text/javascript" src="js/bgStretch.js"></script>
      <script type="text/javascript" src="js/jquery.color.js"></script>
      <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
      <script type="text/javascript" src="js/jquery-ui.js"></script>
      <script type="text/javascript" src="js/cScroll.js"></script>
      <script type="text/javascript" src="js/jcarousellite.js"></script>
      <script src="js/googleMap.js" type="text/javascript"></script>
      <script src="js/jquery.msgBox.js" type="text/javascript"></script>
      <link href="css/msgBoxLight.css" rel="stylesheet" type="text/css"/>
      <link rel="stylesheet" type="text/css" media="screen" href="ana_slider/css/slider.css"/>
        <script type="text/javascript" src="ana_slider/js/tms-0.4.x.js"></script>
        

    <meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
		
		<meta name="description" content="Rota" />
		<meta name="keywords" content="Rota" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"/>
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>



</head>
<body>
    <form id="form1" runat="server">
   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

   <div class="container">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>	

			<ul id="gn-menu" class="gn-menu-main">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								
								<%--<li><a class="gn-icon gn-icon-cog">....</a></li>
								<li id="BtnKullanici" runat="server"><a class="gn-icon gn-icon-cog" href="#">...</a></li>--%>
								
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li id="BtnDosyaYukle" runat="server" ><a href="Excel_import.aspx">Dosya Yükle</a></li>
				<li id="BtnRotalar" runat="server" ><a href="Rotalar.aspx">Rotalar</a></li>
                <li id="BtnDepolar" runat="server" ><a href="Depolar.aspx">Depolar</a></li>
                <li id="BtnTeslimatNoktalari" runat="server" ><a href="TeslimatNoktalari.aspx">Teslimat Noktaları</a></li>
                <li id="BtnRotaPlanlama" runat="server" ><a href="RotaPlanlama.aspx">Rota Planlama</a></li>
               <%-- <li id="BtnBayiFiyatListeleri" runat="server" visible="false" ><a href="fiyatgosterbayi.aspx">Bayi Fiyat Listeleri</a></li>--%>
                <li><a class="codrops-icon codrops-icon-drop" href="#"><span>|||</span></a></li>
                
			</ul>
		



</ContentTemplate>
</asp:UpdatePanel>
</div><!-- /container -->

</form>

        <script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
		    new gnMenu(document.getElementById('gn-menu'));
		</script>
</body>
</html>

