class Deals_Scraper

  def get_page
    Nokogiri::HTML(open("https://steamdb.info/sales"))
  end

  def current_deals_count
    self.scrape_deals.length
  end

  def scrape_deals
    self.get_page.css("tbody tr")
  end

  def make_deals
    scrape_deals.each do |deal|
      Steam_Deals.deals_from_page(deal)
    end
  end

end
