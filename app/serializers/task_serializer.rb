class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :duedate
end
