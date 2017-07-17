# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.2.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Network
  module Models
    #
    # Contains SKU in an ExpressRouteCircuit.
    #
    class ExpressRouteCircuitSku
      # @return [String] The name of the SKU.
      attr_accessor :name

      # @return [ExpressRouteCircuitSkuTier] The tier of the SKU. Possible
      # values are 'Standard' and 'Premium'. Possible values include:
      # 'Standard', 'Premium'
      attr_accessor :tier

      # @return [ExpressRouteCircuitSkuFamily] The family of the SKU. Possible
      # values are: 'UnlimitedData' and 'MeteredData'. Possible values include:
      # 'UnlimitedData', 'MeteredData'
      attr_accessor :family


      #
      # Mapper for ExpressRouteCircuitSku class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'ExpressRouteCircuitSku',
          type: {
            name: 'Composite',
            class_name: 'ExpressRouteCircuitSku',
            model_properties: {
              name: {
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              tier: {
                required: false,
                serialized_name: 'tier',
                type: {
                  name: 'String'
                }
              },
              family: {
                required: false,
                serialized_name: 'family',
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
