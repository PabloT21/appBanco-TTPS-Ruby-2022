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

    fill_in "Juevesfin", with: @schedule.juevesFin
    fill_in "Juevesinicio", with: @schedule.juevesInicio
    fill_in "Lunesfin", with: @schedule.lunesFin
    fill_in "Lunesinicio", with: @schedule.lunesInicio
    fill_in "Martesfin", with: @schedule.martesFin
    fill_in "Martesinicio", with: @schedule.martesInicio
    fill_in "Miercolesfin", with: @schedule.miercolesFin
    fill_in "Miercolesinicio", with: @schedule.miercolesInicio
    fill_in "Viernesfin", with: @schedule.viernesFin
    fill_in "Viernesinicio", with: @schedule.viernesInicio
    click_on "Create Schedule"

    assert_text "Schedule was successfully created"
    click_on "Back"
  end

  test "should update Schedule" do
    visit schedule_url(@schedule)
    click_on "Edit this schedule", match: :first

    fill_in "Juevesfin", with: @schedule.juevesFin
    fill_in "Juevesinicio", with: @schedule.juevesInicio
    fill_in "Lunesfin", with: @schedule.lunesFin
    fill_in "Lunesinicio", with: @schedule.lunesInicio
    fill_in "Martesfin", with: @schedule.martesFin
    fill_in "Martesinicio", with: @schedule.martesInicio
    fill_in "Miercolesfin", with: @schedule.miercolesFin
    fill_in "Miercolesinicio", with: @schedule.miercolesInicio
    fill_in "Viernesfin", with: @schedule.viernesFin
    fill_in "Viernesinicio", with: @schedule.viernesInicio
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
