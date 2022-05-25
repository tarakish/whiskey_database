require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/searches/new"
      expect(response).to have_http_status(:success)
    end
  end

end
