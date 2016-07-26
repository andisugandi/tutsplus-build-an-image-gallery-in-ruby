require "sequel"

if ENV["RACK_ENV"] == "production"
  DB = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/imagegallerydb')
else
  DB = Sequel.connect "sqlite://db/#{ENV["RACK_ENV"]}.sqlite3"
end

DB.create_table :images do
  primary_key :id
  String :title
  String :file
end
