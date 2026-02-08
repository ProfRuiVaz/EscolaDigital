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
        <%
           try{
            //conectar a BD
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/registoclientes", "root", "Pc_500000000");
            //listar dados
            st = conecta.prepareStatement("Select * from clientes");
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
