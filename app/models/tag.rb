class Tag < ActiveRecord::Base
  attr_accessible :name, :color

  # Validators
  validates :name,       :presence => true

end
