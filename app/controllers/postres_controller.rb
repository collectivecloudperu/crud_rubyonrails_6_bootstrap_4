class PostresController < ApplicationController

  @root_url = "/postres/index"

  layout 'application'

  add_flash_types :notice

  # Listar todos los registros de la Base de Datos 
  def index
  	@postres = Postre.all()
  end

  # Leer los detalles de un registro 
  def leer
    @postres = params[:url]
    @postres = Postre.where(url: @postres)
  end

  # Llamamos a la vista con el formulario para crear un registro 
  def crear
  	@postres = Postre.new
  end

  # Procesamos la creación de un registro en la base de datos
  def insertar

    # Subimos el Archivo al servidor
    uploaded_file = params[:img]
    File.open(Rails.root.join('public', 'assets/img', uploaded_file.original_filename), 'wb') do |file|
        file.write(uploaded_file.read)
    end
  	
  	@postres = Postre.new(parametros)

  	# Insertamos un registro en la base de datos
    if @postres.save
      
      @postres.update_column(:img, uploaded_file.original_filename)
  		
  	else
  		render :new
  	end

    # Redireccionamos a la vista principal con mensaje 
    @ini = "/postres/index"
    flash[:notice] = "Creado Correctamente !"
    redirect_to @ini 

  end

  # Llamamos a la vista con el formulario para actualizar un registro 

  def actualizar
    # Pasamos el 'id' del registro a actualizar (método index)   
    @postres = Postre.find(params[:id])
    @postres = Postre.where(id: @postres)

  end

  # Procesamos la actualización de un registro en la base de datos 
  def editar

    # Pasamos el 'id' del registro a actualizar (método editar)    
    @postres = Postre.find(params[:id])    

    # Actualizamos el Archivo al servidor
    uploaded_file = params[:img]

    if params[:img].present?

      # Eliminamos el archivo (imagen) anterior 
      simg = Postre.where(:id => @postres).pluck(:img)    
      imgeliminar = Rails.root.join('public', 'assets/img', simg.join)
      File.delete(Rails.root + imgeliminar)

      # Subimos el nuevo archivo (imagen) 
      File.open(Rails.root.join('public', 'assets/img', uploaded_file.original_filename), 'wb') do |file|
          file.write(uploaded_file.read)
      end

    else
      #
    end  
    
    # Actualizamos un determinado registro en la base de datos
    if @postres.update(parametros)
      
      # Actualizamos la columna 'img' de la base de datos
      if params[:img].present?
        @postres.update_column(:img, uploaded_file.original_filename)
      else
        #
      end          

    else
      render :edit
    end

      # Redireccionamos a la vista principal con mensaje 
      @ini = "/postres/index"
      flash[:notice] = "Actualizado Correctamente !"
      redirect_to @ini 

  end

  # Procesamos la eliminación de un registro de la base de datos
  def eliminar
    
    # Eliminamos un determinado registro en la base de datos, pasamos el 'id' del registro a eliminar
    @postres = Postre.find(params[:id])

    # Eliminamos la imagen perteneciente al registro 
    simg = Postre.where(:id => @postres).pluck(:img)    
    imgeliminar = Rails.root.join('public', 'assets/img', simg.join)
    File.delete(Rails.root + imgeliminar)

    Postre.where(id: @postres ).destroy_all    
    
    # Redireccionamos a la vista principal con mensaje 
    @ini = "/postres/index"
    flash[:notice] = "Eliminado Correctamente !"
    redirect_to @ini 

  end

  # Parámetros o campos que insertamos o actualizamos en la base de datos 
  private
  def parametros
  	params.permit(:nombre, :precio, :stock, :img, :url)
  end

end
