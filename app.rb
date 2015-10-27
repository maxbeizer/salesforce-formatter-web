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
  def parse(t)
    t.split(/[,\n]/).map(&:strip).select{ |x| !x.empty? }
  end

  # format a list of tuples
  def oformat(ids)
    out = ""
    ids.each{ |i| out += "#{i[0]} : #{i[1]}\n"}
    return out
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
