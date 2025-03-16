require 'spec_helper'

describe UsersController, :type => :controller do
  before (:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, params: { id: @user.id }
      expect(response).to be_successful
    end
    
    it "should find the right user" do
      get :show, params: { id: @user.id }
      expect(assigns(:user)).to eq(@user)
    end
  end
end
