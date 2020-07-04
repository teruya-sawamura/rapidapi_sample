class SearchController < ApplicationController
  def index
    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI("https://edamam-edamam-nutrition-analysis.p.rapidapi.com/api/nutrition-data?ingr=1#{params[:search]}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'edamam-edamam-nutrition-analysis.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV["RAPIDAPI_KEY"]



      @response = http.request(request)

      @result = JSON.parse(@response.body)
      
      

      # total_weight = result["totalWeight"]

      # total_cal = result["calories"]
      # @cal = total_cal / total_weight * 100
      

      # @label = result["totalNutrients"]["PROCNT"]["label"]

      # total_quantity = result["totalNutrients"]["PROCNT"]["quantity"]
      # @quantity = total_quantity / total_weight * 100
      
      
      # @unit = result["totalNutrients"]["PROCNT"]["unit"]
    
  end
end
