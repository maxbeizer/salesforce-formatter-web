Bundler.require :web
if development?
  Bundler.require :development
  require 'pry'
  require 'pry-remote'
end
require_relative 'lib/formatter'

get '/style.css' do
  scss :style
end

get '/' do
  erb :index
end

post '/convert' do
  @formatted = Formatter.format_15 params[:sfdc_id]
  erb :index
end

not_found do
  erb :'404'
end
