# encoding: utf-8
SiSINTA::Application.routes.draw do

  # Autenticación en rack
  devise_for :usuarios

  get 'inicio/index'

  # Rutas en castellano (i.e. perfiles/nuevo, perfiles/2/editar)
  m = { new: "nuevo", edit: "editar" }
  f = { new: "nueva", edit: "editar" }

  resources :perfiles, path_names: m do
    collection do
      get   'geo'
      get   'preparar_csv'
      post  'procesar_csv'
      get   'autocompletar/:atributo' => 'perfiles#autocompletar', as: 'autocompletar'
    end

    resources :analisis, only: :index, path_names: m do
      collection do
        get 'edit'
        put 'update'
      end
    end

    resources :adjuntos, path_names: m do
      get 'descargar', on: :member
    end
  end

  resources :horizontes, only: :index, path_names: m do
    collection do
      get   'preparar_csv'
      post  'procesar_csv'
    end
  end

  resources :grupos, path_names: m do
    collection do
      get 'autocompletar/:atributo' => 'grupos#autocompletar', as: 'autocompletar'
    end
  end

  resources :fases, path_names: f do
    collection do
      get 'autocompletar/:atributo' => 'fases#autocompletar', as: 'autocompletar'
    end
  end

  resources :colores, only: [], path_names: m do
    collection do
      get 'autocompletar/:atributo' => 'colores#autocompletar', as: 'autocompletar'
    end
  end

  resources :proyectos, path_names: m

  scope "/admin" do
    resources :usuarios, only: [:index, :destroy], path_names: m do
      put 'update', on: :collection
    end
  end

  resource :usuarios, only: [], path_names: m do
    put 'configurar', on: :member
  end

  root to: 'inicio#index'
end
