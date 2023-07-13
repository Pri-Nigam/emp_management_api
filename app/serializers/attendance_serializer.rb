class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :check_in, :check_out, :employee

  def employee
    object.employee.name
  end
end
