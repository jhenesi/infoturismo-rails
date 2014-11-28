module InfoturismoData
	class ResponseData
		attr_reader :clave 
		attr_reader :nombre
		attr_accessor :promedio

		def initialize(clave, nombre)
			@clave = clave
			@nombre = nombre
			@promedio = 0
		end
	end
end