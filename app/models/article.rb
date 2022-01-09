class Article < ApplicationRecord
  include Visible  
  
  has_many :comments, dependent: :destroy

  def form_created_at
      self.created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
