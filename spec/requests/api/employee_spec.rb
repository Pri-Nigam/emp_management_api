require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET/api/employees" do
    it "list out all the employees" do
      employee1 = create(:employee)
      employee2 = create(:employee)

      get "/api/employees"

      expect(response).to have_http_status(200)

      employees = JSON.parse(response.body)
    end
  end

  describe "GET/api/employees" do
    it "should show only one employee" do
      get "/api/employees/4"

      expect(response).to have_http_status(200)
      employee = JSON.parse(response.body)
    end
  end

  describe "POST/api/employees" do
    it "creates and show a newly created employee" do
      employee_attributes = attributes_for(:employee)

      post "/api/employees", params: { employee: employee_attributes }

      expect(response).to have_http_status(200)
      employee = JSON.parse(response.body)
    end
  end

  describe "PUT/api/employees" do
    it "updates the existing employee details" do
      put "/api/employees/5", params: { employee: { name: "Ankit Pandit" } }

      expect(response).to have_http_status(200)
      employee = JSON.parse(response.body)
      expect(employee["name"]).to eq("Ankit Pandit")
    end
  end

  describe "DELETE/api/employees" do
    it "deletes an existing employee" do
      delete "/api/employees/102"

      expect(response).to have_http_status(204)
    end
  end

  describe "GET/api/department_employees" do
    it "fetches the employees through department name" do
      department = create(:department, name: "Sales")
      designation = create(:designation, title: "Manager", department: department)
      employee1 = create(:employee, designation: designation)
      employee2 = create(:employee, designation: designation)

      get  "/api/employees/department_employees", params: { name: "Sales", title: "Manager"}

      expect(response).to have_http_status(200)
      employees = JSON.parse(response.body)
      expect(employees.size).to eq(2)
    end
  end
end
