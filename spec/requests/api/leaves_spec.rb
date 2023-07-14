require 'rails_helper'

RSpec.describe "Api::Leaves", type: :request do
  describe "GET/api/employees/:id/leaves" do
    it "list out all the leaves applied by an employee" do
      leave1 = create(:leave)
      leave2 = create(:leave)

      get "/api/employees/1/leaves"

      expect(response).to have_http_status(200)
      leaves = JSON.parse(response.body)
    end
  end

  describe "GET/api/employees/:id/leaves/:id" do
    it "shows a particular leave of an employee" do
      get "/api/employees/1/leaves/1"

      expect(response).to have_http_status(200)
      leave = JSON.parse(response.body)
    end
  end

  describe "POST/api/employees/:id/leaves" do
    it "creates a new leave for an employee" do
      leave_attributes = attributes_for(:leave)

      post "/api/employees/1/leaves", params: { leave: leave_attributes }

      expect(response).to have_http_status(201)
      leave = JSON.parse(response.body)
    end
  end

  describe "PUT/api/employees/:id/leaves/:id" do
    it "updates the details in existing leave" do
      leave_attributes = attributes_for(:leave)

      put "/api/employees/1/leaves/4", params: { leave: leave_attributes }

      expect(response).to have_http_status(200)
      leave = JSON.parse(response.body)
    end
  end

  describe "DELETE/api/employees/:id/leaves/:id" do
    it "delete a particular leave of an employee" do
      delete "/api/employees/1/leaves/4"

      expect(response).to have_http_status(204)
    end
  end

  describe "GET /api/employees/:id/leaves_applied" do
    it "returns all leaves applied to the employee" do
      employee = create(:employee)
      leaves = create_list(:leave, 3, employee: employee)

      get "/api/employees/4/leaves_applied"

      expect(response).to have_http_status(200)
      leaves_response = JSON.parse(response.body)
      expect(leaves_response["leaves"].size).to eq(3)
    end
  end
end
