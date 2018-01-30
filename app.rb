require 'sinatra'
require 'pry'
require 'net/http'
require './pdfier'

get '/' do
	erb :index, layout: :'layout/main'
end

post '/save_as_pdf' do 
	filename = Pdfier.new(params[:url], params[:filename]).save_as_pdf
	redirect "/download/#{filename}"
end

get '/download/:filename' do |filename|
	begin
		send_file "./files/#{filename}", filename: filename, type: 'Application/octet-stream'
	ensure
		# FileUtils.remove_file("./files/#{filename}", force = true)
		File.delete("./files/#{filename}")
		redirect '/'
	end
end
