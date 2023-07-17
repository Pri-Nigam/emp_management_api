require 'rails_helper'

RSpec.describe "Api::Tasks", type: :request do
  describe "GET/api/employees/:id/tasks" do
    it "lists out all the tasks an employee" do
      task1 = create(:task)
      task2 = create(:task)

      get "/api/employees/1/tasks"

      expect(response).to have_http_status(200)
      tasks = JSON.parse(response.body)
    end
  end

  describe "GET/api/employees/:id/tasks" do
    it "shows a particular task of an employee" do
      get "/api/employees/1/tasks/2"

      expect(response).to have_http_status(200)
      task = JSON.parse(response.body)
    end
  end

  describe "POST/api/employees/:id/tasks" do
    it "creates a new task for an employee" do
      task_attributes = attributes_for(:task)

      post "/api/employees/1/tasks", params: { task: task_attributes }

      expect(response).to have_http_status(201)
      task = JSON.parse(response.body)
    end
  end  

  describe "PUT/api/employees/:id/tasks/:id" do
    it "updates the existing task of an employee" do
      task_attributes = attributes_for(:task)

      put "/api/employees/1/tasks/2", params: { task: task_attributes }

      expect(response).to have_http_status(200)
      task = JSON.parse(response.body)
    end
  end

  describe "DELETE/api/employees/:id/tasks/:id" do
    it "destroys a particular task of an employee" do
      delete "/api/employees/1/tasks/2"
      
      expect(response).to have_http_status(204)
    end
  end
end
