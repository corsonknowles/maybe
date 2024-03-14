# == Schema Information
#
# Table name: exchange_rates
#
#  id                 :uuid             not null, primary key
#  base_currency      :string           not null
#  converted_currency :string           not null
#  rate               :decimal(, )
#  date               :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "test_helper"

class ExchangeRateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
