require 'spec_helper'
require "rails_helper"

RSpec.describe TransactionController, :type => :controller do
  describe "POST log" do
    it "success with correct token" do
      card = build(:card, number_bin:123, number_card:4111111111111111, expiration_date:"20/18", schema:"DEBIT", mark_card:"MasterCard")
      card.save
      json = {"token"=>card.tokenize}
      post :execute, params:json
      expect(response.status).to eq(200)
    end

    it "fail without some data data" do
      json = {"token"=>"123"}
      post :execute, params:json
      expect(response.status).to eq(400)
    end
  end
end
