class Changelog < ActiveRecord::Base
  belongs_to :version
  # attr_accessible :version_id, :text, :version

  # TODO: Reactivate it
  # audited

  # Validators
  validates :version_id,  :presence => true,
                          :uniqueness => true
  validates :text,        :presence => true

  def version
    Version.find(self.version_id)
  end
end
