# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::ServiceBus
  module Models
    #
    # Description of subscription resource.
    #
    class SubscriptionResource < MsRestAzure::Resource

      include MsRestAzure

      include MsRest::JSONable
      # @return [DateTime] Last time there was a receive request to this
      # subscription.
      attr_accessor :accessed_at

      # @return [String] TimeSpan idle interval after which the topic is
      # automatically deleted. The minimum duration is 5 minutes.
      attr_accessor :auto_delete_on_idle

      # @return [MessageCountDetails]
      attr_accessor :count_details

      # @return [DateTime] Exact time the message was created.
      attr_accessor :created_at

      # @return [String] Default message time to live value. This is the
      # duration after which the message expires, starting from when the
      # message is sent to Service Bus. This is the default value used when
      # TimeToLive is not set on a message itself.
      attr_accessor :default_message_time_to_live

      # @return [Boolean] Value that indicates whether a subscription has dead
      # letter support on filter evaluation exceptions.
      attr_accessor :dead_lettering_on_filter_evaluation_exceptions

      # @return [Boolean] Value that indicates whether a subscription has dead
      # letter support when a message expires.
      attr_accessor :dead_lettering_on_message_expiration

      # @return [Boolean] Value that indicates whether server-side batched
      # operations are enabled.
      attr_accessor :enable_batched_operations

      # @return [EntityAvailabilityStatus] Entity availability status for the
      # topic. Possible values include: 'Available', 'Limited', 'Renaming',
      # 'Restoring', 'Unknown'
      attr_accessor :entity_availability_status

      # @return [Boolean] Value that indicates whether the entity description
      # is read-only.
      attr_accessor :is_read_only

      # @return [String] The lock duration time span for the subscription.
      attr_accessor :lock_duration

      # @return [Integer] Number of maximum deliveries.
      attr_accessor :max_delivery_count

      # @return [Integer] Number of messages.
      attr_accessor :message_count

      # @return [Boolean] Value indicating if a subscription supports the
      # concept of sessions.
      attr_accessor :requires_session

      # @return [EntityStatus] Enumerates the possible values for the status of
      # a messaging entity. Possible values include: 'Active', 'Creating',
      # 'Deleting', 'Disabled', 'ReceiveDisabled', 'Renaming', 'Restoring',
      # 'SendDisabled', 'Unknown'
      attr_accessor :status

      # @return [DateTime] The exact time the message was updated.
      attr_accessor :updated_at


      #
      # Mapper for SubscriptionResource class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'SubscriptionResource',
          type: {
            name: 'Composite',
            class_name: 'SubscriptionResource',
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
              location: {
                required: false,
                serialized_name: 'location',
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
              accessed_at: {
                required: false,
                read_only: true,
                serialized_name: 'properties.accessedAt',
                type: {
                  name: 'DateTime'
                }
              },
              auto_delete_on_idle: {
                required: false,
                serialized_name: 'properties.autoDeleteOnIdle',
                type: {
                  name: 'String'
                }
              },
              count_details: {
                required: false,
                read_only: true,
                serialized_name: 'properties.countDetails',
                type: {
                  name: 'Composite',
                  class_name: 'MessageCountDetails'
                }
              },
              created_at: {
                required: false,
                read_only: true,
                serialized_name: 'properties.createdAt',
                type: {
                  name: 'DateTime'
                }
              },
              default_message_time_to_live: {
                required: false,
                serialized_name: 'properties.defaultMessageTimeToLive',
                type: {
                  name: 'String'
                }
              },
              dead_lettering_on_filter_evaluation_exceptions: {
                required: false,
                serialized_name: 'properties.deadLetteringOnFilterEvaluationExceptions',
                type: {
                  name: 'Boolean'
                }
              },
              dead_lettering_on_message_expiration: {
                required: false,
                serialized_name: 'properties.deadLetteringOnMessageExpiration',
                type: {
                  name: 'Boolean'
                }
              },
              enable_batched_operations: {
                required: false,
                serialized_name: 'properties.enableBatchedOperations',
                type: {
                  name: 'Boolean'
                }
              },
              entity_availability_status: {
                required: false,
                serialized_name: 'properties.entityAvailabilityStatus',
                type: {
                  name: 'Enum',
                  module: 'EntityAvailabilityStatus'
                }
              },
              is_read_only: {
                required: false,
                serialized_name: 'properties.isReadOnly',
                type: {
                  name: 'Boolean'
                }
              },
              lock_duration: {
                required: false,
                serialized_name: 'properties.lockDuration',
                type: {
                  name: 'String'
                }
              },
              max_delivery_count: {
                required: false,
                serialized_name: 'properties.maxDeliveryCount',
                type: {
                  name: 'Number'
                }
              },
              message_count: {
                required: false,
                read_only: true,
                serialized_name: 'properties.messageCount',
                type: {
                  name: 'Number'
                }
              },
              requires_session: {
                required: false,
                serialized_name: 'properties.requiresSession',
                type: {
                  name: 'Boolean'
                }
              },
              status: {
                required: false,
                serialized_name: 'properties.status',
                type: {
                  name: 'Enum',
                  module: 'EntityStatus'
                }
              },
              updated_at: {
                required: false,
                read_only: true,
                serialized_name: 'properties.updatedAt',
                type: {
                  name: 'DateTime'
                }
              }
            }
          }
        }
      end
    end
  end
end
