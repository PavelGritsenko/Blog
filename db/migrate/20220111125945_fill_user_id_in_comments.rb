class FillUserIdInComments < ActiveRecord::Migration[7.0]
  def change
    Comment.all.find_each do |comment|
      comment.user_id = User.first.id
    end
  end
end
