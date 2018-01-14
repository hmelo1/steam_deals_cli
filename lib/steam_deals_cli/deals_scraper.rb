require  'open-uri'
require 'nokogiri'

class SteamDealsCli::Deals_Scraper

  def get_page
    Nokogiri::HTML(open("https://steamdb.info/sales/"))
  end

  def scrape_deals_daily
    self.get_page.css("td.sales-daily-deal")
  end

  def scrape_deals_wknd
    self.get_page.css("td.sales-weekend-deal")
  end

end
