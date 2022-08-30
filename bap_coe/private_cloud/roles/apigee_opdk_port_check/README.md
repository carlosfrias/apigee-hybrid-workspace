# Apigee OPDK Port Check

The purpose of this Ansible role is to report whether Apigee ports are in fact accessible.


Requirements
------------

The Ansible inventory has been configured for use by these playbooks as described.
  
Role Variables
--------------

| Name | Description |
| --- | --- |
| host_list | A collection of hosts from which to check accessibility of target ports. |
| ports | A collection of ports that should be checked for accessibility from each host in the `host_list` |
| timeout_port | The amount of time that we should wait for a response. Default = 10 |
| private_address | The private IP asssigned to the host under examination for accessibility of target ports. |
| cassandra_ports | Collection of ports for cassandra accessibility |
| zk_ports | Collection of ports for zookeeper accessibility |
| mp_ports | Collection of ports for message processor accessibility |
| ms_ports | Collection of ports for management server accessibility |
| router_ports | Collection of ports for router accessibility |
| qpid_ports | Collection of ports for qpid accessibility |
| pg_ports | Collection of ports for postgres accessibility |
| ui_ports | Collection of ports for edge ui accessibility |
| ldap_ports | Collection of ports for openldap accessibility |

Dependencies
------------

he following Ansible roles are used by this role: 

* apigee-opdk-settings-private-address
* apigee-opdk-settings-region
* apigee-opdk-settings-management-server
* apigee-opdk-settings-cassandra
* apigee-opdk-settings-ldap
* apigee-opdk-settings-postgres
* apigee-opdk-port-check 
  
Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

     - name: Validate that Openldap port requirements are met
       hosts: ldap
       tags: ['ldap']
       strategy: free
       vars:
         ports:
         - "{{ ldap_ports }}"
         host_list:
         - 0.0.0.0
       roles:
         - { role: apigee-opdk-port-check, host_list: "{{ groups['ms'] }}" }    
         

License
-------

Apache 2.0

Author Information
------------------

Carlos Frias
