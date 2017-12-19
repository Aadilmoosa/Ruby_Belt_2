class User < ActiveRecord::Base
  has_secure_password
  before_save :downcase
  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea

  # has_many :songs
  # has_many :adds, dependent: :destroy
  # has_many :songs_added, through: :adds, source: :song
  # ^ still need this line for future projects to connect two dependent tables on one major table

  validates :first_name,
            :last_name,
            :alias,
            presence: true,
            length: { in: 2..50 }

  validates :email,
            uniqueness: { case_sensitive: false },
            presence: true,
            format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  def downcase
    self.first_name.downcase!
    self.last_name.downcase!
    # self.alias.downcase!
    self.email.downcase!
  end
end
