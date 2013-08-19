module Ebashim
  class ApiV1 < Grape::API
    version 'v1', :using => :path
    format :json
    default_format :json
    content_type :json, "application/json; charset=utf-8"

    resource :quoters do
      get do
        Quoter.select(:id, :name).all
      end
    end

    resource :quotes do
      params do
        requires :quoter_ids, :type => Array[Integer]
        optional :timestamp, :type => Integer, :default => 0
      end
      get do
        Quote.select(:id, :title, :body, :publicated_at)
              .where(:quoter_id => params[:quoter_ids])
              .where('publicated_at > ?', Time.at(params[:timestamp]))
              .limit(500)
      end
    end
  end
end