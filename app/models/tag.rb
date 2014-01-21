class Tag < ActiveRecord::Base
  # Validators
  validates :name, presence: true
end
