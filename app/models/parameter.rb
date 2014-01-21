class Parameter < ActiveRecord::Base
  belongs_to :service
  # attr_accessible :service_id, :name, :format, :is_required, :default_value, :value_format, :description

  # Validators
  validates :service_id,      :presence => true
  validates :name,            :presence => true
  validates :format,            :presence => true
  validates :value_format,    :presence => true
  validates :description,     :presence => true
end

