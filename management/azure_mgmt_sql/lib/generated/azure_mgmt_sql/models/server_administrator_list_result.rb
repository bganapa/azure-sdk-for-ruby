# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::SQL
  module Models
    #
    # The response to a list Active Directory Administrators request.
    #
    class ServerAdministratorListResult

      include MsRestAzure

      include MsRest::JSONable
      # @return [Array<ServerAzureADAdministrator>] The list of server Active
      # Directory Administrators for the server.
      attr_accessor :value


      #
      # Mapper for ServerAdministratorListResult class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'ServerAdministratorListResult',
          type: {
            name: 'Composite',
            class_name: 'ServerAdministratorListResult',
            model_properties: {
              value: {
                required: false,
                serialized_name: 'value',
                type: {
                  name: 'Sequence',
                  element: {
                      required: false,
                      serialized_name: 'ServerAzureADAdministratorElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ServerAzureADAdministrator'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end
