<%@page language="java" import="java.sql.*" %>

<%
    // cria as variaveis e armazena as informações digitadas pelo usuario
    String vemail = request.getParameter("txtEmail");
    String vnome  = request.getParameter("txtNome");
    String vsobrenome = request.parseInt("txtSobrenome");
    String vsenha = request.getParameter("txtSenha");

    // variaveis para o banco de dados
    String banco    = "projeto";
    String endereco = "jdbc:mysql://localhost:3306/" + banco ;
    String usuario  = "root" ;
    String senha    = "" ;

    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memoria
    Class.forName( driver );

    //cria a variavel para conectar com o banco
    Connection conexao ;
    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql com o comando de Inserir
    String sql = "INSERT INTO cadclientes (nome,sobrenome,senha,email) values(?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vemail);
    stm.setString(2, vnome);
    stm.setInt(3, vsobrenome);
    stm.setString(4, vsenha);

    stm.execute() ;
    stm.close() ;

    out.print("Dados gravados com sucesso!!!");
    out.print("<br><br>");
    out.print("<a href='login.html'>Voltar</a>");
%>