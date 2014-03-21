package shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Conexion {

	private Connection con;
	private DataSource ds;
	private Context envContext;
	private Context initContext;

	//Inicializamos las varaibles privadas
	public Conexion() {

		con = null;
		ds = null;
		envContext = null;
		initContext = null;

	}

	//realizamos una conexion a la base de datos a traves de datasource
	public void getConexion(String DataSourceDB) {
		try {
			envContext = new InitialContext();
			initContext = (Context) envContext.lookup("java:/comp/env");
			ds = (DataSource) initContext.lookup(DataSourceDB);
			con = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//obtenemos una lista con los CDs de la base de datos
	public ArrayList<String> getListaCDs(String peticion) {

		String cd = null;
		ArrayList<String> cds = new ArrayList<String>();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(peticion);
			while (rs.next()) {
				cd = rs.getString("Disco") + " | " + rs.getString("Autor")
						+ " | " + rs.getString("Pais") + " | "
						+ rs.getDouble("Precio");
				cds.add(cd);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cds;
	}

	//insertamos en la base de datos los datos de la compra
	public void realizarCompra(String disco, float precio, float precioTotal, int cantidad) {
		PreparedStatement stmt = null;
		try {
			String sql = "insert into compra (disco, precio, preciot, cantidad) value (?, ?, ?, ?)";
			stmt = con.prepareStatement(sql);

			stmt.setString(1, disco);
			stmt.setFloat(2, precio);
			stmt.setFloat(3, precioTotal);
			stmt.setInt(4, cantidad);
			stmt.executeUpdate();

		} catch (SQLException e) {
		}
	}

}
