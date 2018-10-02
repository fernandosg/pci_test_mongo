require 'redis'

class Card
  include Mongoid::Document

  field :name_card, type: String
  field :number_bin, type: Integer
  field :last_digits, type: Integer
  field :expiration_date, type: String
  field :schema, type:String
  field :mark_card, type:String
  field :number_card, type: Integer
  field :token, type: String
  field :cvv, type: Integer
  validates_presence_of :name_card, :number_bin, :number_card, :expiration_date, :schema, :mark_card
  before_save :get_data

  def get_data
    self.last_digits = self.number_card.to_s.last(4).to_i
  end

  def tokenize
    redis = Redis.new(host: "localhost", port: 6379, db: 15)
    name = self.name_card
    encoding_data = JsonWebToken.encode(number_card: self.number_card, cvv: self.cvv, expiration_date: self.expiration_date)
    token = JsonWebToken.encode(id: self._id.to_s)
    key = "encode_data_#{self._id.to_s}"
    redis.set(key, encoding_data)
    redis.expire(key, 600)
    self.expiration_date = "X"
    self.number_card = 0
    self.cvv = 0
    self.save
    return token
  end
end
