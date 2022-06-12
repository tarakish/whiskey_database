# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  avatar      :string
#  best_bottle :string
#  name        :string           default("ユーザー"), not null
#  role        :integer          default("general"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
