using AjaxControlToolkit;
using Microsoft.Ajax.Utilities;
using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrudUsuarios
{
    public partial class Alterar : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            lblErroMsg.Visible = false;

            if (!Page.IsPostBack)
            {
                txtNomeAlterar.Text = Session["NomeAlteracao"].ToString();
                txtCpf.Text = Session["CpfAlteracao"].ToString();
                DateTime dataNascimento = Convert.ToDateTime(Session["DataNascimentoAlteracao"].ToString());
                dtNascimento.Text = dataNascimento.ToString("yyyy-MM-dd");

                DataLoadSituacao();

                cbxSituacao.Items.FindByText(Session["SituacaoAlteracao"].ToString()).Selected = true;
                
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            int pk = Convert.ToInt32(Session["PkAlteracao"].ToString());
            AlterarUsuario(pk, txtNomeAlterar.Text, txtCpf.Text, Convert.ToDateTime(dtNascimento.Text), Int32.Parse(cbxSituacao.SelectedValue));
            
            msgPopUpSucesso.Show();            
        }

        private void DataLoadSituacao()
        {
            ConnectionStringSettings getString = WebConfigurationManager.ConnectionStrings["UserDB"] as ConnectionStringSettings;

            if (getString != null)
            {

                string sql = "SELECT StatusId, Nome FROM StatusUsuario";

                using (OracleConnection conn = new OracleConnection(getString.ConnectionString))
                {

                    try
                    {

                        conn.Open();

                        OracleCommand cmd = new OracleCommand(sql, conn);
                        cmd.CommandType = CommandType.Text;
                        OracleDataReader dr = cmd.ExecuteReader();

                        using (var rows = cmd.ExecuteReader())
                        {
                            foreach (DbDataRecord row in rows)
                            {
                                cbxSituacao.Items.Add(new ListItem(row[1].ToString(), row[0].ToString()));
                            }
                        }

                        conn.Close();

                    }
                    catch (OracleException ex)
                    {
                        //Mostrando Erro na pagina apenas para facilitar a visualizacao
                        lblErroMsg.Visible = true;
                        lblErroMsg.Text = $"Problemas com a conexão com o Oracle - Erro: {ex.Message}";
                    }
                }
            }
        }

        private void AlterarUsuario(int usuarioId, string nome, string cpf, DateTime dataNascimento, int situacao)
        {
            ConnectionStringSettings getString = WebConfigurationManager.ConnectionStrings["UserDB"] as ConnectionStringSettings;

            if (getString != null)
            {

                string sql = "PRC_UPDATE_USER";

                using (OracleConnection conn = new OracleConnection(getString.ConnectionString))
                {

                    try
                    {

                        conn.Open();

                        OracleCommand cmd = new OracleCommand(sql, conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("P_UsuarioId_In", OracleDbType.Int32).Value = usuarioId;
                        cmd.Parameters.Add("P_Nome_In", OracleDbType.Varchar2).Value = nome;
                        cmd.Parameters.Add("P_CPF_In", OracleDbType.Int64).Value = cpf;
                        cmd.Parameters.Add("P_DataNascimento_In", OracleDbType.Date).Value = dataNascimento;
                        cmd.Parameters.Add("P_StatusId_In", OracleDbType.Int32).Value = situacao;

                        cmd.ExecuteNonQuery();

                        conn.Close();

                    }
                    catch (OracleException ex)
                    {
                        //Mostrando Erro na pagina apenas para facilitar a visualizacao
                        lblErroMsg.Visible = true;
                        lblErroMsg.Text = $"Problemas com a conexão com o Oracle - Erro: {ex.Message}";
                    }
                }
            }
        }

        protected void btnAlterarOk_Click(object sender, EventArgs e)
        {
            btnCancelar_Click(sender, e);
        }
    }
}