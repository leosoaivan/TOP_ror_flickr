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

  def recent_photos
    flickr.photos.getRecent per_page: 10
  end

  def photo_info(photo)
    flickr.photos.getInfo(photo_id: photo.id)
  end
end