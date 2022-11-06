# frozen_string_literal: true

require 'create_html_page'

ANIMALS = { 0 => %w[rooster parrot penguins owl],
            1 => %w[snake turtles crocodiles caiman],
            2 => %w[cat dog raccoon beaver] }.freeze

# class BasicFunctionsLife for Functions Life
class BasicFunctionsLife
  def initialize
    @type = ANIMALS[rand(0..2)][rand(0..3)]
    @health_index = 10
    @hunger_index = 0
    @thirst_index = 0
    @asleep_index = 5
    @time_index = 0
  end

  def eat
    puts 'MMMM, hrm hrm. It is really delicious'
    change_main_params(health: 1, hunger: 2, thirst: 0, asleep: 2, time: 1)
  end

  def drink
    puts 'Ugm, ugm, ugm...'
    change_main_params(health: 0, hunger: 0, thirst: 4, asleep: 1, time: 1)
  end

  def asleep
    3.times { puts 'zzz... zzz... hrrrrrr... zzzz' }
    change_main_params(health: 1, hunger: -2, thirst: -1, asleep: rand(-6..-4), time: 3)
  end

  def change_main_params(**arg)
    @health_index += arg[:health]
    @hunger_index += arg[:hunger]
    @thirst_index += arg[:thirst]
    @asleep_index += arg[:asleep]
    @time_index += arg[:time]
  end
end

# class Pet for Pet
class Pet < BasicFunctionsLife
  def initialize
    super
    puts 'Please enter your pets name:'
    @name = gets.chomp
    @mood_index = 5
    @play_index = 5
    @love_index = 5
    @disease_index = 0
    puts "#{@name} was born. It is #{@type}."
    @all_actions = { 'eat' => 'eat', 'drink' => 'drink', 'sleep' => 'asleep', 'walk' => 'walk',
                     'eat vegetables' => 'eat_vegetables', 'play' => 'play', 'do exercise' => 'do_useful_exercise',
                     'how old are you?' => 'age', 'take medication' => 'take_medication',
                     'eat fast food' => 'eat_fast_food', 'read book' => 'read_book', 'exit' => 'exit' }
  end

  def walk
    if basic_necessity?
      puts 'I don\'t want walk'
    else
      puts 'I love you :) I like walk!'
      change_main_params(health: rand(0..1), hunger: rand(2..6), thirst: rand(2..6), asleep: rand(1..3), time: 3)
    end
  end

  def play
    if basic_necessity?
      puts 'I don\'t want play'
    else
      puts "You and #{@name} are playing a very funny game"
      change_main_params(health: rand(0..2), hunger: rand(1..3), thirst: rand(1..3), asleep: rand(1..3),
                         time: rand(1..3))
      change_any_params(mood: rand(1..3), play: +2, love: 1)
    end
  end

  def eat_vegetables
    if !hunger?
      puts 'I don\'t want eat'
    else
      puts 'I don\'t like vegetables(('
      change_main_params(health: 0, hunger: 0, thirst: 0, asleep: 0, time: 1)
      change_any_params(mood: 0, play: -2, love: rand(-3..-1))
    end
  end

  def do_useful_exercise
    if basic_necessity?
      puts 'I don\'t want to do exercise'
    else
      puts "You and #{@name} are playing a very funny game"
      change_main_params(health: rand(1..2), hunger: rand(-3..-0), thirst: rand(-3..-1), asleep: 2, time: 2)
      change_any_params(mood: rand(0..1), play: -1, love: rand(-3..-1))
    end
  end

  def read_book
    if basic_necessity?
      puts 'I dont want to read book!!!'
    else
      puts 'Okaaaay, let\'s do it...'
      change_main_params(health: 0, hunger: rand(-3..-0), thirst: -1, asleep: rand(1..3), time: rand(1..3))
      change_any_params(mood: rand(-2..-1), play: -2, love: rand(-3..-1))
    end
  end

  def eat_fast_food
    puts "I'm READY! I want to #{%w[pizza hot-dog hamburger][rand(0..2)]}"
    change_main_params(health: rand(-3..-1), hunger: rand(4), thirst: rand(-3..-1), asleep: 1, time: rand(1..2))
    change_any_params(mood: rand(1..3), play: -1, love: rand(1..3))
    puts 'I\'m so happy! Thank\'s!!!'
  end

  def take_medication
    if @disease_index < 1
      puts 'I\'m not cold!'
    else
      @disease_index -= 1
      puts 'I\'m cold'
      change_main_params(health: 8, hunger: rand(-3..-0), thirst: rand(-3..-1), asleep: rand(1..3), time: 1)
      change_any_params(mood: rand(0..1), play: 0, love: 0)
    end
  end

  def tell_with_pet
    CreateHtmlPage.create_page(content: all_params)
    disease if @disease_index < 1
    check_params
    puts "Please enter command from #{@all_actions.keys}"
    your_method = gets.chomp.downcase
    if @all_actions.include?(your_method)
      send(@all_actions[your_method])
      tell_with_pet
    else
      puts 'Oh, I don\'t know that :('
      tell_with_pet
    end
  end

  private

  def all_params
    { health: @health_index,
      hungry: @hunger_index,
      thirst: @thirst_index,
      sleep: @asleep_index,
      age: @time_index,
      play: @play_index,
      love: @love_index,
      disease: @disease_index }
  end

  def change_any_params(**arg)
    @mood_index += arg[:mood]
    @play_index += arg[:play]
    @love_index += arg[:love]
  end

  def basic_necessity?
    health? || hunger? || thirst? || asleep?
  end

  def mood?
    @mood_index < 4
  end

  def asleep?
    @asleep_index > 10
  end

  def pleasure?
    @play_index < 4
  end

  def health?
    @health_index < 4
  end

  def hunger?
    @hunger_index < 4
  end

  def thirst?
    @thirst_index < 4
  end

  def love?
    @love_index < 4
  end

  def age
    puts "I'm #{@time_index} hours"
  end

  def disease
    unless rand(1..100) > 5
      @disease_index = 3
      puts('I\'m sick...(', 'I need to take the pills 3 times')
      change_main_params(health: -30, hunger: 0, thirst: rand(-5..-3), asleep: rand(5..7), time: rand(1..3))
    end
  end

  def died
    unless @health_index >= -40
      puts 'I\'m died'
      exit
    end
  end

  def unhappy
    unless @love_index > - 5
      puts 'I go out. Bye...'
      exit
    end
  end

  def disease?
    @disease_index.positive?
  end

  def check_params
    died
    unhappy
    puts 'I\'m cold' if disease?
    change_main_params(health: -3, hunger: 0, thirst: 0, asleep: 0, time: 0) if disease?
    puts 'I\'m so unhappy' if mood?
    puts 'I want to asleep' if asleep?
    puts 'I want to PLAAAAAY' if pleasure? && !basic_necessity?
    puts 'I\'m hungry' if hunger?
    puts 'I\'m thirsty' if thirst?
    puts 'So, you don\'t love me...' if love?
  end

  def bye
    puts 'Bye! I\'m dying...('
  end
end

a = Pet.new
a.tell_with_pet
