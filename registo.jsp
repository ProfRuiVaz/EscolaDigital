<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           //Dados do contactos.html
           String nome, apelido, endereco, cidade, codpos, email, telefone; 
           nome = request.getParameter("nome");
           apelido  = request.getParameter("apelido");
           endereco = request.getParameter("endereco");
           cidade = request.getParameter("cidade");
           codpos = request.getParameter("codpostal");
           email = request.getParameter("email");
           telefone = request.getParameter("telefone");
           try{
           //conectar a BD
           Connection conecta;
           PreparedStatement st;
           Class.forName("com.mysql.cj.jdbc.Driver");
           conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/registoclientes", "root", "Pc_500000000");
           //inserir dados
           st = conecta.prepareStatement("INSERT INTO clientes VALUES(?,?,?,?,?,?,?)");
           st.setString(1, nome);           
           st.setString(2, apelido);
           st.setString(3, endereco);
           st.setString(4, cidade);
           st.setString(5, codpos);
           st.setString(6, email);
           st.setString(7, telefone);
           st.executeUpdate(); //Executa o comando
           out.print("Cliente inserido com sucesso");
            } catch (Exception x){
              out.print("Erro: " + x.getMessage());
            }
        %>
    </body>
</html>
