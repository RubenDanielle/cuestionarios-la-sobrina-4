class Survey < Sequel::Model
    many_to_many :Career
    one_to_many  :Response
end