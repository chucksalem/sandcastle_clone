class HomeController < ApplicationController
  def index
    @random_units = UnitRepository.random_units(limit: 5, except: [@id])
    file_path = File.join(Rails.root, '/spec/fixtures/units/hotellists.json')
    units_data = File.read(file_path)
    units = JSON.parse(units_data)
    @random_units = Array.new
    units.each do |unit|
      @random_units << unit if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
    end
  end
end
