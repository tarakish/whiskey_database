require 'rails_helper'

RSpec.describe "UserSessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/user_sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/user_sessions/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/user_sessions/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
