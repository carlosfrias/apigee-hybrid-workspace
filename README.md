# Apigee hybrid workspace toolkit

The goal of this project is to house the toolkit that has been constructed while 
conducting work sessions with Apigee hybrid. This repository houses an asset that 
is provided as a community contribution to help those charged with understanding, 
installing, configuring and maintaining Apigee hybrid. The audience for this 
toolkit also includes those that would like to understand how to model an 
automation effort for Apigee hybrid or begin working with Apigee hybrid. This 
repository is provided as is with no warranty of any kind. This is not a Google 
product. This is not supported by Apigee in any way. Any and all inquiries for 
information will be answered on a best effort basis as my schedule permits.

It is expected that you provide credentials and other sensitive attributes using
the provided template file `apiee-hybrid-senitive-attributes-TEMPLATE.yml`. 
Please rename this file and place it in a location of your choosing. Once this 
has been complete please update the `vars_files:` stanza in the installation playbooks
with the name and path of your file. 

This toolkit is an Ansible collection. All roles, configurations and playbooks 
are contained within the collection.
 
## Toolkit Collections
| Collection Name | Description | 
| --- | --- |
| [bap_coe.apigee_hybrid](./bap_coe/apigee/README.md) | This collection performs installation of Apigee hybrid |
