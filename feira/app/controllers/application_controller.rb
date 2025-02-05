class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_admin
  helper_method :current_feirante

  private
  
  def current_user
    return @current_user if defined?(@current_user)
    if session[:user_type] == "admin"
      @current_user = Administrador.find_by(id: session[:user_id])
    elsif session[:user_type] == "feirante"
      @current_user = Feirante.find_by(id: session[:user_id])
    else
      @current_user = User.find_by(id: session[:user_id])
    end
  end

  def current_admin
    current_user if session[:user_type] == "admin"
  end

  def current_feirante
    current_user if session[:user_type] == "feirante"
  end

  def require_login
    unless current_user
      flash[:alert] = "Você precisa estar logado para acessar esta página."
      redirect_to login_path
    end
  end

  def require_admin
    unless current_admin
      flash[:alert] = "Acesso restrito para administradores."
      redirect_to login_path
    end
  end
end
