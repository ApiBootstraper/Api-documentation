class Service < ActiveRecord::Base
  attr_accessible :resource_id, :name, :summary, :http_method, :note, :auth_required, :example_note
  attr_accessible :parameters, :http_errors, :examples
  attr_accessible :parameters_attributes, :http_errors_attributes, :examples_attributes

  belongs_to :resource
  has_many :parameters
  has_many :examples
  has_many :http_errors, :class_name => "Error"

  # Nested form
  accepts_nested_attributes_for :parameters,  :allow_destroy => true
  accepts_nested_attributes_for :examples,    :allow_destroy => true
  accepts_nested_attributes_for :http_errors, :allow_destroy => true

  # Validators
  validates :resource_id,     :presence => true
  validates :name,            :presence => true
  validates :summary,         :presence => true
  validates :http_method,     :presence => true

  def clone_with_associations
    new_service = self.dup

    self.parameters.each do |p|
      new_p = p.dup
      new_service.parameters << new_p
    end
    self.examples.each do |e|
      new_e = e.dup
      new_service.examples << new_e
    end
    self.http_errors.each do |h|
      new_h = h.dup
      new_service.http_errors << new_h
    end

    new_service
  end
end
