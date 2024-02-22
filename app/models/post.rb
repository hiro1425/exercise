class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :place_id, presence: true
  validates :target_date, presence: true
end
