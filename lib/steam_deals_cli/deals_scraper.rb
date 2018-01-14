require  'open-uri'
require 'nokogiri'
require_relative './steam_deals.rb'

class SteamDealsCli::Deals_Scraper

  def get_page
    Nokogiri::HTML(open("https://steamdb.info/sales/?min_discount=0&min_rating=0"))
  end

  def current_deals_count
    self.scrape_deals.length
  end

  def scrape_deals
    self.get_page.css("tbody tr")
  end

  def make_deals
    scrape_deals.each do |deal|
      SteamDealsCli::Steam_Deals.deals_from_page(deal)
    end
  end

end
