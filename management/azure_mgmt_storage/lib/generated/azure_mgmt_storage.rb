# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.2.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

require 'uri'
require 'cgi'
require 'date'
require 'json'
require 'base64'
require 'erb'
require 'securerandom'
require 'time'
require 'timeliness'
require 'faraday'
require 'faraday-cookie_jar'
require 'concurrent'
require 'ms_rest'
require 'generated/azure_mgmt_storage/module_definition'
require 'ms_rest_azure'

module Azure::ARM::Storage
  autoload :StorageAccounts,                                    'generated/azure_mgmt_storage/storage_accounts.rb'
  autoload :UsageOperations,                                    'generated/azure_mgmt_storage/usage_operations.rb'
  autoload :StorageManagementClient,                            'generated/azure_mgmt_storage/storage_management_client.rb'

  module Models
    autoload :StorageAccountListResult,                           'generated/azure_mgmt_storage/models/storage_account_list_result.rb'
    autoload :StorageAccountCheckNameAvailabilityParameters,      'generated/azure_mgmt_storage/models/storage_account_check_name_availability_parameters.rb'
    autoload :StorageAccountUpdateParameters,                     'generated/azure_mgmt_storage/models/storage_account_update_parameters.rb'
    autoload :StorageAccountCreateParameters,                     'generated/azure_mgmt_storage/models/storage_account_create_parameters.rb'
    autoload :StorageAccountRegenerateKeyParameters,              'generated/azure_mgmt_storage/models/storage_account_regenerate_key_parameters.rb'
    autoload :CustomDomain,                                       'generated/azure_mgmt_storage/models/custom_domain.rb'
    autoload :UsageName,                                          'generated/azure_mgmt_storage/models/usage_name.rb'
    autoload :StorageAccountKeys,                                 'generated/azure_mgmt_storage/models/storage_account_keys.rb'
    autoload :Usage,                                              'generated/azure_mgmt_storage/models/usage.rb'
    autoload :Endpoints,                                          'generated/azure_mgmt_storage/models/endpoints.rb'
    autoload :UsageListResult,                                    'generated/azure_mgmt_storage/models/usage_list_result.rb'
    autoload :CheckNameAvailabilityResult,                        'generated/azure_mgmt_storage/models/check_name_availability_result.rb'
    autoload :StorageAccount,                                     'generated/azure_mgmt_storage/models/storage_account.rb'
    autoload :Reason,                                             'generated/azure_mgmt_storage/models/reason.rb'
    autoload :AccountType,                                        'generated/azure_mgmt_storage/models/account_type.rb'
    autoload :ProvisioningState,                                  'generated/azure_mgmt_storage/models/provisioning_state.rb'
    autoload :AccountStatus,                                      'generated/azure_mgmt_storage/models/account_status.rb'
    autoload :UsageUnit,                                          'generated/azure_mgmt_storage/models/usage_unit.rb'
  end
end
