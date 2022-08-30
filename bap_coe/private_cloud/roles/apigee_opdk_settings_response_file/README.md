Apigee Response File Settings
=========

This Ansible role is used to generate response file names dynamically 
using attributes that are available at runtime.

Requirements
------------

The Ansible role apigee-opdk-settings-region will dynamically determine
the region of the current node. 

Role Variables
--------------

The following variables are used in this role:

| Name | Description |
| --- | --- |
| region | Region of the current node. Can be set by the apigee-opdk-settings-region Ansible role. |
| opdk_version | Apigee Private Cloud version being installed. Usually set in `~/.apigee/custom-properties.yml`. |
| local_apigee_secure_path | Path to location of security credentials and attributes. Usually set in `~/.apigee/custom-properties.yml`. |
| target_response_file_path | Path to location of resources used during installation on the current node. Usually set in `~/.apigee/custom-properties.yml`. |  

Dependencies
------------

This role depends on apigee-opdk-settings-region and the attributes set in `~/.apigee/custom-properties.yml`.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

Apache 2.0

Author Information
------------------

Carlos Frias
<!-- BEGIN Google How To Contribute -->
# How to Contribute

We'd love to accept your patches and contributions to this project. Please review our [guidelines](CONTRIBUTING.md).
<!-- END Google How To Contribute -->
<!-- BEGIN Google Required Disclaimer -->

# Not Google Product Clause

This is not an officially supported Google product.
<!-- END Google Required Disclaimer -->
