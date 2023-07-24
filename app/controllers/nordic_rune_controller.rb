class NordicRuneController < ApplicationController

    def index
    end

    # 結果を表示
    def devination_result
      # ランダムなルーン文字を取得
      @rune = NordicRune.order("RANDOM()").first
    end
    
end
