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

  def execution_date=(date_array)
    self[:execution_date] = Date.new(date_array[0], date_array[1], date_array[2])
  end
  
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place
  belongs_to :category
end
