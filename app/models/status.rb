class Status < ActiveHash::Base

  self.data = [
      {id: 1, name: '出品中'},
      {id: 2, name: '出品一時停止'},
      {id: 3, name: '売約完了'},
      {id: 4, name: '入金完了'},
      {id: 5, name: '発送完了'},
      {id: 6, name: '受け取り完了'}
  ]

end