class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :place_id, presence: true
  validates :execution_date, presence: true

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :place_id
    validates :category_id
  end

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place
  belongs_to :category
end
