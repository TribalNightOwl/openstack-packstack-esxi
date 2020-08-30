#!/bin/bash
COMMAND=$1

case "$COMMAND" in
        deploy ) source .env
                export PUBSSHKEY
                export OPENSTACK_NODE_ROOT_PASSWORD
                ansible-playbook playbooks/configure-project.yaml
                ./deploy-openstack.sh ;;

        destroy ) source config.sh
                docker_run /files/terraform "terraform destroy -auto-approve"
                rm -f deploy-openstack.sh
                rm -rf /tmp/kickstart-openstack
                rm -f keystonerc_admin
                rm -f ks.cfg
                rm -f config.sh
                ;;
        * ) cat <<EOT
Usage:
        openstack.sh deploy
        openstack.sh destroy
EOT
        exit 0;;
esac
