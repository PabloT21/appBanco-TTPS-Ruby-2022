require "test_helper"

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_url
    assert_response :success
  end

  test "should create schedule" do
    assert_difference("Schedule.count") do
      post schedules_url, params: { schedule: { jueves_fin: @schedule.jueves_fin, jueves_inicio: @schedule.jueves_inicio, lunes_fin: @schedule.lunes_fin, lunes_inicio: @schedule.lunes_inicio, martes_fin: @schedule.martes_fin, martes_inicio: @schedule.martes_inicio, miercoles_fin: @schedule.miercoles_fin, miercoles_inicio: @schedule.miercoles_inicio, viernes_fin: @schedule.viernes_fin, viernes_inicio: @schedule.viernes_inicio } }
    end

    assert_redirected_to schedule_url(Schedule.last)
  end

  test "should show schedule" do
    get schedule_url(@schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_url(@schedule)
    assert_response :success
  end

  test "should update schedule" do
    patch schedule_url(@schedule), params: { schedule: { jueves_fin: @schedule.jueves_fin, jueves_inicio: @schedule.jueves_inicio, lunes_fin: @schedule.lunes_fin, lunes_inicio: @schedule.lunes_inicio, martes_fin: @schedule.martes_fin, martes_inicio: @schedule.martes_inicio, miercoles_fin: @schedule.miercoles_fin, miercoles_inicio: @schedule.miercoles_inicio, viernes_fin: @schedule.viernes_fin, viernes_inicio: @schedule.viernes_inicio } }
    assert_redirected_to schedule_url(@schedule)
  end

  test "should destroy schedule" do
    assert_difference("Schedule.count", -1) do
      delete schedule_url(@schedule)
    end

    assert_redirected_to schedules_url
  end
end
