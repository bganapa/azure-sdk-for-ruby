# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.2.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Network
  module Models
    #
    # Model object.
    #
    #
    class ConnectionResetSharedKey

      include MsRestAzure

      include MsRest::JSONable
      # @return [Integer] The virtual network connection reset shared key
      # length
      attr_accessor :key_length


      #
      # Mapper for ConnectionResetSharedKey class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'ConnectionResetSharedKey',
          type: {
            name: 'Composite',
            class_name: 'ConnectionResetSharedKey',
            model_properties: {
              key_length: {
                required: false,
                serialized_name: 'keyLength',
                type: {
                  name: 'Number'
                }
              }
            }
          }
        }
      end
    end
  end
end
