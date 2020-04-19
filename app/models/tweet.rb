class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :tag, dependent: :destroy
  accepts_nested_attributes_for :tag

  validates :title, presence: true
  validates :text, presence: true
  validates :tag, presence: true

end
