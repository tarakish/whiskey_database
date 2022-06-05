# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  best_bottle      :string
#  crypted_password :string
#  email            :string           not null
#  name             :string           default("ユーザー"), not null
#  role             :integer          default("general"), not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
FactoryBot.define do
  factory :user do
    
  end
end
