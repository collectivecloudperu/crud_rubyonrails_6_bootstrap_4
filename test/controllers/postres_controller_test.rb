require 'test_helper'

class PostresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postres_index_url
    assert_response :success
  end

  test "should get leer" do
    get postres_leer_url
    assert_response :success
  end

  test "should get crear" do
    get postres_crear_url
    assert_response :success
  end

  test "should get actualizar" do
    get postres_actualizar_url
    assert_response :success
  end

end
