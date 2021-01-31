class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :status_id
    validates :age_id
  end
end
