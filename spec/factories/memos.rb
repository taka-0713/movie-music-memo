FactoryBot.define do
  factory :memo do
    movie_title {"ムービータイトル"}
    director {"新米監督"}
    music {"新米作曲家"}
    movie_genre_id {2}
    music_genre_id {2}
    theme_song {"架空の主題歌"}
    inserted_song {"架空の挿入歌"}
    text {"これはテストです"}
    association :user

    after(:build) do |memo|
      memo.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
