module Quotes
  class Database
    def self.connect(adapter:, database:)
      ActiveRecord::Base.establish_connection(
        adapter: adapter,
        database: database
      )
    end
  end
end
