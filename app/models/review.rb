class Review < ApplicationRecord
  
  validates :body, presence: true
  belongs_to :idea
  belongs_to :user

end
