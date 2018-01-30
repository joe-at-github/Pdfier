class Pdfier

	def initialize(url, filename)
		@url = url
		@filename = filename
	end

	def save_as_pdf
		`wkhtmltopdf #{@url} ./files/#{get_filename}`
		get_filename
	end

	private
	def get_filename
		return @filename if @filename.match(/\.pdf$/)
		"#{@filename}.pdf"
	end
end