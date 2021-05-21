class Outcome < Sequel::Model
    many_to_one :Career
    many_to_one :Choice
end