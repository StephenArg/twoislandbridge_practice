class Connection < ApplicationRecord
  has_many :stored_messages, :dependent => :destroy
  belongs_to :user
  belongs_to :other_user, class_name: "User"
end
