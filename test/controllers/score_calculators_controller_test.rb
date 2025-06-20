require "test_helper"

class ScoreCalculatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @score_calculator = score_calculators(:one)
  end

  test "should get index" do
    get score_calculators_url
    assert_response :success
  end

  test "should get new" do
    get new_score_calculator_url
    assert_response :success
  end

  test "should create score_calculator" do
    assert_difference("ScoreCalculator.count") do
      post score_calculators_url, params: { score_calculator: { hand_tiles: @score_calculator.hand_tiles, notes: @score_calculator.notes, result_score: @score_calculator.result_score } }
    end

    assert_redirected_to score_calculator_url(ScoreCalculator.last)
  end

  test "should show score_calculator" do
    get score_calculator_url(@score_calculator)
    assert_response :success
  end

  test "should get edit" do
    get edit_score_calculator_url(@score_calculator)
    assert_response :success
  end

  test "should update score_calculator" do
    patch score_calculator_url(@score_calculator), params: { score_calculator: { hand_tiles: @score_calculator.hand_tiles, notes: @score_calculator.notes, result_score: @score_calculator.result_score } }
    assert_redirected_to score_calculator_url(@score_calculator)
  end

  test "should destroy score_calculator" do
    assert_difference("ScoreCalculator.count", -1) do
      delete score_calculator_url(@score_calculator)
    end

    assert_redirected_to score_calculators_url
  end
end
