Infoturismo::Application.routes.draw do
  root 'home#index'
  resources :overview
  resources :acceso do
  	collection do
  		get 'senalamiento'
      get 'opciones'
      get 'calidad'
      get 'mantenimiento'
      get 'atencion'
      get 'test'
  	end
  end
  resources :atractivos do
    collection do
      get 'atractivosServicios'
      get 'atractivosConservacion'
      get 'atractivosVariedad'
      get 'atractivosCalidad'
      get 'atractivosCulturales'
      get 'atractivosNaturales'
    end
  end
  resources :consumo do
  end
  resources :hospedaje do
    collection do
      get 'percepcion'
      get 'limpieza'
      get 'atencion'
      get 'facilidadeleccion'
    end
  end
  resources :alimentacion do
    collection do
      get 'experiencia'
      get 'calidad'
      get 'limpieza'
    end
  end
  resources :servicios_excursion do
    collection do
      get 'servicios'
      get 'calidad'
      get 'atencion'
    end
  end
  resources :transporte_estacionamiento do
    collection do
      get 'calidad'
      get 'atencion'
      get 'disponibilidad'
      get 'disponibilidad_estacionamiento'
    end
  end
  resources :costo do
    collection do
      get 'general'
      get 'transportacion'
      get 'hospedaje'
      get 'transporte'
      get 'alimentos'
      get 'excursion'
      get 'estacionamiento'
    end
  end
  resources :experiencia do
    collection do
      get 'experienciaViaje'
      get 'factores'
      get 'EVobregon'
    end
  end
  resources :imagen do
      collection do
      get 'percepcion'
      get 'sitios'
      get 'ambulantes'
      get 'transito'
      get 'limpieza'
    end

  end
  resources :satisfaccion do
     collection do
      get 'nivel'
      get 'expectativas'
      get 'disposicion'
      get 'recomendacion'
    end
  end
end
