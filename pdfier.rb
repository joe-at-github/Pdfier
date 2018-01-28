class Pdfier

	def self.save_as_pdf(url, filename)
		`wkhtmltopdf #{url} #{filename}`
		`open #{filename}`
	end

end