class Quote < ActiveRecord::Base
  belongs_to :quoter
  validates_presence_of :quoter_id, :title, :body, :publicated_at
  default_scope ->{ order(:publicated_at => :desc) }
end
