class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true


  # has_many :bookmarks
  # has_many :movies

  # validates :name, presence: true, uniqueness: true, allow_blank: false
end
