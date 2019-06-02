class Movie < ApplicationRecord
  validates :title, title: true
  validates :summary, text: true
end
