Rails.application.routes.draw do
  # get 'bebidas/index' 
  # get 'bebidas/leer' 
  # get 'bebidas/crear'
  # get 'bebidas/actualizar' 
  get 'postres/index' => 'postres#index'
  get 'postres/leer/:url', to: 'postres#leer'
  get 'postres/crear' => 'postres#crear'
  post 'postres/insertar' => 'postres#insertar'
  get 'postres/actualizar/:id', to: 'postres#actualizar'
  post 'postres/editar/:id', to: 'postres#editar'
  post 'postres/eliminar/:id', to: 'postres#eliminar'
  # get 'postres/index'
  # get 'postres/show'
  # get 'postres/new'
  # get 'postres/edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
