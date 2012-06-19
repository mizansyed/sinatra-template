require_relative 'acceptance_helper'

describe "Home page", "Tests for home page" do

  include AcceptanceHelper

  it "return 200" do
    visit "/"
    assert_equal 200, page.status_code
  end

  it "shows welcome page" do
    visit "/"
    assert has_content?("Basic structure for Sinatra project")
  end
end
