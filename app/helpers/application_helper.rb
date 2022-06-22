module ApplicationHelper
  include Pagy::Frontend

  def separate_header
    if controller_name == 'staticpages'
      render 'shared/headers/top_header'
    else
      render 'shared/headers/header'
    end
  end

  def separate_menu
    if logged_in?
      render 'shared/headers/header_menu'
    else
      render 'shared/headers/header_menu_before_login'
    end
  end

  def space_behind_head
    return 'mt-7' if controller_name != 'staticpages'
  end

  def draw_rating(n, star)
    html_text = ''
    (n + 1).times do
      html_text += render 'shared/ratings/star'
    end
    # 5つ星と3つ星を出し分ける
    (star - 1 - n).times do
      html_text += render 'shared/ratings/outline_star'
    end
    raw(html_text)
  end
end
