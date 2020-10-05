# Ansible VMware Templates

## Execution

### Ad-hoc
```
ansible --private-key=~/configurations/ssh/keys/vm-templates \
        -i inventory.yaml \
        -a "cat /etc/sysconfig/network-scripts/ifcfg-eth0" rhel-family
```

### Playbook

```
ansible-playbook -i inventory.yaml playbooks.yaml
```