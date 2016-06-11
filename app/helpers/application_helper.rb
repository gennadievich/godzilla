module ApplicationHelper
  def text_with_icon(icon_path, side, text)
    ("#{image_tag icon_path, size: convert_side(side)} " + text).html_safe
  end

  def convert_side(side)
    "#{side}x#{side}"
  end
end
