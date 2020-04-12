class CreatePostres < ActiveRecord::Migration[6.0]
  def change
    create_table :postres do |t|
        # Campos de mi tabla 'postres' 
    	t.string :nombre
      	t.string :precio
      	t.string :stock
      	t.string :img
      	t.string :url
      	t.timestamps
      	t.column :deleted_at, :datetime, :limit => 6
    end
  end
end 