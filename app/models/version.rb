class Version < ActiveRecord::Base

  # Relations
  has_many :resources
  has_one :changelog
  has_and_belongs_to_many :tags, join_table: 'versions_tags'

  # Validators
  validates :name, presence: true

  before_save :create_slug

  scope :active, -> { where(is_active: true) }

  def clone_with_associations
    new_version = self.dup
    # #two-level association
    self.resources.each do |resource|
      new_resource = resource.dup

      resource.services.each do |service|
        new_service = service.clone_with_associations

        new_resource.services << new_service
      end

      new_version.resources << new_resource
    end
    new_version
  end

private
  def create_slug
    self.slug = self.name.parameterize
  end
end
