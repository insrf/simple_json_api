Sequel.seed(:development, :test) do
  def run
    100.times { User.create login: Faker::Internet.username }
  end
end
