class FileUploader < Shrine
  def generate_location(_io, metadata: {}, **_options)
    original_filename = metadata['filename']
    this_year         = Time.zone.now.strftime('%Y')
    today             = Time.zone.now.strftime('%Y-%m-%d')

    filename =
      "#{File.basename(original_filename, '.*')}_#{SecureRandom.hex[0..10]}#{File.extname(original_filename)}"

    "#{this_year}/#{today}/#{filename}"
  end
end
