class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :age

  with_options presence: true do
    validates :title
    validates :content
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :age_id, numericality: { other_than: 1 }
    validates :image
  end

  def self.search(search)
    if search != ""
      Item.where('content LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

end
