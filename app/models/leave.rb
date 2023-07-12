class Leave < ApplicationRecord
  belongs_to :employee

  enum :leave_type, {casual: 0, optional: 1, compoff: 2, paid: 4}
  enum :status, {hold: 0, accepted: 1, rejected: 2}
end
