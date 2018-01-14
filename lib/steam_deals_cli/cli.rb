require_relative './deals_scraper.rb'
require_relative './steam_deals.rb'

class SteamDealsCli::CLI

  def call
    SteamDealsCli::Deals_Scraper.new.make_deals
    puts "Welcome to Steam's daily and weekend deals!"
    start
  end

  def start
    puts "-----------------------------------------"
    puts "\nWhich would you like to see? There are currently #{SteamDealsCli::Deals_Scraper.new.current_deals_count} products on sale."

    puts "How would you like to see them sorted? By 50, 100 or all."
    puts "Ex. For 50, type '1'"

    input = gets.to_i

    if input == 1
      puts "50:"
    elsif input == 2
      puts "100:"
    elsif input == 3
      puts "All:"
    end
  end

end
