module SecretSanta
  class Runner
    attr_reader :users

    MAX_TRIES = 10

    def initialize(csv_path)
      @users = parse_users_from_file(File.read(csv_path))
    end

    def call
      calculate_exchanges
      print_exchanges
      # send_user_matches
    end

    private

    def calculate_exchanges
      @users.each do |user|
        picked_user = pick_user(user)
        user.giving_to = picked_user
        picked_user.receiving_from = user
      end
    rescue TimeoutError
      puts "Failed to find matches within #{MAX_TRIES} attempts. Please try again"
      exit
    end

    def print_exchanges
      @users.each do |user|
        puts "User '#{user.name}' with email '#{user.email}'"
        puts "  - giving_to: #{user.giving_to.email}"
      end
    end

    def pick_user(user)
      picked_user = nil
      timeout_counter = 0
      # CONDITIONS
      # - user is picked
      # - user is not self
      # - picked user is not already receiving
      while (picked_user.nil? || picked_user == user || !picked_user.receiving_from.nil?)
        picked_user = users.sample
        timeout_counter += 1

        raise TimeoutError if timeout_counter >= MAX_TRIES
      end

      picked_user
    end

    def parse_users_from_file(content)
      CSV.parse(content).map do |user_item|
        User.new(name: user_item[0], email: user_item[1])
      end
    end
  end
end
