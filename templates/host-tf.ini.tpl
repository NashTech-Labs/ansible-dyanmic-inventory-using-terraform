[servers]
%{ for server in server_list ~}
${server.name}.${dns_suffix} ansible_host=${server.ip_address}
%{ endfor ~}

[servers:vars]
ansible_user=${username}
ansible_become=true
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansible_connection=ssh