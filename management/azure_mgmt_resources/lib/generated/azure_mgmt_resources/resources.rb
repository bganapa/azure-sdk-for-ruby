# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.2.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Resources
  #
  # Resources
  #
  class Resources
    include MsRestAzure

    #
    # Creates and initializes a new instance of the Resources class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [ResourceManagementClient] reference to the ResourceManagementClient
    attr_reader :client

    #
    # Move resources from one resource group to another. The resources being moved
    # should all be in the same resource group.
    #
    # @param source_resource_group_name [String] Source resource group name.
    # @param parameters [ResourcesMoveInfo] move resources' parameters.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    def move_resources(source_resource_group_name, parameters, custom_headers = nil)
      response = move_resources_async(source_resource_group_name, parameters, custom_headers).value!
      nil
    end

    #
    # @param source_resource_group_name [String] Source resource group name.
    # @param parameters [ResourcesMoveInfo] move resources' parameters.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Concurrent::Promise] promise which provides async access to http
    # response.
    #
    def move_resources_async(source_resource_group_name, parameters, custom_headers = nil)
      # Send request
      promise = begin_move_resources_async(source_resource_group_name, parameters, custom_headers)

      promise = promise.then do |response|
        # Defining deserialization method.
        deserialize_method = lambda do |parsed_response|
        end

        # Waiting for response.
        @client.get_long_running_operation_result(response, deserialize_method)
      end

      promise
    end

    #
    # Get all of the resources under a subscription.
    #
    # @param filter [String] The filter to apply on the operation.
    # @param expand [String] The $expand query parameter.
    # @param top [Integer] Query parameters. If null is passed returns all resource
    # groups.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Array<GenericResource>] operation results.
    #
    def list(filter = nil, expand = nil, top = nil, custom_headers = nil)
      first_page = list_as_lazy(filter, expand, top, custom_headers)
      first_page.get_all_items
    end

    #
    # Get all of the resources under a subscription.
    #
    # @param filter [String] The filter to apply on the operation.
    # @param expand [String] The $expand query parameter.
    # @param top [Integer] Query parameters. If null is passed returns all resource
    # groups.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_with_http_info(filter = nil, expand = nil, top = nil, custom_headers = nil)
      list_async(filter, expand, top, custom_headers).value!
    end

    #
    # Get all of the resources under a subscription.
    #
    # @param filter [String] The filter to apply on the operation.
    # @param expand [String] The $expand query parameter.
    # @param top [Integer] Query parameters. If null is passed returns all resource
    # groups.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_async(filter = nil, expand = nil, top = nil, custom_headers = nil)
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resources'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id},
          query_params: {'$filter' => filter,'$expand' => expand,'$top' => top,'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::ARM::Resources::Models::ResourceListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Checks whether resource exists.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Boolean] operation results.
    #
    def check_existence(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers = nil)
      response = check_existence_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Checks whether resource exists.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def check_existence_with_http_info(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers = nil)
      check_existence_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers).value!
    end

    #
    # Checks whether resource exists.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def check_existence_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'resource_provider_namespace is nil' if resource_provider_namespace.nil?
      fail ArgumentError, 'parent_resource_path is nil' if parent_resource_path.nil?
      fail ArgumentError, 'resource_type is nil' if resource_type.nil?
      fail ArgumentError, 'resource_name is nil' if resource_name.nil?
      fail ArgumentError, 'api_version is nil' if api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/{resourceProviderNamespace}/{parentResourcePath}/{resourceType}/{resourceName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'resourceProviderNamespace' => resource_provider_namespace,'resourceName' => resource_name,'subscriptionId' => @client.subscription_id},
          skip_encoding_path_params: {'parentResourcePath' => parent_resource_path,'resourceType' => resource_type},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:head, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 204 || status_code == 404
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.body = (status_code == 204)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Delete resource and all of its resources.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def delete(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers = nil)
      response = delete_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers).value!
      nil
    end

    #
    # Delete resource and all of its resources.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def delete_with_http_info(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers = nil)
      delete_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers).value!
    end

    #
    # Delete resource and all of its resources.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def delete_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'resource_provider_namespace is nil' if resource_provider_namespace.nil?
      fail ArgumentError, 'parent_resource_path is nil' if parent_resource_path.nil?
      fail ArgumentError, 'resource_type is nil' if resource_type.nil?
      fail ArgumentError, 'resource_name is nil' if resource_name.nil?
      fail ArgumentError, 'api_version is nil' if api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/{resourceProviderNamespace}/{parentResourcePath}/{resourceType}/{resourceName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'resourceProviderNamespace' => resource_provider_namespace,'resourceName' => resource_name,'subscriptionId' => @client.subscription_id},
          skip_encoding_path_params: {'parentResourcePath' => parent_resource_path,'resourceType' => resource_type},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:delete, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 204 || status_code == 202
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Create a resource.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param parameters [GenericResource] Create or update resource parameters.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [GenericResource] operation results.
    #
    def create_or_update(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, parameters, custom_headers = nil)
      response = create_or_update_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, parameters, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Create a resource.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param parameters [GenericResource] Create or update resource parameters.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def create_or_update_with_http_info(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, parameters, custom_headers = nil)
      create_or_update_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, parameters, custom_headers).value!
    end

    #
    # Create a resource.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param parameters [GenericResource] Create or update resource parameters.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def create_or_update_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, parameters, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'resource_provider_namespace is nil' if resource_provider_namespace.nil?
      fail ArgumentError, 'parent_resource_path is nil' if parent_resource_path.nil?
      fail ArgumentError, 'resource_type is nil' if resource_type.nil?
      fail ArgumentError, 'resource_name is nil' if resource_name.nil?
      fail ArgumentError, 'api_version is nil' if api_version.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = Azure::ARM::Resources::Models::GenericResource.mapper()
      request_content = @client.serialize(request_mapper,  parameters)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/{resourceProviderNamespace}/{parentResourcePath}/{resourceType}/{resourceName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'resourceProviderNamespace' => resource_provider_namespace,'resourceName' => resource_name,'subscriptionId' => @client.subscription_id},
          skip_encoding_path_params: {'parentResourcePath' => parent_resource_path,'resourceType' => resource_type},
          query_params: {'api-version' => api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:put, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 201 || status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 201
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::ARM::Resources::Models::GenericResource.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::ARM::Resources::Models::GenericResource.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Returns a resource belonging to a resource group.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [GenericResource] operation results.
    #
    def get(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers = nil)
      response = get_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Returns a resource belonging to a resource group.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_with_http_info(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers = nil)
      get_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers).value!
    end

    #
    # Returns a resource belonging to a resource group.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_provider_namespace [String] Resource identity.
    # @param parent_resource_path [String] Resource identity.
    # @param resource_type [String] Resource identity.
    # @param resource_name [String] Resource identity.
    # @param api_version [String]
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(resource_group_name, resource_provider_namespace, parent_resource_path, resource_type, resource_name, api_version, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'resource_provider_namespace is nil' if resource_provider_namespace.nil?
      fail ArgumentError, 'parent_resource_path is nil' if parent_resource_path.nil?
      fail ArgumentError, 'resource_type is nil' if resource_type.nil?
      fail ArgumentError, 'resource_name is nil' if resource_name.nil?
      fail ArgumentError, 'api_version is nil' if api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/{resourceProviderNamespace}/{parentResourcePath}/{resourceType}/{resourceName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'resourceProviderNamespace' => resource_provider_namespace,'resourceName' => resource_name,'subscriptionId' => @client.subscription_id},
          skip_encoding_path_params: {'parentResourcePath' => parent_resource_path,'resourceType' => resource_type},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::ARM::Resources::Models::GenericResource.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Move resources from one resource group to another. The resources being moved
    # should all be in the same resource group.
    #
    # @param source_resource_group_name [String] Source resource group name.
    # @param parameters [ResourcesMoveInfo] move resources' parameters.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def begin_move_resources(source_resource_group_name, parameters, custom_headers = nil)
      response = begin_move_resources_async(source_resource_group_name, parameters, custom_headers).value!
      nil
    end

    #
    # Move resources from one resource group to another. The resources being moved
    # should all be in the same resource group.
    #
    # @param source_resource_group_name [String] Source resource group name.
    # @param parameters [ResourcesMoveInfo] move resources' parameters.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def begin_move_resources_with_http_info(source_resource_group_name, parameters, custom_headers = nil)
      begin_move_resources_async(source_resource_group_name, parameters, custom_headers).value!
    end

    #
    # Move resources from one resource group to another. The resources being moved
    # should all be in the same resource group.
    #
    # @param source_resource_group_name [String] Source resource group name.
    # @param parameters [ResourcesMoveInfo] move resources' parameters.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def begin_move_resources_async(source_resource_group_name, parameters, custom_headers = nil)
      fail ArgumentError, 'source_resource_group_name is nil' if source_resource_group_name.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = Azure::ARM::Resources::Models::ResourcesMoveInfo.mapper()
      request_content = @client.serialize(request_mapper,  parameters)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{sourceResourceGroupName}/moveResources'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'sourceResourceGroupName' => source_resource_group_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:post, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 202 || status_code == 204
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Get all of the resources under a subscription.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ResourceListResult] operation results.
    #
    def list_next(next_page_link, custom_headers = nil)
      response = list_next_async(next_page_link, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Get all of the resources under a subscription.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_next_with_http_info(next_page_link, custom_headers = nil)
      list_next_async(next_page_link, custom_headers).value!
    end

    #
    # Get all of the resources under a subscription.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_next_async(next_page_link, custom_headers = nil)
      fail ArgumentError, 'next_page_link is nil' if next_page_link.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '{nextLink}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          skip_encoding_path_params: {'nextLink' => next_page_link},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::ARM::Resources::Models::ResourceListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Get all of the resources under a subscription.
    #
    # @param filter [String] The filter to apply on the operation.
    # @param expand [String] The $expand query parameter.
    # @param top [Integer] Query parameters. If null is passed returns all resource
    # groups.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ResourceListResult] which provide lazy access to pages of the
    # response.
    #
    def list_as_lazy(filter = nil, expand = nil, top = nil, custom_headers = nil)
      response = list_async(filter, expand, top, custom_headers).value!
      unless response.nil?
        page = response.body
        page.next_method = Proc.new do |next_page_link|
          list_next_async(next_page_link, custom_headers)
        end
        page
      end
    end

  end
end
