# commands

`rails g migration MigrationName`

Migrations are stored as files in the db/migrate directory, one for each migration class. The name of the file is of the form YYYYMMDDHHMMSS_create_products.rb



  def change
    add_column :products, :part_number, :string
    add_index :products, :part_number
    remove_column :products, :part_number, :string
	change_column :products, :part_number, :text

  end
