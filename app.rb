Bundler.require :web
if development?
  Bundler.require :development
  require 'pry'
  require 'pry-remote'
end
require_relative 'lib/formatter'

helpers do
  # parse a text area.  We want an array of IDs coming out.
  # Do the right thing for newline or comma separated values.
  def parse(inputtext)
    inputtext.split(/[,\n]/).map(&:strip).reject(&:empty?)
  end

  # format a list of tuples
  def oformat(ids)
    ids.inject(""){ |out, idpair| out += "#{idpair[0]} : #{idpair[1]}\n"}
  end

end

get '/style.css' do
  scss :style
end

get '/' do
  erb :index
end

post '/convert' do
  puts "GOT #{params[:sfdc_id]}"
  ids = parse(params[:sfdc_id])

  ids.map!{ |id| [id, (Formatter.format_15 id)] }
  @formatted = oformat(ids)
  erb :index
end

not_found do
  erb :'404'
end
