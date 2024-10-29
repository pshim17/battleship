require 'spec_helper'

RSpec.describe Game do
  before (:each) do
    game = Game.new
    game.start
  end
end