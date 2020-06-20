class SearchController < ApplicationController
  def index
    require 'unirest'
    response = Unirest.get "https://edamam-edamam-nutrition-analysis.p.rapidapi.com/api/nutrition-data?ingr=1+large+apple",
      headers:{
        "X-RapidAPI-Host" => "edamam-edamam-nutrition-analysis.p.rapidapi.com",
        "X-RapidAPI-Key" => "RAPIDAPI_KEY"
      }

    @result = JSON.parse(response.raw_body)
  end
end
