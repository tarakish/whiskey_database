module ApplicationHelper
  def separate_header
    if controller_name != 'staticpages'
      return 'header-main'
    end
  end

  def space_head
    if controller_name != 'staticpages'
      return 'mt-7'
    end
  end
end
