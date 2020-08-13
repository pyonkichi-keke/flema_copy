class UsersController < ApplicationController
  
  def show
    if CreditCard.find_by(user_id: current_user.id).present?
      @card = CreditCard.find_by(user_id: current_user.id)
    end
  end

end
