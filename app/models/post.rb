class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :categories

  validates :title, presence:   true,
  uniqueness: { case_sensitive: false },
  length:     {minimum: 3, maximum: 255}

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")||
    where("body ILIKE ?", "%#{search}%")
  end
end
