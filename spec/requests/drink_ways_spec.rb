require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/drink_ways", type: :request do
  
  # DrinkWay. As you add validations to DrinkWay, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      DrinkWay.create! valid_attributes
      get drink_ways_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      drink_way = DrinkWay.create! valid_attributes
      get drink_way_url(drink_way)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_drink_way_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      drink_way = DrinkWay.create! valid_attributes
      get edit_drink_way_url(drink_way)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new DrinkWay" do
        expect {
          post drink_ways_url, params: { drink_way: valid_attributes }
        }.to change(DrinkWay, :count).by(1)
      end

      it "redirects to the created drink_way" do
        post drink_ways_url, params: { drink_way: valid_attributes }
        expect(response).to redirect_to(drink_way_url(DrinkWay.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new DrinkWay" do
        expect {
          post drink_ways_url, params: { drink_way: invalid_attributes }
        }.to change(DrinkWay, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post drink_ways_url, params: { drink_way: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested drink_way" do
        drink_way = DrinkWay.create! valid_attributes
        patch drink_way_url(drink_way), params: { drink_way: new_attributes }
        drink_way.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the drink_way" do
        drink_way = DrinkWay.create! valid_attributes
        patch drink_way_url(drink_way), params: { drink_way: new_attributes }
        drink_way.reload
        expect(response).to redirect_to(drink_way_url(drink_way))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        drink_way = DrinkWay.create! valid_attributes
        patch drink_way_url(drink_way), params: { drink_way: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested drink_way" do
      drink_way = DrinkWay.create! valid_attributes
      expect {
        delete drink_way_url(drink_way)
      }.to change(DrinkWay, :count).by(-1)
    end

    it "redirects to the drink_ways list" do
      drink_way = DrinkWay.create! valid_attributes
      delete drink_way_url(drink_way)
      expect(response).to redirect_to(drink_ways_url)
    end
  end
end
