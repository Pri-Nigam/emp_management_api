require 'rails_helper'

RSpec.describe "Api::Attendances", type: :request do
  describe "GET/api/employees/attendances" do
    it "list out the attendances of an employee" do
      attendance1 = create(:attendance)
      attendance2 = create(:attendance)
      
      get "/api/employees/1/attendances"

      expect(response).to have_http_status(200)
      attendances = JSON.parse(response.body)
    end
  end

  describe "GET/api/employees/:id/attendances/:id" do
    it "fetches the attendance of an employee" do
      get "/api/employees/1/attendances/2023-07-12" 

      expect(response).to have_http_status(200)
      attendance = JSON.parse(response.body)
    end
  end

  describe "POST/api/employees/1/attendances" do
    it "creates attendance for an employee" do
      attendance_attributes = attributes_for(:attendance)
      
      post "/api/employees/1/attendances", params: { attendance: attendance_attributes}

      expect(response).to have_http_status(201)
      attendance = JSON.parse(response.body)
    end
  end

  describe "PUT/api/employees/1/attendances" do
    it "update the check_out time of attendance of an employee" do
      put "/api/employees/1/attendances/2", params: { attendance: { check_out: "20.00"} }

      expect(response).to have_http_status(200)
      attendance = JSON.parse(response.body)
    end
  end
end
