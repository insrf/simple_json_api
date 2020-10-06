require 'sinatra'
require 'sequel'
require 'sequel/extensions/seed'
require 'faker'





Sequel.extension :migration, :seed

# require 'pry'; binding.pry
Sequel::Migrator.run(DB, "db/migrations")
# Sequel.extension :seed

class User < Sequel::Model
  one_to_many :posts
end

class Post < Sequel::Model
  many_to_one :user
end

Sequel::Seed.setup :development
Sequel::Seeder.apply(DB, "db/seeds")

get '/' do
  # require 'pry'; binding.pry
  items = DB[:users]
  "#{items.map { |r| r[:login] }}"

end
