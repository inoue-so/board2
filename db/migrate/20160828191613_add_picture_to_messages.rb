class AddPictureToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :picture, :string
  end
end
