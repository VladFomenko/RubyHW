# frozen_string_literal: true

require_relative 'pet'

require 'rack'
require 'erb'

class Application
  def initialize
    @pet = Pet.new
    @pet.name = @pet.all_params['name']
  end

  def call(env)
    @request = Rack::Request.new(env)
    @pet.name = @request.params['name']
    @message = @pet.all_params[:message]
    case @request.path
    when '/'
      response_with_page('index.html.erb') if check_nil_empty?(@pet.name)
    when '/new_pet'
      if check_nil_empty?(@pet.name)
        response_with_page('index.html.erb')
      else
        @message.unshift("Hello! I'm #{@pet.instance_variable_get(:@type)} and my name is #{@pet.name}")
        response_with_page('game.html.erb')
      end
    when '/new_act'
      if @message.include?('died')
        response_with_page('end.html.erb')
      else
        act = @request.params.values.first
        @pet.tell_with_pet(act) if @pet.check_methods?(act)
        response_with_page('game.html.erb')
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

  def response_with_page(path)
    Rack::Response.new(render(path)).finish
  end
end
