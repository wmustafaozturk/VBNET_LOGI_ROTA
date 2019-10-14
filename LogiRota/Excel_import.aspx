<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Excel_import.aspx.vb" Inherits="LogiRota.Excel_import" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rotalar</title>
   <link rel="stylesheet" href="css/reset.css" type="text/css" media="all"/>      
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
        

    
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
		
		<meta name="description" content="Malatya Pazari" />
		<meta name="keywords" content="Malatya Pazari" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"/>
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>

   </head>
<body>
    <form id="form1" runat="server" defaultbutton="BTN_EXCEL_ARA">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

   <div class="container">
   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>	--%>

			<ul id="gn-menu" class="gn-menu-main">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<%--<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">							
								
								<li><a class="gn-icon gn-icon-cog" id="BTN_URUN_EKLE" runat="server">Ürün Ekle</a></li>								
								
							</ul>
						</div><!-- /gn-scroller -->
					</nav>--%>
				</li>
                <li><asp:TextBox ID="TXT_ARA" runat="server" CssClass="TXT_ARA"></asp:TextBox></li>                
                <li><asp:Button ID="BTN_EXCEL_ARA" runat="server" CssClass="BtnAra"  ToolTip="Rota Ara"  /></li>	                              
                 <li><a id="BTN_ExcelImport" runat="server" visible="TRUE"  class="codrops-icon"  title="EXCEL YÜKLE"><img src="Images/guncelle.png" /></a></li>
                <asp:Label ID="LBL_MALZEME_ID" runat="server" Visible="TRUE" ></asp:Label>
               <%-- <asp:Label ID="LBL_BITMIS_URUN_AMBALAJ_MALZEME_ID" runat="server" Visible="FALSE " ></asp:Label>
                <asp:Label ID="LBL_FIYATLISTESI_GUNCELLE_BU_ID" runat="server" Visible="FALSE " ></asp:Label>
                <asp:Label ID="LBL_FIYATLISTESI_GUNCELLE_BU_MALIYETI" runat="server" Visible="FALSE " ></asp:Label>
               <li><span>USD </span><asp:TextBox ID="TXT_USD" runat="server"></asp:TextBox></li>
                <li><span>EUR </span><asp:TextBox ID="TXT_EUR" runat="server"></asp:TextBox></li>--%>

                <li><a class="codrops-icon codrops-icon-drop">MENU - DOSYA YUKLE</a></li>
                <li><a class="codrops-icon" href="MENU.aspx"><img src="Images/home.png" /></a></li>
			</ul>
		
<%--ROTA DİV BAŞLANGIÇ--%>
<div id="FIYAT_LISTELERI_DIV" class="grid" runat="server"  >
                    <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="False"
                    GridLines="None"
                    AllowPaging="True"
                    CssClass="mGrid"
                    PagerStyle-CssClass="pgr"
                     OnSelectedIndexChanged = "secilenirenklendir"
                    AlternatingRowStyle-CssClass="alt" PageSize="50">
                    <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                    <Columns>
                                          
                        <asp:BoundField HeaderText="FIRMA_ADI" DataField="FIRMA_ADI" HeaderStyle-BackColor="#ff8000"/>  
                        <asp:BoundField HeaderText="SEHIR" DataField="SEHIR" HeaderStyle-BackColor="#ff8000"/>  
                        <asp:BoundField HeaderText="ILCE" DataField="ILCE" HeaderStyle-BackColor="#ff8000"/>  
                        <asp:BoundField HeaderText="URUN ADI" DataField="URUN_ADI" HeaderStyle-BackColor="#ff8000" /> 
                        <asp:BoundField HeaderText="IRSALIYE NO" DataField="IRSALIYE_NO" HeaderStyle-BackColor="#ff8000" />
                        <asp:BoundField HeaderText="PALET KG" DataField="PALET_KG" HeaderStyle-BackColor="#ff8000" />
                        <asp:BoundField HeaderText="URUN TESLIM ALINAN TARIH" DataField="URUN_TESLIM_ALINAN_TARIH" HeaderStyle-BackColor="#ff8000" DataFormatString="{0:d}" />
                        <asp:BoundField HeaderText="FIRMA DEPO TESLIM TARIHI" DataField="FIRMA_DEPO_TESLIM_TARIHI" HeaderStyle-BackColor="#ff8000" DataFormatString="{0:d}" />
                        <asp:BoundField HeaderText="PALET SAYISI" DataField="PALET_SAYISI" HeaderStyle-BackColor="#ff8000" />

                    </Columns>
                    <PagerStyle CssClass="pgr"></PagerStyle>
                </asp:GridView>
</div>

        
<%--MALZEME CİNSİ DİV BİTİŞ--%>
  <%-- </ContentTemplate>
</asp:UpdatePanel>--%>
</div><!-- /container -->

</form>
        <script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
		    new gnMenu(document.getElementById('gn-menu'));
		</script>
</body>
</html>

  

 