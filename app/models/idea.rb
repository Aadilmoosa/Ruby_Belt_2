class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  before_save :downcase

  validates :content, presence: true, length: { in: 2..50 }

  def downcase
    self.content.downcase!
  end

end
