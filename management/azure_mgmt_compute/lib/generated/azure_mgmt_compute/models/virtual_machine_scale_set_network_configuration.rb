# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Describes a virtual machine scale set network profile's network
    # configurations.
    #
    class VirtualMachineScaleSetNetworkConfiguration < MsRestAzure::SubResource

      include MsRestAzure

      include MsRest::JSONable
      # @return [String] The network configuration name.
      attr_accessor :name

      # @return [Boolean] Whether this is a primary NIC on a virtual machine.
      attr_accessor :primary

      # @return [SubResource] The network security group.
      attr_accessor :network_security_group

      # @return [VirtualMachineScaleSetNetworkConfigurationDnsSettings] The dns
      # settings to be applied on the network interfaces.
      attr_accessor :dns_settings

      # @return [Array<VirtualMachineScaleSetIPConfiguration>] The virtual
      # machine scale set IP Configuration.
      attr_accessor :ip_configurations


      #
      # Mapper for VirtualMachineScaleSetNetworkConfiguration class as Ruby
      # Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'VirtualMachineScaleSetNetworkConfiguration',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineScaleSetNetworkConfiguration',
            model_properties: {
              id: {
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                required: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              primary: {
                required: false,
                serialized_name: 'properties.primary',
                type: {
                  name: 'Boolean'
                }
              },
              network_security_group: {
                required: false,
                serialized_name: 'properties.networkSecurityGroup',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              dns_settings: {
                required: false,
                serialized_name: 'properties.dnsSettings',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualMachineScaleSetNetworkConfigurationDnsSettings'
                }
              },
              ip_configurations: {
                required: true,
                serialized_name: 'properties.ipConfigurations',
                type: {
                  name: 'Sequence',
                  element: {
                      required: false,
                      serialized_name: 'VirtualMachineScaleSetIPConfigurationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'VirtualMachineScaleSetIPConfiguration'
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
