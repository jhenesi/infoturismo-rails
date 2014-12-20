require 'ostruct'

module InfoturismoData
	FILTER_COLUMNS = {
		'motivo' => 'FD',
		'transporte' => 'A1',
		'genero' => 'H22',
		'compania' => 'H21',
		'ocupacion' => 'H24',
		'grado' => 'H30',
		'edad' => 
			"CASE
			    WHEN [H23] >= 18 AND [H23] <= 29 THEN '18 - 29'
			    WHEN [H23] >= 30 AND [H23] <= 39 THEN '30 - 39'
			    WHEN [H23] >= 40 AND [H23] <= 49 THEN '40 - 49'
			    WHEN [H23] >= 50 AND [H23] <= 59 THEN '50 - 59'
			    WHEN [H23] >= 60 AND [H23] <= 69 THEN '60 - 69'
			    WHEN [H23] >= 70 AND [H23] <= 79 THEN '70 - 79'
			    WHEN [H23] >= 80 AND [H23] <= 89 THEN '80 - 89'
			    WHEN [H23] >= 90 AND [H23] <= 99 THEN '90 - 99'
			  END",
		'oportunidad' => 
			"CASE
		    	WHEN [H31] = 'A1' THEN 'SI'
		    	WHEN [H31] = 'A2' THEN 'NO'
		  	END",
		'ultima' => 
			"CASE
			    WHEN DATEDIFF(DAY,H19,CURRENT_TIMESTAMP) >= 0 AND DATEDIFF(DAY,H19,CURRENT_TIMESTAMP) <= 120  THEN '0-4'
			    WHEN DATEDIFF(DAY,H19,CURRENT_TIMESTAMP) >= 121 AND DATEDIFF(DAY,H19,CURRENT_TIMESTAMP) <= 240  THEN '4-8'
			    WHEN DATEDIFF(DAY,H19,CURRENT_TIMESTAMP) >= 241 AND DATEDIFF(DAY,H19,CURRENT_TIMESTAMP) <= 360  THEN '8-12'
			    WHEN DATEDIFF(DAY,H19,CURRENT_TIMESTAMP) >= 361 THEN '12-'
			  END",
		'frecuencia' =>
			"CASE
			    WHEN [H28] >= 1 AND H28 <= 4 THEN 'IF'
			    WHEN [H28] >= 5  AND H28 <= 12 THEN 'F'
				WHEN [H28] >= 13 THEN 'VF'
			END"
  	}

	SCORES = {
		'muy_baja' => OpenStruct.new(
			:clave => 'MB',
			:nombre => 'Muy Baja'
		),
		'baja' => OpenStruct.new(
			:clave => 'B',
			:nombre => 'Baja'
		),
		'media' => OpenStruct.new(
			:clave => 'M',
			:nombre => 'Media'
		),
		'alta' => OpenStruct.new(
			:clave => 'A',
			:nombre => 'Alta'
		),
		'muy_alta' => OpenStruct.new(
			:clave => 'MA',
			:nombre => 'Muy Alta'
		)
	};

	CATEGORIES = {
	  		'motivo' => {
	  			'A1' => OpenStruct.new(
	  				:clave => "Vacaciones",
					:nombre => "Vacaciones Ocio o Recreacion"
	  			),
	  			'A2' => OpenStruct.new(
	  				:clave => "Educacion",
					:nombre => "Educacion o Capacitacion",
	  			),
	  			'A3' => OpenStruct.new(
	  				:clave => "Empresarial",
					:nombre => "Empresarial o Profesional"
	  			),
	  			'A4' => OpenStruct.new(
	  				:clave => "Visita",
					:nombre => "Visita Familiares o Amigos"
	  			),
	  			'A5' => OpenStruct.new(
	  				:clave => "Salud",
					:nombre => "Salud o Atención Medica"
	  			),
	  			'A6' => OpenStruct.new(
	  				:clave => "Religion",
					:nombre => "Religión / Peregrinación"
	  			),
	  			'A7' => OpenStruct.new(
	  				:clave => "Compras",
					:nombre => "Compras"
	  			),
	  			'A8' => OpenStruct.new(
	  				:clave => "Otro",
					:nombre => "Otro"
	  			)
	  		},
	  		'transporte' => {
	  			'A101' => OpenStruct.new(
	  				:clave => 'Bus',
	  				:nombre => 'Autobús'
	  			),
	  			'A102' => OpenStruct.new(
	  				:clave => 'AutoPropio',
	  				:nombre => 'Automóvil Propio'
	  			),
	  			'A103' => OpenStruct.new(
	  				:clave => 'AutoRentado',
	  				:nombre => 'Automóvil Rentado'
	  			),
	  			'A104' => OpenStruct.new(
	  				:clave => 'Avion',
	  				:nombre => 'Avión'
	  			),
	  			'A105' => OpenStruct.new(
	  				:clave => 'BusRentado',
	  				:nombre => 'Autobús Rentado'
	  			),
	  			'-oth-' => OpenStruct.new(
	  				:clave => 'Otro',
	  				:nombre => 'Otro'
	  			),
	  		},
	  		'genero' => {
	  			'M' => OpenStruct.new(
	  				:clave => 'M',
	  				:nombre => 'Masculino'
	  			),
	  			'F' => OpenStruct.new(
					:clave => 'F',
	  				:nombre => 'Femenino'
	  			)
	  		},
	  		'compania' => {
	  			'A1' => OpenStruct.new(
	  				:clave => 'Solo',
	  				:nombre => 'Solo'
	  			),
	  			'A2' => OpenStruct.new(
	  				:clave => 'Pareja',
	  				:nombre => 'Pareja'
	  			),
	  			'A3' => OpenStruct.new(
	  				:clave => 'Familia',
	  				:nombre => 'Familia'
	  			),
	  			'A4' => OpenStruct.new(
	  				:clave => 'Companeros',
	  				:nombre => 'Compañeros de Trabajo'
	  			),
	  			'A5' => OpenStruct.new(
	  				:clave => 'Amigos',
	  				:nombre => 'Amigos'
	  			),
	  			'A6' => OpenStruct.new(
	  				:clave => 'Grupo',
	  				:nombre => 'Grupo'
	  			),
	  			'-oth-' => OpenStruct.new(
	  				:clave => 'Otro',
	  				:nombre => 'Otro'
	  			),
	  		},
	  		'ocupacion' => {
	  			'A1' => OpenStruct.new(
	  				:clave => 'Estudiante',
	  				:nombre => 'Estudiante'
	  			),
	  			'A2' => OpenStruct.new(
	  				:clave => 'EmpIP',
	  				:nombre => 'Empleado IP'
	  			),
	  			'A3' => OpenStruct.new(
	  				:clave => 'EmpGob',
	  				:nombre => 'Empleado de Gobierno'
	  			),
	  			'A4' => OpenStruct.new(
	  				:clave => 'ProfTec',
	  				:nombre => 'Profesionista / Técnico'
	  			),
	  			'A5' => OpenStruct.new(
	  				:clave => 'AmaCasa',
	  				:nombre => 'Ama de Casa'
	  			),
	  			'A6' => OpenStruct.new(
	  				:clave => 'DirEje',
	  				:nombre => 'Director / Ejecutivo'
	  			),
	  			'A7' => OpenStruct.new(
	  				:clave => 'DueNeg',
	  				:nombre => 'Dueño de Negocio'
	  			),
	  			'A8' => OpenStruct.new(
	  				:clave => 'Retirado',
	  				:nombre => 'Retirado'
	  			),
	  			'-oth-' => OpenStruct.new(
	  				:clave => 'Otro',
	  				:nombre => 'Otro'
	  			)
	  		},
	  		'grado' => {
	  			'A1' => OpenStruct.new(
	  				:clave => 'Preescolar',
	  				:nombre => 'Pre-escolar'
	  			),
	  			'A2' => OpenStruct.new(
	  				:clave => 'Primaria',
	  				:nombre => 'Primaria'
	  			),
	  			'A3' => OpenStruct.new(
	  				:clave => 'Secundaria',
	  				:nombre => 'Secundaria'
	  			),
	  			'A4' => OpenStruct.new(
	  				:clave => 'TecSec',
	  				:nombre => 'Carrera Técnica con Secundaria Terminada'
	  			),
	  			'A5' => OpenStruct.new(
	  				:clave => 'PreBac',
	  				:nombre => 'Preparatoria o Bachillerato'
	  			),
	  			'A6' => OpenStruct.new(
	  				:clave => 'TecPre',
	  				:nombre => 'Carrera Técnica con Preparatoria Terminada'
	  			),
	  			'A7' => OpenStruct.new(
	  				:clave => 'Normal',
	  				:nombre => 'Normal'
	  			),
	  			'A8' => OpenStruct.new(
	  				:clave => 'Profesional',
	  				:nombre => 'Profesional'
	  			),
	  			'A9' => OpenStruct.new(
	  				:clave => 'Especialidad',
	  				:nombre => 'Especialidad'
	  			),
	  			'10' => OpenStruct.new(
	  				:clave => 'MasDoc',
	  				:nombre => 'Maestría o Doctorado'
	  			),
	  			'11' => OpenStruct.new(
	  				:clave => 'PosDoc',
	  				:nombre => 'Postdoctorado'
	  			)
	  		},
	  		'edad' => {
	  			'18 - 29' => OpenStruct.new(
	  				:clave => '1829',
	  				:nombre => '18 - 29'
	  			),
   				'30 - 39' => OpenStruct.new(
	  				:clave => '3039',
	  				:nombre => '30 - 39'
	  			),
    			'40 - 49' => OpenStruct.new(
	  				:clave => '4049',
	  				:nombre => '40 - 49'
	  			),
    			'50 - 59' => OpenStruct.new(
	  				:clave => '5059',
	  				:nombre => '50 - 59'
	  			),
    			'60 - 69' => OpenStruct.new(
	  				:clave => '6069',
	  				:nombre => '60 - 69'
	  			),
    			'70 - 79' => OpenStruct.new(
	  				:clave => '7079',
	  				:nombre => '70 - 79'
	  			),
    			'80 - 89' => OpenStruct.new(
	  				:clave => '8089',
	  				:nombre => '80 - 89'
	  			),
    			'90 - 99' => OpenStruct.new(
	  				:clave => '9099',
	  				:nombre => '90 - 99'
	  			)
	  		},
	  		'oportunidad' => {
	  			'SI' => OpenStruct.new(
	  				:clave => 'SI',
	  				:nombre => 'Sí'
	  			),
	  			'NO' => OpenStruct.new(
	  				:clave => 'NO',
	  				:nombre => 'No'
	  			),
	  		},
	  		'ultima' => {
	  			'0-4' => OpenStruct.new(
	  				:clave => '0-4',
	  				:nombre => '0 - 4 meses'
	  			),
	  			'4-8' => OpenStruct.new(
	  				:clave => '4-8',
	  				:nombre => '4 - 8 meses'
	  			),
	  			'8-12' => OpenStruct.new(
	  				:clave => '8-12',
	  				:nombre => '8 - 12 meses'
	  			),
	  			'12-' => OpenStruct.new(
	  				:clave => '12-',
	  				:nombre => 'Más de un año'
	  			),
	  		},
	  		'frecuencia' => {
	  			'IF' => OpenStruct.new(
	  				:clave => 'IF',
	  				:nombre => 'Infrecuentemente'
	  			),
	  			'F' => OpenStruct.new(
	  				:clave => 'F',
	  				:nombre => 'Frecuentemente'
	  			),
	  			'VF' => OpenStruct.new(
	  				:clave => 'VF',
	  				:nombre => 'Muy Frecuentemente'
	  			)
	  		}
	  	}

	class ResponseData
		def initialize(clave, nombre)
			@Clave = clave
			@Nombre = nombre
		end
	end

	class ReactivoOverviewData < ResponseData
		def initialize(clave, nombre, promedio)
			super(clave, nombre)
			@Promedio = promedio
		end
	end

	class ReactivoData < ResponseData
		def initialize(clave, nombre, total)
			super(clave, nombre)
			@Total = total
		end
	end

	class ReactivoGroupedData < ResponseData
		attr_accessor :Datos
		def initialize(clave, nombre)
			super(clave, nombre)
			@Datos = []
		end
	end
end
