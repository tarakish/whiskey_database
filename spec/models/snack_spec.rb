# == Schema Information
#
# Table name: snacks
#
#  id           :bigint           not null, primary key
#  description  :text             not null
#  english_name :string           not null
#  image        :string
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_snacks_on_english_name          (english_name) UNIQUE
#  index_snacks_on_name_and_description  (name,description) UNIQUE
#
require 'rails_helper'

RSpec.describe Snack, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
