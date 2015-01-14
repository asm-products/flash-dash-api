#to provide json response of third party services.

module Api
  module V1
    class ThirdpartyController < ApplicationController
      def instagram
        output = getrecentmedia(params[:username])
        render json: { response: output}
      end

      def lastfm
        output = getrecenttrack(params[:username])
        render json: {response: output}
      end

      def twitter
        output = gettweets(params[:username])
        render json: {response: output}
      end

    end
  end
end

private

  def getrecentmedia username
    clientid = 'INSTAGRAM-CLIENT-ID'
    baseuri = "https://api.instagram.com/v1"

    response = HTTParty.get("#{baseuri}/users/search?q=#{username}&client_id=#{clientid}")
    if response
      userid = response["data"][0]["id"]
    else
      return "{error: there is an error while fetching the data}"
    end

    recentmedia = HTTParty.get("#{baseuri}/users/#{userid}/media/recent/?client_id=#{clientid}")
    if recentmedia
      return recentmedia["data"][0]["images"]
    else
      return "{error: there is an error while fetching the data}"
    end
  end

  def getrecenttrack username
    clientid = 'LASTFM-CLIENT-ID'
    baseuri = 'http://ws.audioscrobbler.com/2.0'

    response = HTTParty.get("#{baseuri}/?method=user.getrecenttracks&user=#{username}&api_key=#{clientid}&format=json")
    if response
      if response["recenttracks"]["track"]
        return response["recenttracks"]["track"][0]
      else
        return "{error: there is no track details to fetch}"
      end
    else
      return "{error: there is an error while fetching the data}"
    end
  end

  def gettweets username
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = "CONSUMER_KEY"
      config.consumer_secret = "CONSUMER_SECRET"
      config.access_token = "ACCESS_TOKEN"
      config.access_token_secret = "ACCESS_SECRET"
    end

    options = {count: 5, include_rts: true}
    response = client.user_timeline(username, options)
    if response
      return response
    else
      return "{error: there is an error while fetching the data}"
    end
  end
