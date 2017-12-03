require 'test_helper'

class StudyGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_group = study_groups(:one)
  end

  test "should get index" do
    get study_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_study_group_url
    assert_response :success
  end

  test "should create study_group" do
    assert_difference('StudyGroup.count') do
      post study_groups_url, params: { study_group: { name: @study_group.name } }
    end

    assert_redirected_to study_group_url(StudyGroup.last)
  end

  test "should show study_group" do
    get study_group_url(@study_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_study_group_url(@study_group)
    assert_response :success
  end

  test "should update study_group" do
    patch study_group_url(@study_group), params: { study_group: { name: @study_group.name } }
    assert_redirected_to study_group_url(@study_group)
  end

  test "should destroy study_group" do
    assert_difference('StudyGroup.count', -1) do
      delete study_group_url(@study_group)
    end

    assert_redirected_to study_groups_url
  end
end
