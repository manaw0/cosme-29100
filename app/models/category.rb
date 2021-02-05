class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '乾燥' },
    { id: 3, name: 'テカリ' },
    { id: 4, name: 'ニキビ' },
    { id: 5, name: '毛穴' }
  ]

  include ActiveHash::Associations
  has_many :items
end
