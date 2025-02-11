require 'rails_helper'

RSpec.describe AdministradorsController, type: :controller do
  let!(:admin) { Administrador.create(nome: "Admin Teste", email: "admin@example.com", password: "123456", password_confirmation: "123456") }

  describe "GET #index" do
    it "retorna sucesso e lista administradores" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:administradors)).to include(admin)
    end
  end

  describe "GET #show" do
    it "exibe um administrador específico" do
      get :show, params: { id: admin.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "com parâmetros válidos" do
      it "cria um novo administrador" do
        expect {
          post :create, params: { administrador: { nome: "Novo Admin", email: "novo@example.com", password: "123456", password_confirmation: "123456" } }
        }.to change(Administrador, :count).by(1)

        expect(response).to redirect_to(home_admin_homepage_path)
      end
    end

    context "com parâmetros inválidos" do
      it "não cria um administrador e renderiza :new" do
        post :create, params: { administrador: { nome: "", email: "", password: "123456", password_confirmation: "654321" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH #update" do
    context "com parâmetros válidos" do
      it "atualiza o administrador e redireciona" do
        patch :update, params: { id: admin.id, administrador: { nome: "Admin Atualizado" } }
        expect(admin.reload.nome).to eq("Admin Atualizado")
        expect(response).to redirect_to(home_admin_homepage_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "exclui o administrador e redireciona" do
      expect {
        delete :destroy, params: { id: admin.id }
      }.to change(Administrador, :count).by(-1)

      expect(response).to redirect_to(administradors_path)
    end
  end
end
