# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.2.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Network
  module Models
    #
    # Response for ListPublicIpAddresses API service call.
    #
    class PublicIPAddressListResult
      # @return [Array<PublicIPAddress>] A list of public IP addresses that
      # exists in a resource group.
      attr_accessor :value

      # @return [String] The URL to get the next set of results.
      attr_accessor :next_link


      #
      # Mapper for PublicIPAddressListResult class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'PublicIPAddressListResult',
          type: {
            name: 'Composite',
            class_name: 'PublicIPAddressListResult',
            model_properties: {
              value: {
                required: false,
                serialized_name: 'value',
                type: {
                  name: 'Sequence',
                  element: {
                      required: false,
                      serialized_name: 'PublicIPAddressElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'PublicIPAddress'
                      }
                  }
                }
              },
              next_link: {
                required: false,
                serialized_name: 'nextLink',
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
