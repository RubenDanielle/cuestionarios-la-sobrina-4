Sequel.migration do 
	up do
		create_table(:careers_surveys) do
			foreign_key :career_id, :careers
			foreign_key :survey_id, :surveys
			DateTime    :created_at, default: Sequel::CURRENT_TIMESTAMP
			DateTime    :updated_at, default: Sequel::CURRENT_TIMESTAMP
	   	end 
	end   
	down do 
		drop_table(:careers_surveys)
	end
end