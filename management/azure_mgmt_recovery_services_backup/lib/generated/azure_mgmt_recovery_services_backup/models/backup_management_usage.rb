# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
#
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::RecoveryServicesBackup
  module Models
    #
    # Backup management usages of a vault.
    #
    class BackupManagementUsage

      include MsRestAzure

      include MsRest::JSONable
      # @return [UsagesUnit] Unit of the usage. Possible values include:
      # 'Count', 'Bytes', 'Seconds', 'Percent', 'CountPerSecond',
      # 'BytesPerSecond'
      attr_accessor :unit

      # @return [String] Quota period of usage.
      attr_accessor :quota_period

      # @return [DateTime] Next reset time of usage.
      attr_accessor :next_reset_time

      # @return [Integer] Current value of usage.
      attr_accessor :current_value

      # @return [Integer] Limit of usage.
      attr_accessor :limit

      # @return [NameInfo] Name of usage.
      attr_accessor :name


      #
      # Mapper for BackupManagementUsage class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'BackupManagementUsage',
          type: {
            name: 'Composite',
            class_name: 'BackupManagementUsage',
            model_properties: {
              unit: {
                required: false,
                serialized_name: 'unit',
                type: {
                  name: 'String'
                }
              },
              quota_period: {
                required: false,
                serialized_name: 'quotaPeriod',
                type: {
                  name: 'String'
                }
              },
              next_reset_time: {
                required: false,
                serialized_name: 'nextResetTime',
                type: {
                  name: 'DateTime'
                }
              },
              current_value: {
                required: false,
                serialized_name: 'currentValue',
                type: {
                  name: 'Number'
                }
              },
              limit: {
                required: false,
                serialized_name: 'limit',
                type: {
                  name: 'Number'
                }
              },
              name: {
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'Composite',
                  class_name: 'NameInfo'
                }
              }
            }
          }
        }
      end
    end
  end
end
