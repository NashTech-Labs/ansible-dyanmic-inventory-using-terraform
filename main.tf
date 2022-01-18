data "template_file" "ansible_run_script" {
  template = file("${path.module}/playbooks/scripts/ansible_run.sh")
}

resource "local_file" "inventory-file" {
  count           = 1
  filename        = "${path.module}/playbooks/.tmp/host-tf.ini"
  file_permission = "0700"
  sensitive_content = templatefile("${path.module}/templates/host-tf.ini.tpl", {
    server_list     = var.server_list,
    dns_suffix      = var.dns_suffix,
    username        = var.username
  })
}

resource "local_file" "ssh-private-key" {
  count             = 1
  filename          = "${path.module}/playbooks/.tmp/private-key.pem"
  file_permission   = "0700"
  sensitive_content = var.ssh_privatekey
}

resource "null_resource" "run-cognos-playbooks" {
  triggers = {
    uuid = uuid()
  }
  depends_on = [local_file.ssh-private-key, local_file.inventory-file]

  provisioner "local-exec" {
    command     = data.template_file.ansible_run_script.rendered
    working_dir = "${path.module}/playbooks"
    environment = {
      ANSIBLE_SSH_RETRIES = 5
    }
  }
}