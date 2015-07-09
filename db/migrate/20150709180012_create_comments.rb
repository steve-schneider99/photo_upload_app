class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :comment, :string
      t.column :user_id, :integer
      t.column :picture_id, :integer
    end
  end
end
