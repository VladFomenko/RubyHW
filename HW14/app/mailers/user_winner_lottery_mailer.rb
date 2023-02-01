# frozen_string_literal: true

class UserWinnerLotteryMailer < ApplicationMailer
  def winner_lottery(user)
    mail(to: user.email, subject: 'Your discount!')
  end
end
