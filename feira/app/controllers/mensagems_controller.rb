class MensagemsController < ApplicationController
  before_action :set_mensagem, only: %i[ show edit update destroy ]

  # GET /mensagems or /mensagems.json
  def index
    @mensagems = Mensagem.all
  end

  # GET /mensagems/1 or /mensagems/1.json
  def show
  end

  # GET /mensagems/new
  def new
    @mensagem = Mensagem.new
  end

  # GET /mensagems/1/edit
  def edit
  end

  # POST /mensagems or /mensagems.json
  def create
    @mensagem = Mensagem.new(mensagem_params)

    respond_to do |format|
      if @mensagem.save
        format.html { redirect_to @mensagem, notice: "Mensagem was successfully created." }
        format.json { render :show, status: :created, location: @mensagem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mensagems/1 or /mensagems/1.json
  def update
    respond_to do |format|
      if @mensagem.update(mensagem_params)
        format.html { redirect_to @mensagem, notice: "Mensagem was successfully updated." }
        format.json { render :show, status: :ok, location: @mensagem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensagems/1 or /mensagems/1.json
  def destroy
    @mensagem.destroy!

    respond_to do |format|
      format.html { redirect_to mensagems_path, status: :see_other, notice: "Mensagem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensagem
      @mensagem = Mensagem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mensagem_params
      params.expect(mensagem: [ :mensagem, :user_id, :feirante_id ])
    end
end
