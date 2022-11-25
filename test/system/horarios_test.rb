require "application_system_test_case"

class HorariosTest < ApplicationSystemTestCase
  setup do
    @horario = horarios(:one)
  end

  test "visiting the index" do
    visit horarios_url
    assert_selector "h1", text: "Horarios"
  end

  test "should create horario" do
    visit horarios_url
    click_on "New horario"

    fill_in "Fin", with: @horario.fin
    fill_in "Inicio", with: @horario.inicio
    click_on "Create Horario"

    assert_text "Horario was successfully created"
    click_on "Back"
  end

  test "should update Horario" do
    visit horario_url(@horario)
    click_on "Edit this horario", match: :first

    fill_in "Fin", with: @horario.fin
    fill_in "Inicio", with: @horario.inicio
    click_on "Update Horario"

    assert_text "Horario was successfully updated"
    click_on "Back"
  end

  test "should destroy Horario" do
    visit horario_url(@horario)
    click_on "Destroy this horario", match: :first

    assert_text "Horario was successfully destroyed"
  end
end
