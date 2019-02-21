class User < ApplicationRecord
  has_many :connections
  has_many :other_users, through: :connections
  has_many :messages

  has_many :inverse_connections, class_name: "Connection", foreign_key: :other_user_id
  has_many :inverse_other_users, through: :inverse_connections, source: :user

  validates :name, uniqueness: {:case_sensitive => false}
  has_secure_password

  def users
    all_users = []
    all_users.push(self.other_users)
    all_users.push(self.inverse_other_users)
    all_users.flatten!.uniq!
  end

  def all_connections
    all_connections = []
    all_connections.push(self.connections)
    all_connections.push(self.inverse_connections)
    puts all_connections
    all_connections.flatten!
  end

end

# How to find all other user instances from each connection
#
# other_users = bob.all_connections.map {|x|
#   if x.user_id == bob.id
#     x.other_user
#   else
#     x.user
#   end
# }
