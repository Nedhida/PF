class SearchsController < ApplicationController

  def search
  # viewのform_withにて
    #選択したmodelの値を@modelに代入
    @model = params["model"]
    #選択した検索方法の値を@methodに代入
    @method = params["method"]
    #選択ワードを@contentに代入
    @content = params["content"]
    #上記３つの＠〜を代入したsearch_forを@recordsに代入
    @records = search_for(@content, @model, @method)
  end

  private
  def search_for(content, model, method)
    #選択したモデルがuserだったら
    if model == "user"
      #選択した検索方法が完全一致だったら
      if method == "perfect"
        User.where("name LIKE?", "#{content}")
      #選択した検索方法が部分一致だったら
      elsif method == "partial"
        User.where("name LIKE?", "%#{content}%")
      #前方一致
      elsif method == "forward"
        User.where("name LIKE?", "#{content}%")
      #後方一致
      elsif method == "backward"
        User.where("name LIKE?", "%#{content}")
      else
        User.all
      end

    elsif model == "variablecost_value"
      #完全一致
      if method == "perfect"
        VariablecostValue.where(["content LIKE(?) OR description LIKE(?) OR value LIKE(?)",
                                "#{content}","#{content}","#{content}"])
      #選択した検索方法が部分一致だったら
      elsif method == "partial"
        VariablecostValue.where(["content LIKE(?) OR description LIKE(?) OR value LIKE(?)",
                                "%#{content}%","%#{content}%","%#{content}%"])
      #前方一致
      elsif method == "forward"
        VariablecostValue.where(["content LIKE(?) OR description LIKE(?) OR value LIKE(?)",
                                "#{content}%","#{content}%","#{content}%"])
      #後方一致
      elsif method == "backward"
        VariablecostValue.where(["content LIKE(?) OR description LIKE(?) OR value LIKE(?)",
                                "%#{content}","%#{content}","%#{content}"])
      else
        VariablecostValue.all
      end

    elsif model == "variablecost"
      #完全一致
      if method == "perfect"
        Variablecost.where("name LIKE?", "#{content}")
      #部分一致
      elsif method == "partial"
        Variablecost.where("name LIKE?", "%#{content}%")
      #前方一致
      elsif method == "forward"
        Variablecost.where("name LIKE?", "#{content}%")
      #後方一致
      elsif method == "backward"
        Variablecost.where("name LIKE?", "%#{content}")
      else
        Variablecost.all
      end
    end
  end

end
