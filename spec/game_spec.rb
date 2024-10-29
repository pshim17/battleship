require 'spec_helper'

RSpec.describe Game do
  before (:each) do
    @game = Game.new
  end
  @game.start
end