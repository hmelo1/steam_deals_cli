class CLI

  def call
    Deals_Scraper.new.make_deals
    puts "Welcome to Steam's current sales!"
    start
  end

  def start
    puts "-----------------------------------------"
    puts "\nWhich would you like to see? There are currently #{Deals_Scraper.new.current_deals_count} products on sale."
    puts "\nHow would you like to see them sorted? Would you like to view the Weeklong Deals, Special Promotoions, Daily Deals, or Weekend Deals "
    information
  end

  def information
    puts "Ex. For Weeklong Deals, type '1'"
    puts "If you'd like to exit, type '5'"
    input = gets.to_i

    if input == 1
      print_discounts(Steam_Deals.weeklong_deals)
    elsif input == 2
      print_discounts(Steam_Deals.special_promos)
    elsif input == 3
      print_discounts(Steam_Deals.daily_deals)
    elsif input == 4
      print_discounts(Steam_Deals.weekend_deals)
    elsif input == 5
      puts "Thanks! If you'd like to see more deals com'on back!"
    else
      puts "#{input} is invalid. Please try again."
      information
    end
  end

  def print_discounts(games)
    games.each_with_index do |game, index|
      puts "----------------------------"
      puts ""
      puts "#{index+1}."
      puts "Game:                               #{game.name}"
      puts "Discounted Price:                   #{game.discounted_price}"
      puts "% Off:                              #{game.price_discount}"
      puts ""
    end
  end
end
