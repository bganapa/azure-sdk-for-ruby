# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.1.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::DevTestLabs
  module Models
    #
    # Property overrides on a subnet of a virtual network.
    #
    class SubnetOverride

      include MsRestAzure

      # @return [String] The resource identifier of the subnet.
      attr_accessor :resource_id

      # @return [String] The name given to the subnet within the lab.
      attr_accessor :lab_subnet_name

      # @return [UsagePermissionType] Indicates whether this subnet can be used
      # during virtual machine creation. Possible values include: 'Default',
      # 'Deny', 'Allow'
      attr_accessor :use_in_vm_creation_permission

      # @return [UsagePermissionType] Indicates whether public IP addresses can
      # be assigned to virtual machines on this subnet. Possible values
      # include: 'Default', 'Deny', 'Allow'
      attr_accessor :use_public_ip_address_permission


      #
      # Mapper for SubnetOverride class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'SubnetOverride',
          type: {
            name: 'Composite',
            class_name: 'SubnetOverride',
            model_properties: {
              resource_id: {
                required: false,
                serialized_name: 'resourceId',
                type: {
                  name: 'String'
                }
              },
              lab_subnet_name: {
                required: false,
                serialized_name: 'labSubnetName',
                type: {
                  name: 'String'
                }
              },
              use_in_vm_creation_permission: {
                required: false,
                serialized_name: 'useInVmCreationPermission',
                type: {
                  name: 'String'
                }
              },
              use_public_ip_address_permission: {
                required: false,
                serialized_name: 'usePublicIpAddressPermission',
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