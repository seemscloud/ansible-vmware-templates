# Ansible VMware Templates

## Execution

### Playbook

```
ansible --private-key=~/configurations/ssh/keys/vm-templates \
        -i inventory.yaml \
        -a "cat /etc/sysconfig/network-scripts/ifcfg-eth0" rhel-family
```

### Ad-hoc

```
ansible-playbook -i inventory.yaml playbooks.yaml
```