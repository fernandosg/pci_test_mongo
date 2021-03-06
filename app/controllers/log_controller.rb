class LogController < ApplicationController

  def log
    card = Card.create card_params
    if card.errors.size > 0
      render json:{"success"=>false, "errors"=>card.errors.as_json}, :status => :bad_request
    else
      render json:{"success"=>true, "token"=>card.tokenize}
    end
  end

  private
  def card_params
      params.permit(:name_card, :number_bin, :expiration_date, :schema, :mark_card, :number_card)
  end
end
