require 'json'
require 'open-uri'
require 'pry'

class SpotifyChart

  BASE_URL = "http://charts.spotify.com/api/tracks/"

  def get_url(preference, region)
    # return a string that is the base url + / + preference + / + region + / + latest
    "#{BASE_URL}#{preference}/#{region}/weekly/latest"
  end

  def get_json(url)
    # load json given a url here
    # refer to the references if you have questions about this
    JSON.load(open(url))
  end

  def fetch_track_album_artist(music_hash)
    # example music_hash:
    # {  
    #   "tracks" => [  
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"All About That Bass",
    #       "artist_name"  =>"Meghan Trainor",
    #       "album_name"   =>"Title"
    #     },
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"Break Free",
    #       "artist_name"  =>"Ariana Grande",
    #       "album_name"   =>"Break Free"
    #     }
    #   ]
    # }

    # given a hash, like the one above, this method should return a string like:
    # '<track name>' by <artist name> from the <album name>
  
    # the track name, artist name, and album name should be the first track in the
    # tracks array

    "'#{music_hash["tracks"][0]["track_name"]}' by #{music_hash["tracks"][0]["artist_name"]} from the album #{music_hash["tracks"][0]["album_name"]}"
  end


  def most_streamed(region)
    # call no get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable
    #preference = 'most_streamed'
    #new_url = get_url(preference, region)
    url_string = get_url("most_streamed", region)

    # call on get_json here, using the string that get_url returns
    
    new_json_hash = get_json(url_string)

    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns

    fetch_track_album_artist(new_json_hash)
    
  end

  def most_shared(region)
    # call no get_url here, where preference is the string 'most_shared',
    # and set it equal to a variable
    url_string = get_url("most_shared", region)

    # call on get_json here, using the string that get_url returns
    new_json_hash = get_json(url_string)

    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
    fetch_track_album_artist(new_json_hash)
  end
end
