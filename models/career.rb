class Career < Sequel::Model
    one_to_many  :Outcome
    many_to_many :Survey
end