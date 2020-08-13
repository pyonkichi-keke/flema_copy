class CreditCardsController < ApplicationController
  require 'payjp'

  def new
    card = CreditCard.find_by(user_id: current_user.id)
  end

  def create
    Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    if params['payjp-token'].blank?
      flash[:alert] = "入力に誤りがあります。もう一度入力してください。"
      redirect_to new_credit_card_path
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_token: customer.default_card)
      if @card.save
        flash[:notice] = "クレジットカード情報を登録しました。"
        redirect_to root_path and return
      else
        flash[:alert] = "入力に誤りがあります。もう一度入力してください。"
        redirect_to new_credit_card_path
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = CreditCard.find_by(user_id: current_user.id)
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      flash[:alert] = "クレジットカード情報を削除しました"
      redirect_to user_path(current_user.id)
  end

end
