module Tickets
  class StatusPolicy
    attr_reader :user, :ticket

    def initialize(user, ticket)
      @user   = user
      @ticket = ticket
    end

    def update?
      @user.admin?
    end
  end
end
