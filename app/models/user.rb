class User < ApplicationRecord
  before_save :default_values

  has_many :connections
  has_many :other_users, through: :connections

  # has_many :conversations
  # has_many :user2s, through: :connections

  has_many :messages

  has_many :inverse_connections, class_name: "Connection", foreign_key: :other_user_id
  has_many :inverse_other_users, through: :inverse_connections, source: :user

  # has_many :inverse_conversations, class_name: "Conversation", foreign_key: :user2_id
  # has_many :inverse_user2s, through: :inverse_conversations, source: :user

  validates :email, uniqueness: {:case_sensitive => false}
  validates :name, :email, presence: true
  validates :name, length: { in: 1..20 }
  validates :password, length: { in: 3..30 }
  validates :email, format: {
      with: URI::MailTo::EMAIL_REGEXP,
      message: 'Only valid emails allowed'
  }
  # validates :image_url, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }

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
    all_connections.flatten!
  end

  def default_values
    if self.image_url == "[\"image_url\"]"
      self.image_url = "https://www.axiumradonmitigations.com/wp-content/uploads/2015/01/icon-user-default.png"
    end
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
