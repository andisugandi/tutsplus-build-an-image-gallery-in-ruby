require "bundler"
Bundler.require

configure :development do
  ENV["RACK_ENV"] ||= "development"
  DB = Sequel.connect "sqlite://db/#{ENV["RACK_ENV"]}.sqlite3"
end

configure :production do
  DB = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/imagegallerydb')
end

require "./app"
require "./lib/image_uploader"
require "./lib/image"

run App
