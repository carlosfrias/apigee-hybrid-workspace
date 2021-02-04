import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')

def test_nginx_installed(host):
  nginx = host.package('nginx')
  assert nginx.is_installed

def test_nginx_config_exists(host):
  nginx_config = host.file('/etc/nginx/nginx.conf')
  assert nginx_config.exists

def test_nginx_running(host):
  nginx_service = host.service('nginx')
  assert nginx_service.is_running
  assert nginx_service.is_enabled
