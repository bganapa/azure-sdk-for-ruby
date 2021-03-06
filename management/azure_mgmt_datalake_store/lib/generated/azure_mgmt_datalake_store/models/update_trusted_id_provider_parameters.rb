# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::DataLakeStore
  module Models
    #
    # Data Lake Store Trusted Identity Provider update parameters
    #
    class UpdateTrustedIdProviderParameters

      include MsRestAzure

      include MsRest::JSONable
      # @return [String] The URL of this trusted identity provider
      attr_accessor :id_provider


      #
      # Mapper for UpdateTrustedIdProviderParameters class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'UpdateTrustedIdProviderParameters',
          type: {
            name: 'Composite',
            class_name: 'UpdateTrustedIdProviderParameters',
            model_properties: {
              id_provider: {
                required: false,
                serialized_name: 'properties.idProvider',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
