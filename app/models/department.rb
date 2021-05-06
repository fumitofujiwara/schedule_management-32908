class Department < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '役員' },
    { id: 3, name: '営業' },
    { id: 4, name: '経理' },
    { id: 5, name: '総務' }
  ]

  include ActiveHash::Associations
  has_many :users
  
end