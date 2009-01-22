require 'google_stats_helper'
module GStats
  class << self
    # Your analytics account code (usually starts with UA-)
    attr_accessor :analytics_account
    
    # Canonical domain name
    attr_accessor :domain
  end
end
