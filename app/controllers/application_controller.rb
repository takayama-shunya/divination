class ApplicationController < ActionController::Base

    # ログイン後のリダイレクト先 RegistrationsControllerに記載あり
    # def after_sign_in_path_for(resource)
    #     nordic_rune_index_path
    # end

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource)
      new_user_session_path
    end
end
