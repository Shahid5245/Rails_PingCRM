class Contact < ApplicationRecord
  belongs_to :organization, optional: true
  validates :first_name, :last_name, presence: true
end
