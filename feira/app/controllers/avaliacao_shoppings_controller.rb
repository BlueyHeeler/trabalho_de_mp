class AvaliacaoShoppingsController < ApplicationController
  before_action :set_avaliacao_shopping, only: %i[ show edit update destroy ]

  # GET /avaliacao_shoppings or /avaliacao_shoppings.json
  def index
    @avaliacao_shoppings = AvaliacaoShopping.all
  end

  # GET /avaliacao_shoppings/1 or /avaliacao_shoppings/1.json
  def show
  end

  # GET /avaliacao_shoppings/new
  def new
    @avaliacao_shopping = AvaliacaoShopping.new(
      shopping_id: params[:shopping_id],
      user_id: current_user.id
    )
  end

  # GET /avaliacao_shoppings/1/edit
  def edit
  end

  # POST /avaliacao_shoppings or /avaliacao_shoppings.json
  def create
    @avaliacao_shopping = AvaliacaoShopping.new(avaliacao_shopping_params)

    respond_to do |format|
      if @avaliacao_shopping.save
        format.html { redirect_to home_feira_path, notice: "Avaliacao shopping was successfully created." }
        format.json { render :show, status: :created, location: @avaliacao_shopping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @avaliacao_shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliacao_shoppings/1 or /avaliacao_shoppings/1.json
  def update
    respond_to do |format|
      if @avaliacao_shopping.update(avaliacao_shopping_params)
        format.html { redirect_to home_feira_path, notice: "Avaliacao shopping was successfully updated." }
        format.json { render :show, status: :ok, location: @avaliacao_shopping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @avaliacao_shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliacao_shoppings/1 or /avaliacao_shoppings/1.json
  def destroy
    @avaliacao_shopping.destroy!

    respond_to do |format|
      format.html { redirect_to home_feira_path, status: :see_other, notice: "Avaliacao shopping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao_shopping
      @avaliacao_shopping = AvaliacaoShopping.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def avaliacao_shopping_params
      params.expect(avaliacao_shopping: [ :nota, :comentario, :user_id, :shopping_id ])
    end
end
