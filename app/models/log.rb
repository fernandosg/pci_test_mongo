require 'redis'
class Log

  def process_token token
    redis = Redis.new(host: "localhost", port: 6379, db: 15)
    token_decode = JsonWebToken.decode(token)
    if token_decode == nil
      return nil
    end
    data_encode = redis.get("encode_data_#{token_decode[:id]}")
    data_decode = JsonWebToken.decode(data_encode)
    return data_decode
  end
end
