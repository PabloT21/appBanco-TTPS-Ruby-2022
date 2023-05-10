require "application_system_test_case"

class SchedulesTest < ApplicationSystemTestCase
  setup do
    @schedule = schedules(:one)
  end

  test "visiting the index" do
    visit schedules_url
    assert_selector "h1", text: "Schedules"
  end

  test "should create schedule" do
    visit schedules_url
    click_on "New schedule"

    fill_in "jueves_fin", with: @schedule.jueves_fin
    fill_in "jueves_inicio", with: @schedule.jueves_inicio
    fill_in "lunes_fin", with: @schedule.lunes_fin
    fill_in "lunes_inicio", with: @schedule.lunes_inicio
    fill_in "martes_fin", with: @schedule.martes_fin
    fill_in "martes_inicio", with: @schedule.martes_inicio
    fill_in "miercoles_fin", with: @schedule.miercoles_fin
    fill_in "miercoles_inicio", with: @schedule.miercoles_inicio
    fill_in "viernes_fin", with: @schedule.viernes_fin
    fill_in "viernes_inicio", with: @schedule.viernes_inicio
    click_on "Create Schedule"

    assert_text "Schedule was successfully created"
    click_on "Back"
  end

  test "should update Schedule" do
    visit schedule_url(@schedule)
    click_on "Edit this schedule", match: :first

    fill_in "jueves_fin", with: @schedule.jueves_fin
    fill_in "jueves_inicio", with: @schedule.jueves_inicio
    fill_in "lunes_fin", with: @schedule.lunes_fin
    fill_in "lunes_inicio", with: @schedule.lunes_inicio
    fill_in "martes_fin", with: @schedule.martes_fin
    fill_in "martes_inicio", with: @schedule.martes_inicio
    fill_in "miercoles_fin", with: @schedule.miercoles_fin
    fill_in "miercoles_inicio", with: @schedule.miercoles_inicio
    fill_in "viernes_fin", with: @schedule.viernes_fin
    fill_in "viernes_inicio", with: @schedule.viernes_inicio
    click_on "Update Schedule"

    assert_text "Schedule was successfully updated"
    click_on "Back"
  end

  test "should destroy Schedule" do
    visit schedule_url(@schedule)
    click_on "Destroy this schedule", match: :first

    assert_text "Schedule was successfully destroyed"
  end
end
