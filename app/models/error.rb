class Error < ActiveRecord::Base
  belongs_to :service
  # attr_accessible :service_id, :name, :code

  # Validators
  validates :service_id,      :presence => true
  validates :name,            :presence => true
  validates :code,            :presence => true
end
