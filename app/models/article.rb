class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true, length: {minimum:5}

    def form_created_at
        self.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
end
