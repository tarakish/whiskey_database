module ApplicationHelper
  def label(flavor)
    group = flavor.group
    case group
      when 'woody'
        'woody'
      when 'winy'
        'red'
      when 'fruity'
        'orange'
      when 'floral'
        'pink'
      when 'sereal'
        'yellow'
      when 'smoky'
        'teal'
    end
  end
end
