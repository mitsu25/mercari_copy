module ApplicationHelper

  def has_user_liked?(item)
    Like.where(item_id:item.id,  user_id:current_user.id).present?
  end

  def does_item_have_likes?(item)
    item.likes.present?
  end

  def get_likes_number(item)
    likes_number = item.likes.count
    if likes_number > 0
      return likes_number
    else
      return "&nbsp;".html_safe
    end
  end
end
