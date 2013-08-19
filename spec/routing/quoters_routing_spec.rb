require 'spec_helper'

describe "routing to quoters" do
  it "route to quoters list" do
    expect(:get => "/quoters").to route_to(
      :controller => "quoters",
      :action => "index"
    )
  end
  
  it "route to 'new' quoter page" do
    expect(:get => "/quoters/new").to route_to(
      :controller => "quoters",
      :action => "new"
    )
  end
  
  it "route to 'create' quoter page" do
    expect(:post => "/quoters").to route_to(
      :controller => "quoters",
      :action => "create"
    )
  end
  
  it "route to 'edit' quoter page" do
    expect(:get => "/quoters/1/edit").to route_to(
      :controller => "quoters",
      :action => "edit",
      :id => "1"
    )
  end
  
  it "route to 'update' quoter" do
    expect(:patch => "/quoters/1").to route_to(
      :controller => "quoters",
      :action => "update",
      :id => "1"
    )
  end
  
  it "route to 'destroy' quoter" do
    expect(:delete => "/quoters/1").to route_to(
      :controller => "quoters",
      :action => "destroy",
      :id => "1"
    )
  end
end
