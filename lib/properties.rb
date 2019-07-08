module Users
  module Roles
    ADMIN = 'admin'
    USER  = 'user'

    ALL   = [ADMIN, USER]
  end
end

module Tickets
  module Statuses
    PENDING  = 'pending'
    ONGOING  = 'ongoing'
    RESOLVED = 'resolved'

    ALL = [PENDING, ONGOING, RESOLVED]
  end
end
