require  'open-uri'
require 'nokogiri'

class SteamDealsCli::Steam_Deals

  attr_accessor :name, :price_discount , :category

  def self.deals_from_page(deal)
    self.new(
      deal.css("a.b").text,
      deal.css("td").children[11].text,
      deal.css(".category").text
    )
  end

  def initilize(name, price_discount, category)
    @name = name
    @price_discount = price_discount
    @category = category
  end

end

#name: deal.css("a.b").text => Earth 2160
#category: deal.css(".category").text => Weeklong Deal
#%off: deal.css("td").children[11].text    => -70%
