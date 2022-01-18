#!/bin/bash
ansible-playbook playbook.yml -i .tmp/host-tf.ini --private-key .tmp/private-key.pem