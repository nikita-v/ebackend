class QuotesController < ApplicationController
  def index
    unless params[:quoter_id].nil?
      @quotes = Quote.where(:quoter_id => params[:quoter_id])
    else
      @quotes = Quote.eager_load(:quoter)
    end
    @quotes = @quotes.page(params[:page])
  end
end
