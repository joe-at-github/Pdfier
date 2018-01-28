require 'sinatra'
require 'pry'
require './pdfier'

get '/' do
	erb :index, layout: :'layout/main'
end

post '/save_as_pdf' do 
	Pdfier.save_as_pdf(params[:url], params[:filename])
	redirect '/'
end