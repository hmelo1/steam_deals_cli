require  'open-uri'
require 'nokogiri'
require_relative './deals_scraper.rb'

class SteamDealsCli::Steam_Deals

  attr_accessor :name, :price_discount , :category, :discounted_price

@@all = []

  def self.deals_from_page(deal)
    self.new(
      deal.css("a.b").text,
      deal.css("td").children[11].text,
      deal.css("td").children[12].text,
      deal.css(".category").text
    )
  end

  def initialize(name, price_discount, discounted_price, category)
    @name = name
    @price_discount = price_discount
    @discounted_price = discounted_price
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  def self.weekend_deals
    self.all.select{|game| game.category == "Weekend Deal"}
  end

  def self.weeklong_deals
    self.all.select{|game| game.category == "Weeklong Deals"}
  end

  def self.special_promos
    self.all.select{|game| game.category == "Weeklong Deals"}
  end

  def self.daily_deals
    self.all.select{|game| game.category == "Daily Deal"}
  end


end

#name: deal.css("a.b").text => Earth 2160
#category: deal.css(".category").text => Weeklong Deal
#Price-after: deal.css("td").children[12].text => "1.49"
#%off: deal.css("td").children[11].text    => -70%
