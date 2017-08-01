module FlickrHelper
  def user_photos(user_id)
    api_connection
    flickr.photos.search(user_id: user_id)
  end

  private

    def api_connection
      FlickRaw.api_key = Figaro.env.flickr_api_key
      FlickRaw.shared_secret = Figaro.env.flickr_secret
    end
end
