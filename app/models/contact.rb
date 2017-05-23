class Contact < ApplicationRecord
  belongs_to :user
  has_many :contact_groups
  has_many :groups, through: :contact_groups
  
  def friendly_updated_at
    updated_at.strftime('%b %d, %Y')
  end
end
