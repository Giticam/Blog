class Post < ActiveRecord::Base
  validates :title, presence:   true,
                    uniqueness: { case_sensitive: false },
                    length:     {minimum: 3, maximum: 255}
end
