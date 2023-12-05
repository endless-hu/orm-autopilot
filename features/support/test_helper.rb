require 'simplecov'
SimpleCov.start do
  add_filter "/mailers/"
  add_filter "/channels/"
  add_filter "_helper.rb"
end

ActiveJob::Base.queue_adapter = :inline
