# frozen_string_literal: true

require_relative 'pet'

require 'rack'
require 'erb'

# some comments
class Application
  def initialize
    @pet = Pet.new
    @name = @pet.all_params['name']
  end

  def call(env)
    @request = Rack::Request.new(env)
    @name = @request.params['name']
    @message = @pet.all_params[:message]
    case @request.path
    when '/'
      request('index.html.erb') if check_nil_empty?(@name)
    when '/new_pet'
      if check_nil_empty?(@name)
        request('index.html.erb')
      else
        @message.unshift("Hello! I'm #{@pet.instance_variable_get(:@type)} and my name is #{@name}")
        request('game.html.erb')
      end
    when '/new_act'
      if @message.include?('died')
        request('end.html.erb')
      else
        # request('end.html.erb') if @message.include?('died')
        act = @request.params.values.first
        @pet.tell_with_pet(act) if @pet.check_methods?(act)
        request('game.html.erb')
      end
    else
      Rack::Response.new('Not Found, 404')
    end
  end

  private

  def render(template)
    path = File.expand_path("./../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def check_nil_empty?(value)
    value.nil? || value.empty?
  end

  def request(path)
    Rack::Response.new(render(path)).finish
  end
end
