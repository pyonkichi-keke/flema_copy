class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit

  end

  def update
    if @address.update(address_params)
      flash[:notice] = "配送情報の更新が完了しました！"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "入力に誤りがあります。もう一度入力してください。"
      redirect_to edit_address_path(@address.id)
    end
  end

  private
  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :address,
      :apartment,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :tel
    )
  end
end
