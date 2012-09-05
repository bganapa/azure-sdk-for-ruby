#-------------------------------------------------------------------------
# Copyright 2012 Microsoft Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#--------------------------------------------------------------------------
require "azure/core/service"
require "azure/core/auth/authorizer"
require "azure/core/auth/shared_key"
require "azure/queues/uri"
require "nokogiri"

module Azure
  module Queues

    class Service < Core::Service
      def initialize(signer=Azure::Core::Auth::Strategies::SharedKey.new)
        super(signer)
      end
    end

    module Services

      # Public: gets the properties of a storage account’s Queue Service.
      class GetServiceProperties < Service

        # Public: Invoke the service.
        #
        # options - Options for this query:
        #           :timeout  - (optional) timeout for the request in seconds
        #
        # Returns a Azure::Core::HttpResponse.
        def call(options = {})
          uri = Queues::URI.service_properties(options)

          super(:get, uri)
        end
      end

      # Public: sets the properties of a storage account’s Queue Service.
      class SetServiceProperties < Service

        # Public: Invoke the service.
        #
        # properties  - an Azure::Queues::ServiceProperties object
        # options     - Options for this query:
        #               :timeout  - (optional) timeout for the request in seconds
        #
        # Returns a Azure::Core::HttpResponse.
        def call(properties, options = {})
          uri = Queues::URI.service_properties(options)

          body = properties.to_xml

          super(:put, uri, body)
        end
      end

      # Public: List queues from a storage account
      class ListQueues < Service
        # Public: Invoke the service.
        #
        # options - A hash of options
        #           :prefix           - Filters the results to return only
        #                               queues with names that begin with the
        #                               specified prefix.
        #           :marker           - A string value that identifies the
        #                               portion of the list to be returned
        #                               with the next list operation.
        #           :maxresults       - Specifies the maximum number of queues
        #                               to return.
        #
        # Returns a Azure::Core::HttpResponse.
        def call(options)
          uri = Queues::URI.collection(options)
          super(:get, uri)
        end
      end

      # Public: Add a queue to the storage account.
      class CreateQueue < Service

        # Public: Invoke the service.
        #
        # name     - The name of the new container.
        # metadata - User defined metadata for this queue (default: {}).
        #
        # Returns a Azure::Core::HttpResponse.
        def call(name, metadata = {})
          uri = Queues::URI.queue(name)

          super(:put, uri) do |request|
            metadata.each do |name, value|
              request.headers["x-ms-meta-#{name}"] = value
            end
          end
        end
      end

      # Public: Deletes a queue from the storage account.
      class DeleteQueue < Service

        # Public: Invoke the service.
        #
        # name     - The name of the queue.
        #
        # Returns a Azure::Core::HttpResponse.
        def call(name)
          uri = Queues::URI.queue(name)
          super(:delete, uri)
        end
      end

      # Public: Get queue metadata
      class GetMetadata < Service
        # Public: Invoke the service.
        #
        # name - The queue name.
        #
        # Returns a Azure::Core::HttpResponse.
        def call(name)
          uri = Queues::URI.queue(name, comp: "metadata")
          super(:head, uri)
        end
      end

      # Public: Set queue metadata.
      class SetMetadata < Service
        # Public: Invoke the service.
        #
        # name     - The queue name.
        # metadata - User defined metadata for this queue.
        #
        # Returns a Azure::Core::HttpResponse.
        def call(name, metadata)
          uri = Queues::URI.queue(name, comp: "metadata")

          super(:put, uri) do |request|
            metadata.each do |name, value|
              request.headers["x-ms-meta-#{name}"] = value
            end
          end
        end
      end

      ## Messages

      # Public: Add a message to the message queue
      class PutMessage < Service
        # Public: Invoke the service.
        #
        # queue_name - The name of the queue.
        # text       - The message's text.
        # options    - A Hash of options for this message (optional):
        #              :visibilitytimeout - Amount of seconds during which the
        #                                   message will be invisible
        #                                   (default: 0).
        #              :messagettl        - Time in seconds until the message is
        #                                   unreacable, between 1 second and 7
        #                                   days (default: 7 days).
        #
        # Returns a Azure::Core::HttpResponse.
        def call(queue_name, text, options = {})
          uri = Queues::URI.messages(queue_name, options)

          body = Nokogiri::XML::Builder.new do |xml|
            xml.QueueMessage {
              xml.MessageText text
            }
          end

          super(:post, uri, body.to_xml)
        end
      end

      # Public: Get a list of messages from the front of the message queue.
      class GetMessages < Service
        # Public: Invoke the service.
        #
        # queue_name - The name of the message queue.
        # options    - A Hash of options for this operation (optional):
        #              :visibilitytimeout - Update the returned messages'
        #                                   visibilitytimeout to this number (at
        #                                   least 1, the default).
        #              :numofmessages     - A number between 1 and 32 of messages
        #                                   to return (default: 1).
        #
        # Returns a Azure::Core::HttpResponse.
        def call(queue_name, options={})
          uri = Queues::URI.messages(queue_name, options)
          super(:get, uri)
        end
      end

      # Public: Peek at a list of messages from the front of the message queue.
      class PeekMessages < Service
        # Public: Invoke the service.
        #
        # queue_name - The name of the message queue.
        # options    - A Hash of options for this operation (optional):
        #              :numofmessages     - A number between 1 and 32 of messages
        #                                   to return (default: 1).
        #
        # Returns a Azure::Core::HttpResponse.
        def call(queue_name, options={})
          options.update(peekonly: 'true')
          uri = Queues::URI.messages(queue_name, options)
          super(:get, uri)
        end
      end

      # Public: Deletes a message from the message queue.
      class DeleteMessage < Service
        # Public: Invoke the service.
        #
        # queue_name  - The name of the message queue.
        # message_id  - The message id.
        # pop_receipt - The receipt of a previous pop operation on this message.
        #
        # Returns a Azure::Core::HttpResponse.
        def call(queue_name, message_id, pop_receipt)
          uri = Queues::URI.message(
            queue_name, message_id, popreceipt: pop_receipt
          )
          super(:delete, uri)
        end
      end

      # Public: Deletes all messages on the given queue.
      class ClearMessages < Service
        # Public: Invoke the service.
        #
        # queue_name - The name of the queue.
        #
        # Returns a Azure::Core::HttpResponse.
        def call(queue_name)
          uri = Queues::URI.messages(queue_name)
          super(:delete, uri)
        end
      end

      # Public: Update a message from the message queue.
      class UpdateMessage < Service
        # Public: Invoke the service.
        #
        # queue_name  - The name of the message queue.
        # message_id  - The message's id.
        # text        - The message's new text.
        # timeout     - A new visibilitytimeout for the message.
        # pop_receipt - The receipt of a previous pop operation on this message.
        #
        # Returns a Azure::Core::HttpResponse.
        def call(queue_name, message_id, text, timeout, pop_receipt)
          uri = Queues::URI.message(queue_name, message_id, {
            popreceipt: pop_receipt, visibilitytimeout: timeout
          })

          body = Nokogiri::XML::Builder.new do |xml|
            xml.QueueMessage {
              xml.MessageText text
            }
          end

          super(:put, uri, body.to_xml)
        end
      end

    end
  end
end
