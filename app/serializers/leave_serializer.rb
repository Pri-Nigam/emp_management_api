class LeaveSerializer < ActiveModel::Serializer
  attributes :id, :employee_id, :from_date, :to_date, :from_session, :to_session, :reason, :leave_type, :status

  def employee_id
    object.employee.id  
  end
end
