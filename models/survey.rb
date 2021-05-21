class Survey < Sequel::Model
    many_to_many :careers
    one_to_many  :Response

    def validate
        super
        errors.add(:username, 'cannot be empty') if !username || username.empty?
    end
end