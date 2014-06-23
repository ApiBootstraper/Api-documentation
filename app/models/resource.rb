class Resource < ActiveRecord::Base
  belongs_to :version
  has_many :services
  attr_accessible :name, :slug, :version_id, :version, :description

  # FriendlyId config
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Validators
  validates :version_id,      :presence => true
  validates :name,            :presence => true

  before_save :create_slug

  def version
    Version.find(self.version_id)
  rescue
  end

private
  def create_slug
    self.slug = self.name.parameterize
  end
end
