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
end
