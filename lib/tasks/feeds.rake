require 'action_view/helpers'

namespace :feeds do  
  desc "Fetch new quotes"
  task :fetch => :environment do
    Quoter.all.each do |quoter|
      last_quote = quoter.quotes.first
      last_quote_timestamp = last_quote.nil? ? Time.at(0) : last_quote.publicated_at
      feed = Feedzirra::Feed.fetch_and_parse(quoter.rss_url)
      feed.entries.each do |entry|
        if entry.published > last_quote_timestamp
          puts entry.title
          Quote.create! :quoter_id => quoter.id,
                        :title => entry.title,
                        :body => entry.summary,
                        :publicated_at => entry.published
        end
      end
    end
  end
end
