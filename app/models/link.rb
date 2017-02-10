class Link < ApplicationRecord
  validates :url, presence: true
  after_create :shorten

  def shorten
    # Create a unique string from id
    self.random_hex_string = self.id.to_s(36)
    self.short_url = ENV['hostname'] + '/' + self.random_hex_string
    self.save
  end

end
