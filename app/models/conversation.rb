class Conversation < ApplicationRecord
  has_many :messages
  # belongs_to :user
  # belongs_to :other_user, class_name: "User"
end
