Sequel.migration do
  up do
    alter_table(:responses) do
      add_primary_key :id
    end
  end

  down do
    drop_column :responses, :id
  end
end
