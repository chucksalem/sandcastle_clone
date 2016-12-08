class PropertyRetriever
  DATE_FORMAT = '%m/%d/%Y'.freeze

  attr_accessor :criteria
  def initialize criteria
    @criteria = criteria
  end

#TODO Check default value correctness of this code
# @area       = params[:area] || '-'
# @start_date = params[:start_date]
# @end_date   = params[:end_date]
# @guests     = params[:guests]
# @sort       = params[:sort] || 'P'

  def retrieve
    if [:area, :start_date, :end_date, :guests].all? { |k| criteria[k].blank? }
      retrieve_random
    else
      retrive_by_criteria
    end
  end

  def retrieve_random
    UnitRepository.random_units(limit: 10)
  end

  def retrive_by_criteria
    start_date = Date.strptime(criteria[:start_date], DATE_FORMAT)
    end_date   = Date.strptime(criteria[:end_date], DATE_FORMAT)
    sort = 'G'
    sort = criteria[:sort] if criteria[:sort] && criteria[:sort] != '-'
    guests = [{type: 10, count: criteria[:guests]}] unless [nil, '', 'all'].include?(criteria[:guests])
    area = 'all'
    area = criteria[:area] unless criteria[:area].blank?
    room = criteria[:room] unless criteria[:room].blank?
    search_hash = { sort: sort, date_range: { start: start_date, end: end_date }, guests: guests }
    codes = []

    #thats really crap but in case of this API order of arguments matter
    OceanoConfig[:cache_population_searches].each do |criteria|
      codes += UnitRepository.search(criteria.merge! search_hash)
    end
    codes = codes.uniq

    # in_area_codes = UnitRepository.units_in_area(area)
    # codes = codes & in_area_codes

    codes = codes.select { |c| c == room } if room && room != 'all'

    units = codes.map { |c| UnitRepository.get c }

    #SandCastle
    filter_by_unit_type units
  end

  def filter_by_unit_type units
    types = [ :townhouse, :condominium, :apartment ]
    units.select { |s| types.include? s[:type] }
  end
end
