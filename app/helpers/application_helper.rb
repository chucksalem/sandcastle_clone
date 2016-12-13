module ApplicationHelper
  def areas
    items = OceanoConfig[:areas].map do |item|
       [ item, item.tr(' ', '').underscore ]
    end
    [['Where are you going?', '-', {disabled: 'disabled', selected: ''}], ['Any', PropertyRetriever::ANY]] + items
  end

  def guests
    items = (1..10).map { |item| [item, item] }
    [['Guests', 0, {disabled: 'disabled', selected: ''}],['Any', PropertyRetriever::ANY]] + items
  end

  def sort_by
    [
      ['Guest Rating', 'G'],
      ['Price', 'P'],
      ['Location', 'L'],
      ['Name', 'N']
    ]
  end

  def ellipsis(str, length:)
    str[0..length].gsub(/\s\w+\s*$/,'...')
  end

  def booking_id
    params[:id].to_str.split('-', 2).last if params[:id]
  end

  def retrieve_sort
    params[:sort] || 'P'
  end

  def generate_property_url unit_code
    accommodation_url(unit_code) + "?start_date=#{params[:start_date]}&end_date=#{params[:end_date]}&guests=#{params[:guests]}"
  end
end
