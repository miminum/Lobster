module ShopsHelper
  def to_stars(score)
    score_whole = score.to_i.floor
    remainder = score_whole - score.to_i
    erb = []
    score_whole.times do 
      erb << '<%= fa_icon "star" %>'
    end
    erb << '<%= fa_icon "star-half" %>' if remainder > 0.25
    erb.join('')
  end
end
