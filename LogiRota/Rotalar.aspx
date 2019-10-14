<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Rotalar.aspx.vb" Inherits="LogiRota.Rotalar" %>

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
    <form id="form1" runat="server" defaultbutton="BTN_ROTA_ARA">
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
                <li><asp:TextBox ID="TXT_ARA" runat="server" CssClass="TXT_ARA"></asp:TextBox></li>                
                <li><asp:Button ID="BTN_ROTA_ARA" runat="server" CssClass=" BtnAra"  ToolTip="Rota Ara"  /></li>	
                <%--<li><asp:Button ID="BTN_FIYAT_ARA" runat="server" CssClass="BtnAra" Visible="false" ToolTip="Fiyat Ara"  /></li>	               
                <li><a id="BtnIptal" runat="server" visible="false"  class="codrops-icon" href="CostAlisFiyati.aspx" title="IPTAL"><img src="Images/iptal2.png" /></a></li>
                <asp:Label ID="LBL_MALZEME_ID" runat="server" Visible="TRUE" ></asp:Label>
                <asp:Label ID="LBL_BITMIS_URUN_AMBALAJ_MALZEME_ID" runat="server" Visible="FALSE " ></asp:Label>
                <asp:Label ID="LBL_FIYATLISTESI_GUNCELLE_BU_ID" runat="server" Visible="FALSE " ></asp:Label>
                <asp:Label ID="LBL_FIYATLISTESI_GUNCELLE_BU_MALIYETI" runat="server" Visible="FALSE " ></asp:Label>
               <li><span>USD </span><asp:TextBox ID="TXT_USD" runat="server"></asp:TextBox></li>
                <li><span>EUR </span><asp:TextBox ID="TXT_EUR" runat="server"></asp:TextBox></li>--%>

                <li><a class="codrops-icon codrops-icon-drop">MENU - ROTALAR</a></li>
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
                    AlternatingRowStyle-CssClass="alt" PageSize="150">
                    <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                    <Columns>
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/select.png" ShowSelectButton="True" SelectText="Seç" HeaderStyle-BackColor="#ff8000"/>
                         <asp:templatefield  headertext="GÜNCELLE"  HeaderStyle-BackColor="#ff8000">                             
                              <headertemplate>                                
                                  <asp:Button ID="BTN_MALZEME_EKLE" runat="server"  CommandName="BTN_MALZEME_EKLE" CssClass="Btn_Grid_Cost_Urun_Ekle" />
                            </headertemplate>
                             <ItemTemplate>                                
                                 <asp:Button ID="Btn_Grid_Malzeme_Guncelle" runat="server" ToolTip="Guncelle"  OnClientClick="document.getElementById('DivYukleniyor').style.display='block'" CssClass="BtnGridGuncelle" CommandName="Btn_Grid_Malzeme_Guncelle" />
                                 <asp:Button ID="Btn_Grid_Malzeme_Sil" runat="server" ToolTip="Sil"  CssClass="BtnSil" CommandName="Btn_Grid_Malzeme_Sil" />                                 
                             </ItemTemplate>
                          </asp:templatefield>
                        
                        <asp:BoundField DataField="ROTA_ID" HeaderText="ID"   HeaderStyle-BackColor="#ff8000"/>                        
                        <asp:TemplateField  HeaderText ="ROTA KOD" HeaderStyle-BackColor="#ff8000"><ItemTemplate><asp:TextBox ID="txtROTA_KOD"  Width="250px" runat="server" Text='<%# Bind("ROTA_KOD")%>' ></asp:TextBox></ItemTemplate></asp:TemplateField>
                        <asp:TemplateField  HeaderText ="ROTA ADI" HeaderStyle-BackColor="#ff8000"><ItemTemplate><asp:TextBox ID="txtROTA_ADI"  runat="server" Text='<%# Bind("ROTA_ADI")%>' ></asp:TextBox></ItemTemplate></asp:TemplateField>
                        <asp:TemplateField  HeaderText ="ROTA ADRESI" HeaderStyle-BackColor="#ff8000"><ItemTemplate><asp:TextBox ID="txtROTA_ADRESI"  runat="server" Text='<%# Bind("ROTA_ADRESI")%>' ></asp:TextBox></ItemTemplate></asp:TemplateField>
                       <asp:TemplateField  HeaderText ="GOOGLE_KOORDINAT_x" HeaderStyle-BackColor="#ff8000"><ItemTemplate><asp:TextBox ID="txtROTA_GOOGLE_KOORDINAT_x" runat="server" Text='<%# Bind("ROTA_GOOGLE_KOORDINAT_x")%>'></asp:TextBox></ItemTemplate></asp:TemplateField>                         
                        <asp:TemplateField  HeaderText ="GOOGLE_KOORDINAT_y" HeaderStyle-BackColor="#ff8000"><ItemTemplate><asp:TextBox ID="txtROTA_GOOGLE_KOORDINAT_y"  runat="server" Text='<%# Bind("ROTA_GOOGLE_KOORDINAT_y")%>' ></asp:TextBox></ItemTemplate></asp:TemplateField> 
                        
                    </Columns>
                    <PagerStyle CssClass="pgr"></PagerStyle>
                </asp:GridView>
</div>

          <div id="DivYukleniyor" class="YukleniyorArkaPlan" runat="server" visible="false"   >
                            <img style="position:absolute; margin:auto; height:500px;width:500px;" src="images/yukleniyor.gif" />
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
