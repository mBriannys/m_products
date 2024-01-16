require 'rails_helper'

RSpec.describe "Invoices", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/invoices/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      invoice = create(:invoice)
      get "/invoices/#{invoice.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post "/invoices/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      invoice = create(:invoice)
      delete "/invoices/#{invoice.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
