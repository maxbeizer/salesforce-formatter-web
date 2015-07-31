require 'salesforce_id_formatter'

module Formatter
  class << self
    def format_15(id)
      SalesforceIdFormatter.to_18 id
    rescue SalesforceIdFormatter::InvalidId
      "#{id} is not a valid 18 character SFDC id"
    end
  end
end
