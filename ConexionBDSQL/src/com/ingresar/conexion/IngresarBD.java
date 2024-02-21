package com.ingresar.conexion;

    //Importe de conexiones
    import java.sql.Connection;
    import java.sql.DriverManager;
    import java.sql.ResultSet;
    import java.sql.Statement;

    //Creación de la clase para conectar BD
public class IngresarBD {

    //Variables
    private Connection con; //Conexión
    private Statement st; 
    private ResultSet rs; 

    //Metodo de conexión BD
    public IngresarBD (){
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/softpaf", "root", "Millos13");
            st = con.createStatement();

            String query = "INSERT INTO clientes (FID_cliente, Cedula_cliente, Nombre_cliente, Celular_cliente, Direccion_cliente, Email_cliente) VALUES(, , '', , '', '')";
            st.executeUpdate(query);//metodo de ingreso de información
            System.out.println("Un nuevo usuario fue ingresado");

        } catch (Exception ex) {
            // TODO: handle exception
            ex.printStackTrace();
        }
    }

    //Metodo de consulta de BD tabla clientes
    public void getDatos() {

        try {
            
//            String query = "SELECT * FROM clientes";
//          rs = st.executeQuery(query);
//            while (rs.next()) {
//                String FID_cliente = rs.getString("FID_cliente");
//                String Cedula_cliente = rs.getString("Cedula_cliente");
//                String Nombre_cliente = rs.getString("Nombre_cliente");
//                String Celular_cliente = rs.getString("Celular_cliente");
//                String Direccion_cliente = rs.getString("Direccion_cliente");
//                String Email_cliente = rs.getString("Email_cliente");
//                System.out.println("No. Cliente: "+ FID_cliente + "\nCédula: "+ Cedula_cliente + "\nNombre: "+ Nombre_cliente + "\nCelular: "+ Celular_cliente + "\nDirección: "+ Direccion_cliente + "\nEmail: "+ Email_cliente);
//            }

        } catch (Exception ex) {
            // TODO: handle exception
            ex.printStackTrace();
        } finally {
            try {
                
                con.close();

            } catch (Exception ex) {
                // TODO: handle exception
                ex.printStackTrace();
            }
        }
    }

}
