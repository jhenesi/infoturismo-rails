class OverviewSurveyResult < ActiveRecord::Base
  self.table_name = 'tbl_Results_v1'
  self.primary_key = 'id'

  def self.get_data
  	 	data = [{
  		:Clave => "Acceso",
		:Nombre => "Acceso al Destino e Infraestructura",
		:Promedio => 0
  	},{
		:Clave => "Atractivos",
		:Nombre => "Atractivos y Oferta Turística",
		:Promedio => 0
	},{
		:Clave => "Consumo",
		:Nombre => "Consumo de Servicios",
		:Promedio => 0
	},{
		:Clave => "Costo",
		:Nombre => "Costo",
		:Promedio => 0
	},{
		:Clave => "Experiencia",
		:Nombre => "Experiencia de Viaje",
		:Promedio => 0
	},{
		:Clave => "Imagen",
		:Nombre => "Imagen",
		:Promedio => 0
	},{
		:Clave => "Satisfaccion",
		:Nombre => "Satisfacción y Recomendación",
		:Promedio => 0
	}]
    
	sql = 'SELECT 
		ROUND(((AVG("A2(A201)") + 
		  AVG("A2(A202)") + 
		  AVG("A2(A203)") + 
		  AVG("A2(A204)") + 
		  AVG("A2(A205)"))/(5*1.0)), 1) as acceso_average,
		ROUND(((AVG("B3(B301)") + 
		  AVG("B3(B302)") + 
		  AVG("B3(B303)") + 
		  AVG("B3(B304)") + 
		  AVG("B3(B305)") +
		  AVG("B3(B306)"))/(6*1.0)), 1) as atractivos_average,
		ROUND(((AVG("C5(C501)") + 
		  AVG("C5(C502)") + 
		  AVG("C5(C503)") + 
		  AVG("C5(C504)") +
		  AVG("C7(C701)") + 
		  AVG("C7(C702)") + 
		  AVG("C7(C703)") +
		  AVG("C9(C901)") +
		  AVG("C9(C902)") + 
		  AVG("C9(C903)") +
		  AVG("C11A(C1102)") +
		  AVG("C11A(C1103)") +
		  AVG("C11A(C1104)") +
		  AVG("C12(C1201)"))/(14*1.0)), 1) as consumo_average,
		ROUND(((AVG("D13(D1301)") +
		  AVG("D13(D1302)") +
		  AVG("D13(D1303)") +
		  AVG("D13(D1304)") +
		  AVG("D13(D1305)") +
		  AVG("D13(D1306)") +
		  AVG("D13(D1307)"))/(7*1.0)), 1) as costo_average,
		ROUND(((AVG("E14(E1401)") +
		  AVG("E14(E1402)") +
		  AVG("E14(E1403)") +
		  AVG("E14(E1404)") +
		  AVG("E14(E1405)") +
		  AVG("E14(E1406)") +
		  AVG("E14(E1407)"))/(7*1.0)), 1) as experiencia_average,
		ROUND(((AVG("F16(F1601)") +
		  AVG("F16(F1602)") +
		  AVG("F16(F1603)") +
		  AVG("F16(F1604)") +
		  AVG("F16(F1605)"))/(5*1.0)), 1) as imagen_average,
		ROUND(((AVG("G17(G1701)") +
		  AVG("G17(G1702)") +
		  AVG("G17(G1703)") +
		  AVG("G17(G1704)") +
		  AVG("G17(G1705)"))/(5*1.0)), 1) as satisfaccion_average
		FROM "tbl_Results_v1"'

	OverviewSurveyResult.find_by_sql(sql).each do |row|
		data[0]['Promedio'] = row.acceso_average
		data[1]['Promedio'] = row.atractivos_average
		data[2]['Promedio'] = row.consumo_average
		data[3]['Promedio'] = row.costo_average
		data[4]['Promedio'] = row.experiencia_average
		data[5]['Promedio'] = row.imagen_average
		data[6]['Promedio'] = row.satisfaccion_average
	end

	data
  end
end