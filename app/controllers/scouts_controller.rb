class ScoutsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    #ログインユーザー情報を取得
    @user = current_user

    #お気に入り店舗情報を取得
    @favorite_stores = @user.stores
  end
end
