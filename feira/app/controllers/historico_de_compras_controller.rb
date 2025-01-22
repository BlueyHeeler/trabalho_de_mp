class HistoricoDeComprasController < ApplicationController
  before_action :set_historico_de_compra, only: %i[ show edit update destroy ]

  # GET /historico_de_compras or /historico_de_compras.json
  def index
    @historico_de_compras = HistoricoDeCompra.all
  end

  # GET /historico_de_compras/1 or /historico_de_compras/1.json
  def show
  end

  # GET /historico_de_compras/new
  def new
    @historico_de_compra = HistoricoDeCompra.new
  end

  # GET /historico_de_compras/1/edit
  def edit
  end

  # POST /historico_de_compras or /historico_de_compras.json
  def create
    @historico_de_compra = HistoricoDeCompra.new(historico_de_compra_params)

    respond_to do |format|
      if @historico_de_compra.save
        format.html { redirect_to @historico_de_compra, notice: "Historico de compra was successfully created." }
        format.json { render :show, status: :created, location: @historico_de_compra }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @historico_de_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historico_de_compras/1 or /historico_de_compras/1.json
  def update
    respond_to do |format|
      if @historico_de_compra.update(historico_de_compra_params)
        format.html { redirect_to @historico_de_compra, notice: "Historico de compra was successfully updated." }
        format.json { render :show, status: :ok, location: @historico_de_compra }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @historico_de_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historico_de_compras/1 or /historico_de_compras/1.json
  def destroy
    @historico_de_compra.destroy!

    respond_to do |format|
      format.html { redirect_to historico_de_compras_path, status: :see_other, notice: "Historico de compra was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historico_de_compra
      @historico_de_compra = HistoricoDeCompra.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def historico_de_compra_params
      params.expect(historico_de_compra: [ :quantidade, :user_id, :produto_id ])
    end
end
