module LocationsHelper
  #need to pull in all data from marta - it is currently in json, need to parse into a ruby array of hashes

 def fetch_buses_from_api(source_url)
  #source is the url from marta w location
  #http is a variable, using class from ruby net::http
  http = Net::HTTP.get_response(URI.parse(source_url))
  data = http.body
  JSON.parse(data)
 end

 #is_nearby?(@location.latitude, @location.longitude, bus["LATITUDE"], bus["LONGITUDE"])
 #return true if bus is near, false otherwise
 def is_nearby? (user_lat, user_long, bus_lat, bus_long)
  max_distance = 0.01 #.6 miles in degrees
  difference_in_latitudes = user_lat - bus_lat.to_f
  difference_in_longitudes = user_long - bus_long.to_f
  distance = Math.sqrt(difference_in_latitudes ** 2 +  difference_in_longitudes** 2)
  distance <= max_distance
 end

end
