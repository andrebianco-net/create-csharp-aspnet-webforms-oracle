<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alterar.aspx.cs" MasterPageFile="~/Site.Master" Inherits="CrudUsuarios.Alterar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:Button ID="btnSalvar" runat="server" CssClass="btn btn-success" Width="100px" Text="Salvar" OnClick="btnSalvar_Click" />
        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-warning" Width="100px" Text="Cancelar" CausesValidation="False" OnClick="btnCancelar_Click" />
        <br />
        <br />

        <div class="form-group" style="display: inline-block; vertical-align: top;">
            <label for="txtNomeAlterar">Nome</label>
            <asp:TextBox ID="txtNomeAlterar" runat="server" CssClass="form-control nomeAlterar"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNomeAlterar" ErrorMessage="Informe o Nome do usuário" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group" style="display: inline-block; width:270px !important;">
            <label for="txtCpf">CPF</label>
            <asp:TextBox ID="txtCpf" runat="server" CssClass="form-control" MaxLength="11"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCpf" ErrorMessage="Informe o CPF do usuário" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regular2"
                ControlToValidate="txtCpf" runat="server"
                ErrorMessage="Somente números são permitidos"
                ForeColor="Red"
                ValidationExpression="\d+">                
            </asp:RegularExpressionValidator>
        </div>
        <div class="form-group" style="display: inline-block; vertical-align: top;">
            <label for="dtNascimento">Nascimento</label>
            <asp:TextBox Type="date" ID="dtNascimento" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dtNascimento" ErrorMessage="Informe a Data de Nascimento do usuário" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group" style="display: inline-block; vertical-align: top;">
            <label for="cbxSituacao">Situação</label>
            <asp:DropDownList ID="cbxSituacao" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
        <asp:Label ID="lblErroMsg" runat="server" Text="Label"></asp:Label>

        <asp:Label ID="lblHidden" runat="server" Text=""></asp:Label>
        <ajaxToolkit:ModalPopupExtender ID="msgPopUpSucesso" runat="server" TargetControlID="lblHidden" PopupControlID="divPopUp1" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
        <div id="divPopUp1" class="pnlBackGround">
            <div id="Header" class="headerPnlBackGround">Sucesso</div>
            <hr />
            <div id="main" class="mainPnlBackGround">Alteração realizada com sucesso!</div><br />
            <hr />
            <div id="buttons" class="btnAlterar">
                <div id="DivBtnAlterarOk" class="btnAlterarOk"><asp:Button id="btnAlterarOk" CssClass="btn btn-primary" runat="server" text="Ok" OnClick="btnAlterarOk_Click" /></div>
            </div>                
        </div>
    </div>

</asp:Content>
