using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;

namespace CrudUsuarios
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErroMsg.Visible = false;
            DataLoad();
        }

        private void DataLoad()
        {
            ConnectionStringSettings getString = WebConfigurationManager.ConnectionStrings["UserDB"] as ConnectionStringSettings;

            if (getString != null)
            {

                string sql = "PRC_SELECT_USER";

                using (OracleConnection conn = new OracleConnection(getString.ConnectionString))
                {

                    try
                    {

                        conn.Open();

                        OracleCommand cmd = new OracleCommand(sql, conn);
                        cmd.CommandType = CommandType.StoredProcedure;

                        DataSet ds = new DataSet();
                        OracleDataAdapter da = new OracleDataAdapter(cmd);                        
                        da.Fill(ds);
                        GridView1.DataSource = ds;
                        GridView1.DataBind();

                        conn.Close();

                    }
                    catch (OracleException ex)
                    {
                        //Mostrando Erro na primeira pagina apenas para facilitar a visualizacao
                        lblErroMsg.Visible = true;
                        lblErroMsg.Text = $"Problemas com a conexão com o Oracle - Erro: {ex.Message}";
                        btnIncluir.Visible = false;
                    }
                }
            }
        }

        private void ExcluirUsuario(int usuarioId)
        {
            ConnectionStringSettings getString = WebConfigurationManager.ConnectionStrings["UserDB"] as ConnectionStringSettings;

            if (getString != null)
            {

                string sql = "PRC_DELETE_USER";

                using (OracleConnection conn = new OracleConnection(getString.ConnectionString))
                {

                    try
                    {

                        conn.Open();

                        OracleCommand cmd = new OracleCommand(sql, conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("P_UsuarioId_In", OracleDbType.Int32).Value = usuarioId;

                        cmd.ExecuteNonQuery();

                        conn.Close();

                    }
                    catch (OracleException ex)
                    {
                        //Mostrando Erro na primeira pagina apenas para facilitar a visualizacao
                        lblErroMsg.Visible = true;
                        lblErroMsg.Text = $"Problemas com a conexão com o Oracle - Erro: {ex.Message}";
                        btnIncluir.Visible = false;
                    }
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DataLoad();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            if (e.CommandName == "Excluir")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());
                int pk = Convert.ToInt32(GridView1.Rows[index].Cells[0].Text);

                lblCodigoExcluir.Text = Convert.ToString(pk);
                lblNOmeExcluir.Text = GridView1.Rows[index].Cells[1].Text;

                msgPopUp.Show();
            }
            else if (e.CommandName == "Alterar")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());
                int pk = Convert.ToInt32(GridView1.Rows[index].Cells[0].Text);

                Session["PkAlteracao"] = pk;
                Session["NomeAlteracao"] = HttpUtility.HtmlDecode(GridView1.Rows[index].Cells[1].Text);
                Session["CpfAlteracao"] = GridView1.Rows[index].Cells[2].Text;
                Session["DataNascimentoAlteracao"] = GridView1.Rows[index].Cells[3].Text;
                Session["SituacaoAlteracao"] = GridView1.Rows[index].Cells[4].Text;

                Response.Redirect($"Alterar.aspx");
            }
        }

        protected void btnExcluirSim_Click1(object sender, EventArgs e)
        {
            int usuarioId = Convert.ToInt32(lblCodigoExcluir.Text);
            ExcluirUsuario(usuarioId);
            DataLoad();
        }

        protected void btnExcluirNao_Click(object sender, EventArgs e)
        {
            msgPopUp.Hide();
        }

        protected void btnIncluir_Click(object sender, EventArgs e)
        {
            Response.Redirect("Incluir.aspx");
        }
    }
}