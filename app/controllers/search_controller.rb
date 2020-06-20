class SearchController < ApplicationController
  def index
    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI("https://edamam-edamam-nutrition-analysis.p.rapidapi.com/api/nutrition-data?ingr=1%20large%20apple")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'edamam-edamam-nutrition-analysis.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV["RAPIDAPI_KEY"]

    response = http.request(request)

    result = JSON.parse(response.body)

    @label = result["totalNutrients"]["PROCNT"]["label"]
    @quantity = result["totalNutrients"]["PROCNT"]["quantity"]
    @unit = result["totalNutrients"]["PROCNT"]["unit"]
  end
end
