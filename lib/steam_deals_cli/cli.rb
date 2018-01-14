class SteamDealsCli::CLI

  def call
    puts "Welcome to Steam's daily and weekend deals!"
    start
  end

  def start
    puts "-----------------------------------------"
    puts "\nWhich would you like to see? The Daily Deals or the Weekend Deals?"
    puts "For Daily Deals press 1."
    puts "For Weekend Deals press 2."

    input = gets.strip

    if input.to_i == 1
      puts "Daily Deals:"
    elsif input.to_i == 2
      puts "Weekend Deals:"
    else
      puts "Invalid option; "
    end
  end
end
