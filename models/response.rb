class Response < Sequel::Model
    many_to_one :Survey
end