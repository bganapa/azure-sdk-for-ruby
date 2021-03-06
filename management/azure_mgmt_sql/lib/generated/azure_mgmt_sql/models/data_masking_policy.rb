# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::SQL
  module Models
    #
    # Represents a database data masking policy.
    #
    class DataMaskingPolicy < ProxyResource

      include MsRestAzure

      include MsRest::JSONable
      # @return [DataMaskingState] The state of the data masking policy.
      # Possible values include: 'Disabled', 'Enabled'
      attr_accessor :data_masking_state

      # @return [String] The list of the exempt principals. Specifies the
      # semicolon-separated list of database users for which the data masking
      # policy does not apply. The specified users receive data results without
      # masking for all of the database queries.
      attr_accessor :exempt_principals

      # @return [String] The list of the application principals. This is a
      # legacy parameter and is no longer used.
      attr_accessor :application_principals

      # @return [String] The masking level. This is a legacy parameter and is
      # no longer used.
      attr_accessor :masking_level

      # @return [String] The location of the data masking policy.
      attr_accessor :location

      # @return [String] The kind of data masking policy. Metadata, used for
      # Azure portal.
      attr_accessor :kind


      #
      # Mapper for DataMaskingPolicy class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'DataMaskingPolicy',
          type: {
            name: 'Composite',
            class_name: 'DataMaskingPolicy',
            model_properties: {
              id: {
                required: false,
                read_only: true,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                required: false,
                read_only: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              type: {
                required: false,
                read_only: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              data_masking_state: {
                required: true,
                serialized_name: 'properties.dataMaskingState',
                type: {
                  name: 'Enum',
                  module: 'DataMaskingState'
                }
              },
              exempt_principals: {
                required: false,
                serialized_name: 'properties.exemptPrincipals',
                type: {
                  name: 'String'
                }
              },
              application_principals: {
                required: false,
                read_only: true,
                serialized_name: 'properties.applicationPrincipals',
                type: {
                  name: 'String'
                }
              },
              masking_level: {
                required: false,
                read_only: true,
                serialized_name: 'properties.maskingLevel',
                type: {
                  name: 'String'
                }
              },
              location: {
                required: false,
                read_only: true,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              kind: {
                required: false,
                read_only: true,
                serialized_name: 'kind',
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
