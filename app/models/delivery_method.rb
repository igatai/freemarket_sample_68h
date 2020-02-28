class DeliveryMethod < ActiveHash::Base

  self.data = [
      {id: 1, name: 'ゆうパック'},
      {id: 2, name: 'クロネコヤマト'},
      {id: 3, name: '佐川急便'}
  ]

end