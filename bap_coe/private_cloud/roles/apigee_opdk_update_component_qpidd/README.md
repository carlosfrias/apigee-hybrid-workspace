Apigee OPDK Update Component Qpid
=========

This role takes steps to update a Qpid node of an Apigee Edge platform instance. 

Requirements
------------

None

Role Variables
--------------

The `remove_qpid_upgrade_components` collection is used to list those components that should be
removed prior to updating the system packages. The default list includes: 

    remove_qpid_upgrade_components:
    - qpid-cpp-server
    - qpid-cpp-server-linearstore
    - qpid-tools
    - qpid-qmf
    - python-qpid
    - qpid-cpp-client
    - qpid-proton-c

The `install_qpid_upgrade_components` collection is used to list those component that should be
updated at the system. The default list includes: 

    install_qpid_upgrade_components:
    - yum-plugin-priorities
    - apigee-qpidd


Dependencies
------------

None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: apigee-opdk-update-component-qpidd }

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
