class Contact < ApplicationRecord
  belongs_to :organization, optional: true
  validates :first_name, :last_name, presence: true
  before_save :downcase_names

  private
  def downcase_names
    self.first_name = first_name.downcase if first_name.present?
    self.last_name = last_name.downcase if last_name.present?
  end
end
