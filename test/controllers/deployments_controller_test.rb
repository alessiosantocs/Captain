require 'test_helper'

class DeploymentsControllerTest < ActionController::TestCase
  setup do
    @deployment = deployments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deployments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deployment" do
    assert_difference('Deployment.count') do
      post :create, deployment: { version: @deployment.version }
    end

    assert_redirected_to deployment_path(assigns(:deployment))
  end

  test "should show deployment" do
    get :show, id: @deployment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deployment
    assert_response :success
  end

  test "should update deployment" do
    patch :update, id: @deployment, deployment: { version: @deployment.version }
    assert_redirected_to deployment_path(assigns(:deployment))
  end

  test "should destroy deployment" do
    assert_difference('Deployment.count', -1) do
      delete :destroy, id: @deployment
    end

    assert_redirected_to deployments_path
  end
end
