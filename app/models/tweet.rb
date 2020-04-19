class Tweet < ApplicationRecord
  has_one :tag, dependent: :destroy
  accepts_nested_attributes_for :tag

  validates :title, presence: true
  validates :text, presence: true
  validates :tag, presence: true

end
