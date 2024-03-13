# == Schema Information
#
# Table name: currencies
#
#  id         :uuid             not null, primary key
#  name       :string
#  iso_code   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Currency < ApplicationRecord
end
