class Attendance < ApplicationRecord
  belongs_to :employee
  validates :check_in, presence: true
  validate :check_out_after_check_in

  def check_out_after_check_in
    return if check_out.blank? || check_in.blank?
    errors.add(:check_out, "must be after check-in time") if check_out <= check_in
  end

  def total_hours
    return unless check_out.present? && check_in.present?
    duration_in_hours = (check_out - check_in) / 1.hour
    duration_in_hours.to_i
  end
end
