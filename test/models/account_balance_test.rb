# == Schema Information
#
# Table name: account_balances
#
#  id         :uuid             not null, primary key
#  account_id :uuid             not null
#  date       :date             not null
#  balance    :decimal(19, 4)   not null
#  currency   :string           default("USD"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class AccountBalanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
