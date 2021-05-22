Sequel.migration do 
	up do
		create_table(:questions) do
			primary_key :id
			String      :name, null: false
			String      :description
			Integer     :number, null:false
			DateTime    :created_at, default: Sequel::CURRENT_TIMESTAMP
			DateTime    :updated_at, default: Sequel::CURRENT_TIMESTAMP
	   	end 
	end   
	down do 
		drop_table(:questions)
	end
end