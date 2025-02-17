class HomeController < ApplicationController
    before_action :require_login, only: [:anotacoes], except: [:start_page, :login, :authenticate] # Add start_page to exceptions

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
      if temp_user? && current_user
        current_user.destroy
      end
      
      session[:user_id] = nil
      session[:user_type] = nil
      
      redirect_to login_path, notice: "Logged out successfully"
    end

    def feira
      @shoppings = Shopping.all
      @is_temp = temp_user?
  
      if params[:sort] == 'distance' && current_user&.coordinates.present?
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
      elsif params[:order] == 'nome'
        @feirantes = @feirantes.order(:nome)
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

    def start_page
        # Empty method is fine since it just needs to render the view
        # The form in the view will handle the temp user creation through users_controller
    end
end
