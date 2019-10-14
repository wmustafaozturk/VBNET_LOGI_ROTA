<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RotaPlanlama.aspx.vb" Inherits="LogiRota.RotaPlanlama" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rota Planlama</title>
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


<script type="text/javascript">
    function MSG_URUN_ARA() {

        $.msgBox({
            title: "LOGI TOTA",
            content: "Aradığınız Ürün Bulunamadı"
        });
    }

    function UrunGuncellenmistir() {
        $.msgBox({
            title: "LOGI TOTA",
            content: "Ürün Güncellenmiştir.."
        });
    }

    function MalzemeSeciniz() {
        $.msgBox({
            title: "LOGI TOTA",
            content: "Malzeme Seçiniz.."
        });
    }
    
    function UrunSilinmistir() {
        $.msgBox({
            title: "LOGI TOTA",
            content: "Ürün Silinmiştir..."
        });
    }

    function MSG_FLISTESI_URUN_KONTROL() {

        $.msgBox({
            title: "LOGI TOTA",
            content: "Fiyat Listesinde Ürün Bulunamadı"            
        });
        window.location.href("Fiyatlisteleri.aspx")
    }

    function SayfaYukle() {              
        window.open("Fiyatlisteleri.aspx")
    }
    </script>

</head>
<body>
    <form id="form1" runat="server" >
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

   <div class="container">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>	

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
                <%--<li><asp:TextBox ID="TXT_ARA" runat="server" CssClass="TXT_ARA"></asp:TextBox></li>                
                <li><asp:Button ID="BTN_EXCEL_ARA" runat="server" CssClass=" BtnAra"  ToolTip="Rota Ara"  /></li>	                              
                 <li><a id="BTN_ExcelImport" runat="server" visible="TRUE"  class="codrops-icon"  title="EXCEL YÜKLE"><img src="Images/iptal2.png" /></a></li>
                <asp:Label ID="LBL_MALZEME_ID" runat="server" Visible="TRUE" ></asp:Label>--%>
               <%-- <asp:Label ID="LBL_BITMIS_URUN_AMBALAJ_MALZEME_ID" runat="server" Visible="FALSE " ></asp:Label>
                <asp:Label ID="LBL_FIYATLISTESI_GUNCELLE_BU_ID" runat="server" Visible="FALSE " ></asp:Label>
                <asp:Label ID="LBL_FIYATLISTESI_GUNCELLE_BU_MALIYETI" runat="server" Visible="FALSE " ></asp:Label>
               <li><span>USD </span><asp:TextBox ID="TXT_USD" runat="server"></asp:TextBox></li>
                <li><span>EUR </span><asp:TextBox ID="TXT_EUR" runat="server"></asp:TextBox></li>--%>

                <li><a class="codrops-icon codrops-icon-drop">MENU - ROTA PLANLAMA</a></li>
                <li><a class="codrops-icon" href="MENU.aspx"><img src="Images/home.png" /></a></li>
			</ul>
		
<%--ROTA DİV BAŞLANGIÇ--%>
<div id="FIYAT_LISTELERI_DIV" class="grid" runat="server"  >

                <%-- <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="False"
                    GridLines="None"
                    AllowPaging="True"
                    CssClass="mGrid"
                    PagerStyle-CssClass="pgr"
                     
                    AlternatingRowStyle-CssClass="alt" PageSize="50">
                    <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                    <Columns>                                          
                        <asp:BoundField HeaderText="TIR ADET" DataField="TIR_ADET" HeaderStyle-BackColor="#ff8000" ControlStyle-Height="90PX"/>                          
                    </Columns>
                    <PagerStyle CssClass="pgr"></PagerStyle>
                </asp:GridView>--%>
  
</div>
  <div style="width: 800px;
    height: 400px;
    padding: 10px;
    background-color: skyblue;
    position: absolute;
    top: 70%;
    left: 50%;
    margin-left: -300px;
    margin-top: -300px;">
    <asp:Repeater ID="Repeater1" runat="server"   >
    <ItemTemplate>
        <asp:Image ID="Image1"  runat="server" ImageUrl="images/tir.png" /> 
        <br />
        <asp:Label ID="Label2" runat="server" Text="Tır Adeti: " Font-Bold="true" Font-Size="XX-Large" ></asp:Label>
         <asp:Label ID="Label1" runat="server" Text=' <%# Eval("TIR_ADET") %>' Font-Bold="true" Font-Size="XX-Large"  ></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Toplam Kg: " Font-Bold="true" Font-Size="XX-Large" ></asp:Label>
         <asp:Label ID="Label4" runat="server" Text=' <%# Eval("TOPLAM_KG") %>' Font-Bold="true" Font-Size="XX-Large"  ></asp:Label>
         <br />
        <asp:Label ID="Label5" runat="server" Text="Kalan Kg: " Font-Bold="true" Font-Size="XX-Large" ></asp:Label>
         <asp:Label ID="Label6" runat="server" Text=' <%# Eval("KUSURAT") %>'  Font-Bold="true" Font-Size="XX-Large"  ></asp:Label>
    </ItemTemplate>
</asp:Repeater>
        </div>
        
<%--MALZEME CİNSİ DİV BİTİŞ--%>
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
