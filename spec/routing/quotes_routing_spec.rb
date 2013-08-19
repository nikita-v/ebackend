require 'spec_helper'

describe "routing to quotes" do
  it "route to quotes list" do
    expect(:get => "/quotes").to route_to(
      :controller => "quotes",
      :action => "index"
    )
  end
  
  it "route to quotes list from select quoter" do
    expect(:get => "/quoters/1/quotes").to route_to(
      :controller => "quotes",
      :action => "index",
      :quoter_id => "1"
    )
  end
end
