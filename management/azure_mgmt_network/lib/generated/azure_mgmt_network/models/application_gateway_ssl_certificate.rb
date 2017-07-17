# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.2.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Network
  module Models
    #
    # SSL certificates of an application gateway.
    #
    class ApplicationGatewaySslCertificate < SubResource
      # @return [String] Base-64 encoded pfx certificate. Only applicable in
      # PUT Request.
      attr_accessor :data

      # @return [String] Password for the pfx file specified in data. Only
      # applicable in PUT request.
      attr_accessor :password

      # @return [String] Base-64 encoded Public cert data corresponding to pfx
      # specified in data. Only applicable in GET request.
      attr_accessor :public_cert_data

      # @return [String] Provisioning state of the SSL certificate resource
      # Possible values are: 'Updating', 'Deleting', and 'Failed'.
      attr_accessor :provisioning_state

      # @return [String] Name of the resource that is unique within a resource
      # group. This name can be used to access the resource.
      attr_accessor :name

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag


      #
      # Mapper for ApplicationGatewaySslCertificate class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'ApplicationGatewaySslCertificate',
          type: {
            name: 'Composite',
            class_name: 'ApplicationGatewaySslCertificate',
            model_properties: {
              id: {
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              data: {
                required: false,
                serialized_name: 'properties.data',
                type: {
                  name: 'String'
                }
              },
              password: {
                required: false,
                serialized_name: 'properties.password',
                type: {
                  name: 'String'
                }
              },
              public_cert_data: {
                required: false,
                serialized_name: 'properties.publicCertData',
                type: {
                  name: 'String'
                }
              },
              provisioning_state: {
                required: false,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              name: {
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              etag: {
                required: false,
                serialized_name: 'etag',
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
