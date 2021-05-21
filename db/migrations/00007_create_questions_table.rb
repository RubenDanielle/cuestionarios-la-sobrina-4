Sequel.migration do 
	up do
		create_table(:questions) do
			primary_key :question_id
			String      :question_name, null: false
			String      :question_description, null:false
			Integer     :question_number, null:false
			DateTime    :created_at, default: Sequel::CURRENT_TIMESTAMP
			DateTime    :updated_at, default: Sequel::CURRENT_TIMESTAMP
	   	end 
	end   
	down do 
		drop_table(:outcomes)
	end
end