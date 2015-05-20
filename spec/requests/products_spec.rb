require 'rails_helper'

RSpec.describe "Products", type: :request do


  describe "GET /products" do

  	before { get products_path }

    it "view products" do  
      expect(response).to have_http_status(200)
    end

  end
end
