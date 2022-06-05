# == Schema Information
#
# Table name: authentications
#
#  id         :bigint           not null, primary key
#  provider   :string           not null
#  uid        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_authentications_on_provider_and_uid  (provider,uid)
#
require 'rails_helper'

RSpec.describe Authentication, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
