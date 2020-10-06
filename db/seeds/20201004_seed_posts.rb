Sequel.seed(:development, :test) do
  def run
    200.times { Post.create user_id: Faker::Number.between(1, 100),
                            title: Faker::Lorem.word,
                            body: Faker::Lorem.sentence,
                            ip: Faker::Internet.public_ip_v4_address,
                            rating: Faker::Number.between(1, 5) }
  end
end
