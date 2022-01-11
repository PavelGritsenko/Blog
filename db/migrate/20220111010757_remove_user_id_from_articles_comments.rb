class RemoveUserIdFromArticlesComments < ActiveRecord::Migration[7.0]
  def up #метод при применении миграции
    change_column_default :articles, :user_id, from: User.first.id, to: nil  #удаляем дефолтное значение и меняем на nil
    change_column_default :comments, :user_id, from: User.first.id, to: nil
  end

  def down #метод при откате миграции
    change_column_default :articles, :user_id, from: nil, to: User.first.id 
    change_column_default :comments, :user_id, from: nil, to: User.first.id
  end
end
