# == Schema Information
#
# Table name: flavors
#
#  id         :bigint           not null, primary key
#  detail     :string           not null
#  group      :integer          default(0), not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_flavors_on_name_and_detail  (name,detail) UNIQUE
#
require 'rails_helper'

RSpec.describe Flavor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
