class HomeController < ApplicationController
  def index
    units_data = RedisClient.get 'temp:units:values'
    units = JSON.parse(units_data)
    @random_units = []
    units.each do |unit|
      @random_units << unit if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
    end
  end
end
