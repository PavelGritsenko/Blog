class FillUserIdInArticles < ActiveRecord::Migration[7.0]
  def change
    Article.all.find_each do |article|
      article.user_id = User.first.id
    end
  end
end
