# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def form_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
