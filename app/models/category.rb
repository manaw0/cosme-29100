class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'プチプラ' },
    { id: 3, name: 'デパコス' }
  ]
end