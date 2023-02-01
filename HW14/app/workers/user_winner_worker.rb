# frozen_string_literal: true

class UserWinnerWorker
  include Sidekiq::Worker
  def perform
    UserWinners.call.each { |user| UserWinnerLotteryMailer.winner_lottery(user).deliver }
  end
end
