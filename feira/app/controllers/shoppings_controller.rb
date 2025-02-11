class ShoppingsController < ApplicationController
  before_action :set_shopping, only: %i[ show edit update destroy ]

  # GET /shoppings or /shoppings.json
  def index
    @shoppings = Shopping.all
  end

  # GET /shoppings/1 or /shoppings/1.json
  def show
  end

  # GET /shoppings/new
  def new
    @shopping = Shopping.new
  end

  # GET /shoppings/1/edit
  def edit
  end

  # POST /shoppings or /shoppings.json
  def create
    @shopping = Shopping.new(shopping_params)

    respond_to do |format|
      if @shopping.save
        format.html { redirect_to home_admin_homepage_path, notice: "Shopping was successfully created." }
        format.json { render :show, status: :created, location: @shopping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoppings/1 or /shoppings/1.json
  def update
    respond_to do |format|
      if @shopping.update(shopping_params)
        format.html { redirect_to home_admin_homepage_path, notice: "Shopping was successfully updated." }
        format.json { render :show, status: :ok, location: @shopping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoppings/1 or /shoppings/1.json
  def destroy
    @shopping.destroy!

    respond_to do |format|
      format.html { redirect_to home_admin_homepage_path, status: :see_other, notice: "Shopping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping
      @shopping = Shopping.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def shopping_params
      params.require(:shopping).permit(:nome, :localizacao, :image)
    end
end
