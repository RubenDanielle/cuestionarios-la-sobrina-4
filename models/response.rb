class Response < Sequel::Model
    many_to_one :Survey
    many_to_one :Question
    many_to_one :Choice
end