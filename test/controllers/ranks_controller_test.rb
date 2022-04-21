require 'test_helper'

class RanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rank = ranks(:one)
  end

  test 'should get index' do
    get ranks_url, as: :json
    assert_response :success
  end

  test 'should create rank' do
    assert_difference('Rank.count') do
      post ranks_url, params: { rank: { score: @rank.score } }, as: :json
    end

    assert_response :created
  end

  test 'should show rank' do
    get rank_url(@rank), as: :json
    assert_response :success
  end

  test 'should update rank' do
    patch rank_url(@rank), params: { rank: { score: @rank.score } }, as: :json
    assert_response :success
  end

  test 'should destroy rank' do
    assert_difference('Rank.count', -1) do
      delete rank_url(@rank), as: :json
    end

    assert_response :no_content
  end
end
