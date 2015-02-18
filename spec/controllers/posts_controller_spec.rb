require 'rails_helper'

describe PostsController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  # Admin Pages without authorization
  describe "GET admin" do
    it "has a 302 status code" do
      get :admin
      expect(response.status).to eq(302)
    end
  end

  describe "GET new" do
    it "has a 302 status code" do
      get :new
      expect(response.status).to eq(302)
    end
  end

end