<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css"/>
        <title>Clientes</title>
    </head>
    <body>
        <form>
            <label for="escolha">Escolha o campo de pesquisa:</label>
                <select name="escolha" id="escolha" onchange="mostrarOcultarCampo()">
                <option value="zero">ESCOLHA</option>
                <option value="mostrar">Nome</option>
                <option value="mostrar1">Telefone</option>
                <option value="mostrar2">Apelido</option>
                </select>
            
            <p>
            <div id="campo" class="hidden">
                <label for="pname">Nome</label>
                <input type="text" name="pnome" size="50" id="pname">
            </div>
            </p> 
            <p>
            <div id="campo1" class="hidden">
                <label for="ptelefone">Telefone</label>
                <input type="tel" name="ptelefone" size="15" id="ptelefone">
            </div>
            </p>
            <p>
            <div id="campo2" class="hidden">
                <label for="papelido">Apelido</label>
                <input type="text" name="papelido" size="30" id="papelido">
            </div>
            </p>
            <p>
                <input type="submit" value="Pesquisar">
            </p>
        <script>
            function mostrarOcultarCampo() {
                var escolha = document.getElementById("escolha").value;
                var campo = document.getElementById("campo");
                var campo1 = document.getElementById("campo1");
                var campo2 = document.getElementById("campo2");

                if (escolha === "mostrar") {
                    campo.style.display = "block";
                } else {
                    campo.style.display = "none";
                }
                if (escolha === "mostrar1") {
                    campo1.style.display = "block";
                } else {
                    campo1.style.display = "none";
                }
                if (escolha === "mostrar2") {
                    campo2.style.display = "block";
                } else {
                    campo2.style.display = "none";
                }
    }
        </script>
         
         
        </form>        
        <%
           String jsp_nome, jsp_telefone, jsp_apelido; 
           jsp_nome = request.getParameter("pnome");
           jsp_telefone = request.getParameter("ptelefone");
           jsp_apelido = request.getParameter("papelido");
           int resultados;
           
           try{
            //conectar a BD
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/registoclientes", "root", "Pc_500000000");
            //listar dados
            st = conecta.prepareStatement("Select * from clientes where telefone = ? OR nome = ? OR apelido = ?");
            st.setString(1, jsp_telefone);
            st.setString(2, jsp_nome);
            st.setString(3, jsp_apelido);
            ResultSet listacliente = st.executeQuery();
        %>
             <table>
                <tr>
                    <th>Nome</th><th>Apelido</th><th>Endereço</th><th>Cidade</th><th>Código Postal</th><th>E-Mail</th><th>Telefone</th>
                </tr>  
        <%
            while (listacliente.next()){
        %>

                <tr>
                    <td> <%= listacliente.getString("nome") %></td>
                    <td> <%= listacliente.getString("apelido") %></td>
                    <td> <%= listacliente.getString("endereco") %></td>
                    <td> <%= listacliente.getString("cidade") %></td>
                    <td> <%= listacliente.getString("codpos") %></td>
                    <td> <%= listacliente.getString("email") %></td>
                    <td> <%= listacliente.getString("telefone") %></td>
                </tr>
        <%
            }
            %>
                            </table>
            <% 
            } catch (Exception x){
              out.print("Erro: " + x.getMessage());
            }
        %>
    </body>
</html>
