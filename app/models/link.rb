class Link < ApplicationRecord
  validates :url, presence: true

  def shorten(hostname)
    self.random_hex_string = SecureRandom.urlsafe_base64(3)
    self.short_url = "#{hostname}/#{random_hex_string}"
    self.save
  end

end
