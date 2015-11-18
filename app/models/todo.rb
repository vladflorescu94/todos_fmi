class Todo < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  belongs_to :user
end