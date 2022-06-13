module UsersHelper
  def avatar(user, size = 150)
    image_tag user.avatar.variant(resize_to_fill: [size, size]), class: 'user-avater' if user.avatar.attached?
  end
end