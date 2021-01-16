class MovieGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アクション' },
    { id: 3, name: 'コメディ' },
    { id: 4, name: 'ラブストーリー' },
    { id: 5, name: '青春、ヒューマンストーリー' },
    { id: 6, name: 'SF、ファンタジー' },
    { id: 7, name: 'クライム、サスペンス' },
    { id: 8, name: 'ホラー、パニック'},
    { id: 9, name: 'ミステリー' },
    { id: 10, name: 'ドキュメンタリー' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :memos

end
