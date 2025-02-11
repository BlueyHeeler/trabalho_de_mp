class HomeController < ApplicationController
    before_action :require_login, only: [ :feira ]

    def login
    end

    def authenticate
      case params[:user_type]
      when "admin"
        user = Administrador.find_by(email: params[:email])
        success_path = home_admin_homepage_path
      when "feirante"
        user = Feirante.find_by(email: params[:email])
        success_path = home_feirante_homepage_path
      else
        user = User.find_by(email: params[:email])
        success_path = home_feira_path
      end

      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        session[:user_type] = params[:user_type]
        redirect_to success_path, notice: "Logged in successfully"
      else
        flash.now[:alert] = "Invalid email or password"
        render :login
      end
    end

    def logout
      session[:user_id] = nil
      redirect_to login_path, notice: "Logged out"
    end

    def feira
      @shoppings = Shopping.all
  
      if params[:sort] == 'distance'
        @shoppings = @shoppings.sort_by { |shopping| shopping.distance_to(current_user) }
      elsif params[:sort] == 'nota'
        @shoppings = @shoppings.sort_by { |shopping| -shopping.average_rating }
      elsif params[:sort] == 'nome'
        @shoppings = @shoppings.order(:nome)
      end
    end

    def feirantes
      @shopping = Shopping.find(params[:shopping_id])
      @feirantes = @shopping.feirantes
  
      if params[:order] == 'categoria'
        @feirantes = @feirantes.order(:categoria)
      elsif params[:order] == 'nota'
        @feirantes = @feirantes.sort_by { |feirante| -feirante.average_rating }
      end
    end

    def produtos_feirantes
      @feirante = Feirante.find(params[:feirante_id])
      @produtos = @feirante.produtos

      if params[:order] == 'nome'
        @produtos = @produtos.order(:nome)
      elsif params[:order] == 'preco'
        @produtos = @produtos.order(:preco)
      end
    end

    def anotacoes
        @wish_lists = current_user.wish_lists.includes(:produto)
    end

    def adicionar
        @produto = Produto.find(params[:produto_id])
        @wish_list = WishList.new
    end

    def admin_homepage
      @shoppings = if params[:sort] == 'nome'
        Shopping.order(:nome)
      else
        Shopping.all
      end
    end

    def admin_feirantes
      @shopping = Shopping.find(params[:shopping_id])
      @feirantes = @shopping.feirantes
      case params[:sort]
      when 'nome'
        @feirantes = @feirantes.order(:nome) if params[:sort] == 'nome'
      end
    end

    def feirante_homepage
      @produtos = current_feirante.produtos
      case params[:sort]
      when 'nome'
        @produtos = @produtos.order(:nome)
      when 'preco'
        @produtos = @produtos.order(:preco)
      end
    end

    def logout
      session[:user_id] = nil
      session[:user_type] = nil
      redirect_to login_path, notice: "Logged out successfully"
    end
end
