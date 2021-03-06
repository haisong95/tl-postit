class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
  has_many :votes, as: :voteable

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: /@(umn.edu|gmail\.com)\z/, message: "was not allowed for student out of umn" }


  def admin?
    self.role == 'admin'
  end

  def moderator?
    self.role == 'moderator'
  end

end
