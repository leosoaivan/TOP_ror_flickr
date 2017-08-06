module FlickrHelper
  def valid_user?(user_id)
    api_connection
    begin
      true if flickr.profile.getProfile(user_id: user_id).is_a?(FlickRaw::Response)
    rescue
      false
    end
  end

  def user_photos(user_id)
    api_connection
    flickr.photos.search(user_id: user_id)
  end

  def api_connection
    FlickRaw.api_key = Figaro.env.flickr_api_key
    FlickRaw.shared_secret = Figaro.env.flickr_secret
  end
end