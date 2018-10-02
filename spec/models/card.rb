require "rails_helper"

RSpec.describe Card, :type => :model do

    it "should not be save without persistent information" do
      card = Card.new
      expect(card.save).should eql?(false)
    end

    it "should not be save without name card" do
      card = build(:card, number_bin:123, number_card:4111111111111111, expiration_date:"20/18", schema:"DEBIT", mark_card:"MasterCard")
      expect(card.save).should eql?(false)# be_valid
    end


    it "should not be save without number bin" do
      card = build(:card, name_card:"Fernando", number_card:4111111111111111, expiration_date:"20/18", schema:"DEBIT", mark_card:"MasterCard")
      expect(card.save).should eql?(false)
    end

    it "should not be save without number card" do
      card = build(:card, name_card:"Fernando", number_bin:123, expiration_date:"20/18", schema:"DEBIT", mark_card:"MasterCard")
      expect(card.save).should eql?(false)
    end

    it "should not be save without expiration date" do
      card = build(:card, name_card:"Fernando", number_bin:123, number_card:4111111111111111, schema:"DEBIT", mark_card:"MasterCard")
      expect(card.save).should eql?(false)
    end

    it "should not be save without schema" do
      card = build(:card, name_card:"Fernando", number_bin:123, number_card:4111111111111111, expiration_date:"20/18", mark_card:"MasterCard")
      expect(card.save).should eql?(false)
    end

    it "should not be save without mark card" do
      card = build(:card, name_card:"Fernando", number_bin:123, number_card:4111111111111111, expiration_date:"20/18", schema:"DEBIT")
      expect(card.save).should eql?(false)
    end

    it "should be save with all persistent information" do
      card = build(:card, name_card:"Fernando", number_bin:123, number_card:4111111111111111, expiration_date:"20/18", schema:"DEBIT", mark_card:"MasterCard")
      expect(card).to be_valid
    end

    it "should not have sensitive information after tokenize" do
      card = build(:card, name_card:"Fernando", number_bin:123, number_card:4111111111111111, expiration_date:"20/18", schema:"DEBIT", mark_card:"MasterCard")
      card.tokenize
      card.cvv.should .equal?(0)
      card.number_card.should equal?(0)
      card.number_card.should equal?(0)
      card.expiration_date.should equal?("X")
    end

    it "should not be accessible the data if the expiration was passed" do
      card = build(:card, name_card:"Fernando", number_bin:123, number_card:4111111111111111, expiration_date:"20/18", schema:"DEBIT", mark_card:"MasterCard")
      card
      token = card.tokenize
      redis = Redis.new(host: "localhost", port: 6379, db: 15)
      token_decode = JsonWebToken.decode(token)
      key = "encode_data_#{token_decode[:id]}"
      redis.expire(key, -1)
      expect(redis.get(key)).to be_nil
    end
end
