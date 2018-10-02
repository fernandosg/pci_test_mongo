class Payment

  def process_pay token
    log = Log.new
    data = log.process_token token
    return data != nil
  end
end
