Sequel.migration do 
	up do
		create_table(:choices) do
			primary_key :id
			foreign_key :question_id, :questions
			String      :text, null: false
			DateTime    :created_at, default: Sequel::CURRENT_TIMESTAMP
			DateTime    :updated_at, default: Sequel::CURRENT_TIMESTAMP
	   	end 
	end   
	down do 
		drop_table(:choices)
	end
end