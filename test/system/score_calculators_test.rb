require "application_system_test_case"

class ScoreCalculatorsTest < ApplicationSystemTestCase
  setup do
    @score_calculator = score_calculators(:one)
  end

  test "visiting the index" do
    visit score_calculators_url
    assert_selector "h1", text: "Score calculators"
  end

  test "should create score calculator" do
    visit score_calculators_url
    click_on "New score calculator"

    fill_in "Hand tiles", with: @score_calculator.hand_tiles
    fill_in "Notes", with: @score_calculator.notes
    fill_in "Result score", with: @score_calculator.result_score
    click_on "Create Score calculator"

    assert_text "Score calculator was successfully created"
    click_on "Back"
  end

  test "should update Score calculator" do
    visit score_calculator_url(@score_calculator)
    click_on "Edit this score calculator", match: :first

    fill_in "Hand tiles", with: @score_calculator.hand_tiles
    fill_in "Notes", with: @score_calculator.notes
    fill_in "Result score", with: @score_calculator.result_score
    click_on "Update Score calculator"

    assert_text "Score calculator was successfully updated"
    click_on "Back"
  end

  test "should destroy Score calculator" do
    visit score_calculator_url(@score_calculator)
    click_on "Destroy this score calculator", match: :first

    assert_text "Score calculator was successfully destroyed"
  end
end
