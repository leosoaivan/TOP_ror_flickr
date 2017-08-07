module FlickrHelper
  def valid_user?(user_id)
    FlickRaw.api_key = Figaro.env.flickr_api_key
    FlickRaw.shared_secret = Figaro.env.flickr_secret
    
    begin
      true if flickr.profile.getProfile(user_id: user_id).is_a?(FlickRaw::Response)
    rescue
      false
    end
  end

  def user_photos(user_id)
    FlickRaw.api_key = Figaro.env.flickr_api_key
    FlickRaw.shared_secret = Figaro.env.flickr_secret

    flickr.photos.search(user_id: user_id)
  end

  def recent_photos
    FlickRaw.api_key = Figaro.env.flickr_api_key
    FlickRaw.shared_secret = Figaro.env.flickr_secret

    flickr.photos.getRecent per_page: 50
  end
  
  def photo_info(photo)
    FlickRaw.api_key = Figaro.env.flickr_api_key
    FlickRaw.shared_secret = Figaro.env.flickr_secret
    
    flickr.photos.getInfo(photo_id: photo.id)
  end

  def api_connection
    FlickRaw.api_key = Figaro.env.flickr_api_key
    FlickRaw.shared_secret = Figaro.env.flickr_secret
  end
end