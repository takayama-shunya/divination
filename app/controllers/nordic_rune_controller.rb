class NordicRuneController < ApplicationController

    def index
      @rune = nil;
    end

    # 結果を表示
    def devination_result
      # ランダムなルーン文字を取得
      @rune = NordicRune.order("RANDOM()").first
      @normal_position = [true, false].sample
      render template: "nordic_rune/index", 
             locals: {rune: @rune, normal_position: @normal_position}
    end

end
