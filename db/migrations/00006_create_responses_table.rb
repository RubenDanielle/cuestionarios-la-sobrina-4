Sequel.migration do
    up do
        create_table(:responses) do
            foreign_key :survey_id, :surveys
            DateTime    :created_at, default: Sequel::CURRENT_TIMESTAMP
            DateTime    :updated_at, default: Sequel::CURRENT_TIMESTAMP
        end
    end

    down do
        drop_table(:responses)
    end
end