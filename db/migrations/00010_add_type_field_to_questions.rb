Sequel.migration do
  up do
    add_column :questions, :type , String, null: false 
  end

  down do
    drop_column :questions, :type
  end
end