class WishListsController < ApplicationController
  before_action :set_wish_list, only: %i[ show edit update destroy ]

  # GET /wish_lists or /wish_lists.json
  def index
    @wish_lists = WishList.all
  end

  # GET /wish_lists/1 or /wish_lists/1.json
  def show
  end

  # GET /wish_lists/new
  def new
    @wish_list = WishList.new
  end

  # GET /wish_lists/1/edit
  def edit
  end

  # POST /wish_lists or /wish_lists.json
  def create
    @wish_list = WishList.new(wish_list_params)

    if @wish_list.save
      redirect_to produtos_feirantes_path(params[:wish_list][:feirante_id]), notice: "Produto adicionado à Wish List."
    else
      redirect_to produtos_feirantes_path(params[:wish_list][:feirante_id]), alert: "Erro ao adicionar produto."
    end
  end

  # PATCH/PUT /wish_lists/1 or /wish_lists/1.json
  def update
    respond_to do |format|
      if @wish_list.update(wish_list_params)
        format.html { redirect_to @wish_list, notice: "Wish list was successfully updated." }
        format.json { render :show, status: :ok, location: @wish_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wish_lists/1 or /wish_lists/1.json
  def destroy
    @wish_list.destroy
    redirect_to home_anotacoes_path, notice: "Item removido com sucesso."
  end

  private

  def set_wish_list
    @wish_list = WishList.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
    def wish_list_params
      params.require(:wish_list).permit(:quantidade, :produto_id, :user_id)
    end
end
