<%@ page import="java.sql.*" %>

<%
    String url = "jdbc:postgresql://db.mnbvvmeveiipkwalashs.supabase.co:5432/postgres?;
    String user = "postgres";
    String password = "Digit@l22-23_2025";

    Connection conn = null;

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(url, user, password);
        out.println("Ligação OK ao Supabase");
    } catch (Exception e) {
        out.println("Erro: " + e.getMessage());
    }
%>
