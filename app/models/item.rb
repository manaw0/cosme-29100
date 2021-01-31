class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_days_id
  end
end
