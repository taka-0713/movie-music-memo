class MusicGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ポップス' },
    { id: 3, name: 'ロック' },
    { id: 4, name: 'ソウル、R&B' },
    { id: 5, name: 'ヒップホップ' },
    { id: 6, name: 'ジャズ' },
    { id: 7, name: 'ワールドミュージック' },
    { id: 8, name: 'エレクトロニカ'},
    { id: 9, name: 'クラシック' },
    { id: 10, name: '様々なジャンル' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :memos

end
