require 'spec_helper'
require "rails_helper"

RSpec.describe LogController, :type => :controller do
  describe "POST log" do
    it "success with all data" do
      post :log, params:{"name_card"=>"Fernando", "number_bin"=>123, "number_card"=>411111111111, "expiration_date"=>"20/18", "schema"=>"DEBIT", "mark_card"=>"MasterCard"}
      expect(response.status).to eq(200)
    end

    it "fail without some data data" do
      post :log, params:{"number_bin"=>123, "number_card"=>411111111111, "expiration_date"=>"20/18", "schema"=>"DEBIT", "mark_card"=>"MasterCard"}
      expect(response.status).to eq(400)
    end
  end
end
