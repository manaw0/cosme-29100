class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '乾燥肌' },
    { id: 3, name: '混合肌' },
    { id: 4, name: '脂性肌' },
  ]
 end
