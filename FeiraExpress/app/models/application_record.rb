# ApplicationRecord serves as the base class for all ActiveRecord models in this application.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
