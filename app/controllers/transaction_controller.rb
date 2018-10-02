class TransactionController < ApplicationController
  def execute
    info = Payment.new
    result = info.process_pay(params_transaction[:token])
    if result == false
      status = :bad_request
    else
      status = 200
    end
    render json: {"success":info.process_pay(params_transaction[:token])}, :status=>status
  end

  private
  def params_transaction
    params.permit(:token)
  end
end
