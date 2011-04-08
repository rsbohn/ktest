require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
      '<div>This is ktest.heroku.com</div>'
end

get '/:app' do
      "<div>Running bare #{params[:app]}</div>"
end

get '/:app/*' do 
      "<div>You want to run #{params[:app]}. Soon you will!</div>"
end

get '/help' do
      '<div>Some help would be nice.</div>'
end

