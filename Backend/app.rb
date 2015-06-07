require 'bundler/setup'

require 'sinatra/base'
require 'active_record'

require_relative 'routes/quotes'

module Quotes
  class App < Sinatra::Base
    configure do
      set :db_adapter, 'sqlite3'
      set :db_database, 'quotes.db'
    end

    ActiveRecord::Base.establish_connection(
      adapter: settings.db_adapter,
      database: settings.db_database
    )

    use Routes::Quotes
  end
end
