# frozen_string_literal: true

require './lib/tamagotchi/application'

use Rack::Reloader, 0
use Rack::Auth::Basic do |username, password|
  username == 'vlad' && password == '123456'
end

run Application.new
