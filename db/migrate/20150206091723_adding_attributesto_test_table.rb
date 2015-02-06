class AddingAttributestoTestTable < ActiveRecord::Migration
  def change
    add_column :tests, :serial_no, :string
    add_column :tests, :subject, :string
  end
end
