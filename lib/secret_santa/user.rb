module SecretSanta
  class User
    attr_accessor :name, :email, :giving_to, :receiving_from

    def initialize(name:, email:)
      @name = name
      @email = email
    end

    def ==(other)
      self.email == other.email
    end
  end
end
