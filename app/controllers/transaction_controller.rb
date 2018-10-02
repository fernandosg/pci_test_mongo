class TransactionController < ApplicationController
  def execute
    info = Payment.new
    render json: {"success":info.process_pay(params_transaction[:token])}
  end

  private
  def params_transaction
    params.permit(:token)
  end
end
