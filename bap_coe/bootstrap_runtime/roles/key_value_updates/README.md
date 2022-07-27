Apigee OPDK CWC Updates
=========

This roles performs CWC updates to the Apigee Platform configuration. This role provides an interface
based approach to updating CWC properties. 

Requirements
------------

This role works with an instance of the Apigee platform. 


Role Variables
--------------

| Variable Name | Description |
| --- | --- |
| cwc_properties | The collection is expected to contain rows defined as follows: `- { key: '<key>', value: '<value>', file_name: '<filename>' }` |
| opdk_user_name | The name of the apigee user on the system. Defaults to `apigee` |
| opdk_group_name | The name of the apigee user on the system. Defaults to `apigee` |
| apigee_home | The system path to the apigee installation home. Defaults to `/opt/apigee` |

Dependencies
------------

N/A

Example Playbook
----------------

Example playbook that updates CWC properties:

    - hosts: pgmaster
      vars: 
      replication_string: "host    replication     apigee        10.142.0.32/32            trust"
      cwc_properties:
        - { key: 'conf_pg_hba_replication.connection', value: '{{ replication_string }}', file_name: 'postgresql' }
      roles:
         - { apigee-opdk-cwc-updates }

License
-------

Apache 2.0

Author Information
------------------

Carlos Frias

<!-- BEGIN Google Required Disclaimer -->

# Not Google Product Clause

This is not an officially supported Google product.
<!-- END Google Required Disclaimer -->
<!-- BEGIN Google How To Contribute -->
# How to Contribute

We'd love to accept your patches and contributions to this project. Please review our [guidelines](CONTRIBUTING.md).
<!-- END Google How To Contribute -->
