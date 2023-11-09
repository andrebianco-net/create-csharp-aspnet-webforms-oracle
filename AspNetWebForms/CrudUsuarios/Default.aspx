<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CrudUsuarios._Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="jumbotron">
        <asp:Button ID="btnIncluir" runat="server" CssClass="btn btn-primary" Width="100px" Text="Incluir" OnClick="btnIncluir_Click" />
        <br /><br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" BorderStyle="None" AllowPaging="True" AllowSorting="True" HorizontalAlign="Center" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField HeaderText="Código" DataField="UsuarioId" >
                <HeaderStyle BackColor="Black" BorderWidth="0px" ForeColor="White" />
                <ItemStyle BorderWidth="0px" CssClass="padding-left-codigo" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Nome" DataField="Nome" >
                <HeaderStyle BackColor="Black" BorderWidth="0px" ForeColor="White" />
                <ItemStyle BorderWidth="0px" HorizontalAlign="Left"/>
                </asp:BoundField>
                <asp:BoundField HeaderText="CPF" DataField="CPF" >
                <HeaderStyle BackColor="Black" BorderWidth="0px" ForeColor="White" />
                <ItemStyle BorderWidth="0px" HorizontalAlign="Left"/>
                </asp:BoundField>
                <asp:BoundField HeaderText="Nascimento" DataField="DataNascimento" >
                <HeaderStyle BackColor="Black" BorderWidth="0px" ForeColor="White" />
                <ItemStyle BorderWidth="0px" HorizontalAlign="Left"/>
                </asp:BoundField>
                <asp:BoundField HeaderText="Situação" DataField="Situacao" >
                <HeaderStyle BackColor="Black" BorderWidth="0px" ForeColor="White" />
                <ItemStyle BorderWidth="0px" HorizontalAlign="Left"/>
                </asp:BoundField>
                <asp:ButtonField ButtonType="Button" CommandName="Alterar" Text="Alterar">
                <ControlStyle CssClass="btn btn-success" Width="100px" />
                <HeaderStyle BackColor="Black" BorderWidth="0px" ForeColor="White" />
                <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
                </asp:ButtonField>
                <asp:ButtonField ButtonType="Button" CommandName="Excluir" Text="Excluir">
                <ControlStyle CssClass="btn btn-danger" Width="100px" />
                <HeaderStyle BackColor="Black" BorderWidth="0px" ForeColor="White" />
                <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
                </asp:ButtonField>
            </Columns>
            <PagerSettings FirstPageText="Primeira" LastPageText="Última" Mode="NumericFirstLast" NextPageText="Próxima" PageButtonCount="5" PreviousPageText="Anterior" />
            <PagerStyle BorderWidth="0px" BorderColor="#eeeeee" HorizontalAlign="Center"/>
        </asp:GridView>
        <asp:Label ID="lblErroMsg" runat="server" Text="lblErroMsg"></asp:Label>
    
    <asp:Label ID="lblHidden" runat="server" Text=""></asp:Label>
    <ajaxToolkit:ModalPopupExtender ID="msgPopUp" runat="server" TargetControlID="lblHidden" PopupControlID="divPopUp1" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
    <div id="divPopUp1" class="pnlBackGround">
        <div id="Header" class="headerPnlBackGround">Excluir</div>
        <hr />
        <div id="main" class="mainPnlBackGround">Deseja realmente excluir esse usuário?</div><br />
        <div id="main" class="mainPnlBackGround"><label>Código:</label><asp:Label ID="lblCodigoExcluir" runat="server" Text="Label" CssClass="lblExcluir"></asp:Label></div>
        <div id="main" class="mainPnlBackGround"><label>Nome:</label><asp:Label ID="lblNOmeExcluir" runat="server" Text="Label" CssClass="lblExcluir"></asp:Label></div>
        <hr />
        <div id="buttons" class="btnExcluir">
            <div id="DivBtnExcluirSim" class="btnExcluirSim"><asp:Button id="btnExcluirSim" CssClass="btn btn-danger" runat="server" text="Sim" OnClick="btnExcluirSim_Click1" /></div>
            <div id="DivBtnExcluirNao" class="btnExcluirNao"><asp:Button id="btnExcluirNao" CssClass="btn btn-primary" runat="server" text="Não" OnClick="btnExcluirNao_Click" /></div>
        </div>                
    </div>

    </div>
</asp:Content>



