require "test_helper"

class SucursalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sucursal = sucursals(:one)
  end

  test "should get index" do
    get sucursals_url
    assert_response :success
  end

  test "should get new" do
    get new_sucursal_url
    assert_response :success
  end

  test "should create sucursal" do
    assert_difference("Sucursal.count") do
      post sucursals_url, params: { sucursal: { dirección: @sucursal.dirección, nombre: @sucursal.nombre, schedule_id: @sucursal.schedule_id, telefono: @sucursal.telefono } }
    end

    assert_redirected_to sucursal_url(Sucursal.last)
  end

  test "should show sucursal" do
    get sucursal_url(@sucursal)
    assert_response :success
  end

  test "should get edit" do
    get edit_sucursal_url(@sucursal)
    assert_response :success
  end

  test "should update sucursal" do
    patch sucursal_url(@sucursal), params: { sucursal: { dirección: @sucursal.dirección, nombre: @sucursal.nombre, schedule_id: @sucursal.schedule_id, telefono: @sucursal.telefono } }
    assert_redirected_to sucursal_url(@sucursal)
  end

  test "should destroy sucursal" do
    assert_difference("Sucursal.count", -1) do
      delete sucursal_url(@sucursal)
    end

    assert_redirected_to sucursals_url
  end
end
