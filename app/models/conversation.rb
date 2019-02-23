class Conversation < ApplicationRecord
  has_many :messages, :dependent => :destroy
  # belongs_to :user
  # belongs_to :other_user, class_name: "User"
end
