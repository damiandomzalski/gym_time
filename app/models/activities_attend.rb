class ActivitiesAttend < ApplicationRecord
  belongs_to :user
  belongs_to :activities
end
