class Quoter < ActiveRecord::Base
  has_many :quotes, :dependent => :delete_all
  validates_presence_of :name, :rss_url
  validates_format_of :rss_url, :with => URI::regexp(%w(http https))
end
