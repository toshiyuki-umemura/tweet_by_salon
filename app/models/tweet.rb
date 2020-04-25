class Tweet < ApplicationRecord
  has_many :comments
  has_one :tag
  belongs_to :user
  accepts_nested_attributes_for :tag

  validates :title, presence: true
  validates :text, presence: true
  validates :tag, presence: true

  def self.search(search)
    if search
      Tweet.where(['title LIKE ?', "%#{search}%"])
    else
      Tweet.all
    end
  end
end

# frozen_string_literal: true

class Tweet < ApplicationRecord
  has_many :tags, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :tags

  validates :title, presence: true
  validates :text, presence: true
  validates :tag, presence: true

  def self.search(search)
    if search
      Tweet.where(['title LIKE ?', "%#{search}%"])
    else
      Tweet.all
    end
  end
end
