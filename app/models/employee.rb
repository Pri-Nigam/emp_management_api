class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :designation
  has_one :salary, through: :designation
  has_and_belongs_to_many :tasks
  has_many :attendances
  has_many :leaves

  def accepted_leaves
    leaves = self.leaves.where(status:"accepted")
    leave_days = 0
    leaves.each do |leave|
      if leave.to_date > leave.from_date
        if leave.to_session > leave.from_session || leave.to_session < leave.from_session
          leave_days = (leave.to_date - leave.from_date).to_i
        else
          leave_days = ((leave.to_date - leave.from_date).to_i) - 0.5
        end
      elsif leave.to_date == leave.from_date
        if leave.to_session > leave.from_session || leave.to_session < leave.from_session
          leave_days = 1
        else
          leave_days = 0.5
        end
      end
    end
    leave_days
  end
end
