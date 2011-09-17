PDFKit.configure do |config|
  config.wkhtmltopdf = Rails.root.join('/usr/local/bin/wkhtmltopdf').to_s

end
