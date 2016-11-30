module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def cache_key_for_user_row(user)
    "user-#{user.id}-#{user.updated_at}"
  end

  def cache_key_for_car_table
    "user-table-#{User.maximum(:updated_at)}"
  end
end
