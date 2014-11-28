require 'ostruct'

module InfoturismoData
	FILTER_COLUMNS = {
		'motivo' => 'FD',
		'transporte' => 'A1',
		'genero' => 'H22',
		'compania' => 'H21',
		'ocupacion' => 'H24',
		'grado' => 'H30'
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
	  			'A10' => OpenStruct.new(
	  				:clave => 'MasDoc',
	  				:nombre => 'Maestría o Doctorado'
	  			),
	  			'A10' => OpenStruct.new(
	  				:clave => 'PosDoc',
	  				:nombre => 'Postdoctorado'
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
