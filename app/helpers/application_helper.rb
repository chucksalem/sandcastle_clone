module ApplicationHelper
  def areas
    items = OceanoConfig[:areas].map do |item|
       [ item, item.tr(' ', '').underscore ]
    end
    [['Where are you going?', '-', {disabled: 'disabled', selected: ''}], ['Any', 'all']] + items
  end

  def guests
    items = (1..10).map { |item| [item, item] }
    [['Guests', 0, {disabled: 'disabled', selected: ''}],['Any', 'all']] + items
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
end
