require 'rails_helper'

RSpec.describe "Authentication", :type => :request do
  describe "GET /authentication_pages" do
    it "works! (now write some real specs)" do
      get authentication_pages_index_path
      expect(response.status).to be(200)
    end
  end
end
