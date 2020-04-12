require 'test_helper'

class BebidasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bebidas_index_url
    assert_response :success
  end

  test "should get leer" do
    get bebidas_leer_url
    assert_response :success
  end

  test "should get crear" do
    get bebidas_crear_url
    assert_response :success
  end

  test "should get actualizar" do
    get bebidas_actualizar_url
    assert_response :success
  end

end
