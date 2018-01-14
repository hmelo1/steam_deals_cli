require_relative './deals_scraper.rb'
require_relative './steam_deals.rb'

class SteamDealsCli::CLI

  def call
    SteamDealsCli::Deals_Scraper.new.make_deals
    puts "Welcome to Steam's current sales!"
    start
  end

  def start
    puts "-----------------------------------------"
    puts "\nWhich would you like to see? There are currently #{SteamDealsCli::Deals_Scraper.new.current_deals_count} products on sale."
    puts "How would you like to see them sorted? Would you like to view the Weeklong Deals, Special Promotoions, Daily Deals, or Weekend Deals "
    information
  end

  def information
    puts "Ex. For Weeklong Deals, type '1'"
    puts "If you'd like to exit, type '5'"
    input = gets.to_i

    if input == 1
      print_discount(SteamDealsCli::Steam_Deals.weeklong_deals)
    elsif input == 2
      print_discount(SteamDealsCli::Steam_Deals.special_promos)
    elsif input == 3
      print_discount(SteamDealsCli::Steam_Deals.daily_deals)
    elsif input == 4
      print_discount(SteamDealsCli::Steam_Deals.weekend_deals)
    elsif input == 5
      puts "Thanks! If you'd like to see more deals com'on back!"
    else
      puts "#{input} is invalid. Please try again."
      information
    end
  end

  def print_discount(games)
    games.each do |game|
      puts "----------------------------"
      puts ""
      puts "Game:          #{game.name}"
      puts "Price:            #{game.discounted_price}"
      puts "% Off:           #{game.price_discount}"
      puts ""
    end
  end
end
