# frozen_string_literal: true

require 'csv'

require_relative "secret_santa/version"
require_relative "secret_santa/user"
require_relative "secret_santa/runner"

module SecretSanta
  class TimeoutError < StandardError; end
end
