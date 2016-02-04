class Comment < ActiveRecord::Base
  validates :body presence:   true,
            uniqueness: { case_sensitive: false }

end
