class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :gender, :contact, :designation, :department

  def designation
    object.designation.title
  end

  def department
    object.designation.department.name
  end
end
