class AvaliacaoFeirantesController < ApplicationController
  before_action :set_avaliacao_feirante, only: %i[ show edit update destroy ]

  # GET /avaliacao_feirantes or /avaliacao_feirantes.json
  def index
    @avaliacao_feirantes = AvaliacaoFeirante.all
  end

  # GET /avaliacao_feirantes/1 or /avaliacao_feirantes/1.json
  def show
  end

  # GET /avaliacao_feirantes/new
  def new
    @avaliacao_feirante = AvaliacaoFeirante.new(feirante_id: params[:feirante_id])
  end

  # GET /avaliacao_feirantes/1/edit
  def edit
  end

  # POST /avaliacao_feirantes or /avaliacao_feirantes.json
  def create
    @avaliacao_feirante = AvaliacaoFeirante.new(avaliacao_feirante_params)
    @avaliacao_feirante.user_id = current_user.id
    feirante = Feirante.find(@avaliacao_feirante.feirante_id)

    respond_to do |format|
      if @avaliacao_feirante.save
        format.html { redirect_to home_feirantes_path(shopping_id: feirante.shopping_id), notice: "Avaliação criada com sucesso." }
        format.json { render :show, status: :created, location: @avaliacao_feirante }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @avaliacao_feirante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliacao_feirantes/1 or /avaliacao_feirantes/1.json
  def update
    feirante = Feirante.find(@avaliacao_feirante.feirante_id)
    
    respond_to do |format|
      if @avaliacao_feirante.update(avaliacao_feirante_params)
        format.html { redirect_to home_feirantes_path(shopping_id: feirante.shopping_id), notice: "Avaliação atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @avaliacao_feirante }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @avaliacao_feirante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliacao_feirantes/1 or /avaliacao_feirantes/1.json
  def destroy
    @avaliacao_feirante.destroy!
    feirante = Feirante.find(@avaliacao_feirante.feirante_id)
    
    respond_to do |format|
      format.html { redirect_to home_feirantes_path(shopping_id: feirante.shopping_id), status: :see_other, notice: "Avaliacao feirante was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao_feirante
      @avaliacao_feirante = AvaliacaoFeirante.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def avaliacao_feirante_params
      params.require(:avaliacao_feirante).permit(:nota, :comentario, :feirante_id)
    end
end
