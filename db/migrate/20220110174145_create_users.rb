# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :email, null: false, index: { unique: true }
      t.text :name
      t.text :password_digest

      t.timestamps
    end
  end
end
