require "sequel"

configure :development do
  ENV["RACK_ENV"] ||= "development"
  DB = Sequel.connect "sqlite://db/#{ENV["RACK_ENV"]}.sqlite3"
end

configure :production do
  DB = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/imagegallerydb')
end

DB.create_table :images do
  primary_key :id
  String :title
  String :file
end
