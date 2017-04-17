class RemoveCompanyFromSystem < ActiveRecord::Migration[5.0]
  def change
    remove_column :systems, :company, :string
  end
end
