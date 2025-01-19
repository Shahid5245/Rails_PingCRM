class Organization < ApplicationRecord
  belongs_to :user
  has_many :contacts, dependent: :destroy
  validates :name, presence: true
  before_save :downcase_name

  private
  def downcase_name
    self.name = name.downcase if name.present?
  end
end
