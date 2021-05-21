Sequel.migration do 
	up do
		alter_table(:outcomes) do 
			add_foreign_key :choice_id, :choices
			add_foreign_key :career_id, :careers
		end
		alter_table(:responses) do
			add_foreign_key :choice_id,:choices
			add_foreign_key :question_id, :questions
		end
	end   
	down do 
		drop_column :outcomes, :choice_id
		drop_column :outcomes, :career_id
		drop_column :responses, :choice_id
		drop_column :responses, :question_id
	end
end