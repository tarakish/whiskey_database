module ApplicationHelper
  include Pagy::Frontend

  def separate_header
    if controller_name == 'staticpages'
      render 'shared/top_header'
    else
      render 'shared/header'
    end
  end

  def separate_menu
    if logged_in?
      render 'shared/header_menu'
    else
      render 'shared/header_menu_before_login'
    end
  end

  def space_behind_head
    return 'mt-7' if controller_name != 'staticpages'
  end

  def draw_rating(n, star)
    html_text = ''
    (n + 1).times do
      html_text += render 'shared/rating/star'
    end

    # 5つ星と3つ星を出し分ける
    (star - 1 - n).times do
      html_text += render 'shared/rating/outline_star'
    end
    return raw(html_text)
  end
end
