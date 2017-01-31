module UsersHelper
  #Returns gravatar for the user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=260"
    image_tag(gravatar_url, alt: user.first_name + " " + user.last_name, class: "gravatar")
  end
end