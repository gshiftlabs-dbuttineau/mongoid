# encoding: utf-8
module Mongoid #:nodoc:
  module Fields #:nodoc:
    module Custom #:nodoc:

      # Defines the behaviour for BSON::ObjectId fields.
      class ObjectId < Base

        # Serialize the object from the type defined in the model to a MongoDB
        # compatible object to store.
        #
        # @example Serialize the field.
        #   field.serialize(object)
        #
        # @param [ Object ] object The object to cast.
        #
        # @return [ BSON::ObjectId ] The converted object id.
        #
        # @since 2.1.0
        def serialize(object)
          if object.is_a?(::String)
            BSON::ObjectId.from_string(object) unless object.blank?
          else
            object
          end
        end
        alias :set :serialize
      end
    end
  end
end