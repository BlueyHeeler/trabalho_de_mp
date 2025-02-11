class AdministradorsController < ApplicationController
  before_action :set_administrador, only: %i[ show edit update destroy ]

  def index
    @administradors = Administrador.all
  end

  def show
  end

  def new
    @administrador = Administrador.new
  end

  def edit
  end

  def create
    @administrador = Administrador.new(administrador_params)
    respond_to do |format|
      if @administrador.save
        respond_success(format, "created")
      else
        respond_error(format, :new)
      end
    end
  end

  def update
    respond_to do |format|
      if @administrador.update(administrador_params)
        respond_success(format, "updated")
      else
        respond_error(format, :edit)
      end
    end
  end

  def destroy
    @administrador.destroy!
    respond_to do |format|
      format.html { redirect_to administradors_path, status: :see_other, notice: "Administrador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_administrador
    @administrador = Administrador.find(params[:id])
  end

  def administrador_params
    params.require(:administrador).permit(:nome, :email, :password, :password_confirmation)
  end

  def respond_success(format, action)
    format.html { redirect_to home_admin_homepage_path, notice: "Administrador was successfully #{action}." }
    format.json { render :show, status: (action == "created" ? :created : :ok), location: @administrador }
  end

  def respond_error(format, view)
    format.html { render view, status: :unprocessable_entity }
    format.json { render json: @administrador.errors, status: :unprocessable_entity }
  end
end
