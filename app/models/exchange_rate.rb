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
class ExchangeRate < ApplicationRecord
  validates :base_currency, :converted_currency, presence: true

  def self.convert(from, to, amount)
    return amount unless EXCHANGE_RATE_ENABLED

    rate = ExchangeRate.find_by(base_currency: from, converted_currency: to)

    # TODO: Handle the case where the rate is not found
    if rate.nil?
      amount # Silently handle the error by returning the original amount
    else
      amount * rate.rate
    end
  end
end
