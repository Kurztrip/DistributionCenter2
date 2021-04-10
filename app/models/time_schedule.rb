class TimeSchedule < ApplicationRecord
  belongs_to :distribution_center
  has_many :time_windows, dependent: :destroy
end
