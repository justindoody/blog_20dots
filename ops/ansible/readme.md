The following are needed in `./templates/default.yml`:
```sh
---
user: <user>
copy_local_key: "{{ lookup('file', lookup('env','HOME') + '/.ssh/<key>.pub') }}"
sys_packages: [ 'curl', 'git', 'ufw']
volume_name: <name>
```

You also need to add `./hosts` with:
```sh
XXX.XXX.X.XXX ansible_ssh_private_key_file=~/.ssh/<private-key>
```

Use the following to run the playbooks:
`ansible-playbook initial-playbook.yml --inventory-file=./hosts -u root`
`ansible-playbook docker-playbook.yml --inventory-file=./hosts -u <user>`