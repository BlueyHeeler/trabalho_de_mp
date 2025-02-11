# The ApplicationRecord class serves as the base class for all models in the application.
# It inherits from ActiveRecord::Base and sets up the primary abstract class configuration.
# This class provides common functionality and behavior that will be shared across all model classes.
#
# @abstract This is an abstract base class for all models
# @note All models should inherit from this class instead of ActiveRecord::Base directly
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
