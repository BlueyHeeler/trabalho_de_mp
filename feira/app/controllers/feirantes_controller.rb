class FeirantesController < ApplicationController
  before_action :set_feirante, only: %i[show edit update destroy]

  # GET /feirantes or /feirantes.json
  def index
    @feirantes = Feirante.all
  end

  # GET /feirantes/1 or /feirantes/1.json
  def show
  end

  # GET /feirantes/new
  def new
    @feirante = Feirante.new
  end

  # GET /feirantes/1/edit
  def edit
  end

  # POST /feirantes or /feirantes.json
  def create
    @feirante = Feirante.new(feirante_params)

    respond_to do |format|
      if @feirante.save
        redirect_to home_admin_feirantes_path(shopping_id: @feirante.shopping_id), notice: "Feirante criado com sucesso."

      else
        render :new
      end
    end
  end

  # PATCH/PUT /feirantes/1 or /feirantes/1.json
  def update
    respond_to do |format|
      if @feirante.update(feirante_params)
        format.html { redirect_to home_admin_feirantes_path, notice: "Feirante was successfully updated." }
        format.json { render :show, status: :ok, location: @feirante }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feirante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feirantes/1 or /feirantes/1.json
  def destroy
    @feirante.destroy

    respond_to do |format|
      format.html { redirect_to home_admin_feirantes_path, notice: "Feirante was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feirante
      @feirante = Feirante.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feirante_params
      params.require(:feirante).permit(:nome, :email, :password, :password_confirmation, :descricao, :shopping_id)
    end
end
