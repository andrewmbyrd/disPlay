class AddImgUrlToSystem < ActiveRecord::Migration[5.0]
  def change
    add_column :systems, :img_url, :string
  end
end
