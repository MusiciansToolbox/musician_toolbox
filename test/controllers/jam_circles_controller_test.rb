require 'test_helper'

class JamCirclesControllerTest < ActionController::TestCase
  setup do
    @jam_circle = jam_circles(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:jam_circles)
  # end
  #
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  #
  # test "should create jam_circle" do
  #   assert_difference('JamCircle.count') do
  #     post :create, jam_circle: { description: @jam_circle.description, name: @jam_circle.name, open: @jam_circle.open, user_id: @jam_circle.user_id }
  #   end
  #
  #   assert_redirected_to jam_circle_path(assigns(:jam_circle))
  # end
  #
  # test "should show jam_circle" do
  #   get :show, id: @jam_circle
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get :edit, id: @jam_circle
  #   assert_response :success
  # end
  #
  # test "should update jam_circle" do
  #   patch :update, id: @jam_circle, jam_circle: { description: @jam_circle.description, name: @jam_circle.name, open: @jam_circle.open, user_id: @jam_circle.user_id }
  #   assert_redirected_to jam_circle_path(assigns(:jam_circle))
  # end
  #
  # test "should destroy jam_circle" do
  #   assert_difference('JamCircle.count', -1) do
  #     delete :destroy, id: @jam_circle
  #   end
  #
  #   assert_redirected_to jam_circles_path
  # end
end
