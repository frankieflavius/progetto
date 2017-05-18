require 'test_helper'

class PazientesControllerTest < ActionController::TestCase
  setup do
    @paziente = pazientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pazientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paziente" do
    assert_difference('Paziente.count') do
      post :create, paziente: { cognome: @paziente.cognome, email: @paziente.email, nome: @paziente.nome, telefono: @paziente.telefono }
    end

    assert_redirected_to paziente_path(assigns(:paziente))
  end

  test "should show paziente" do
    get :show, id: @paziente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paziente
    assert_response :success
  end

  test "should update paziente" do
    patch :update, id: @paziente, paziente: { cognome: @paziente.cognome, email: @paziente.email, nome: @paziente.nome, telefono: @paziente.telefono }
    assert_redirected_to paziente_path(assigns(:paziente))
  end

  test "should destroy paziente" do
    assert_difference('Paziente.count', -1) do
      delete :destroy, id: @paziente
    end

    assert_redirected_to pazientes_path
  end
end
