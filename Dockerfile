FROM registry.redhat.io/rh-sso-7/sso76-openshift-rhel8:latest


ADD krb5.conf /etc/krb5.conf
ADD spn_user.keytab /opt/jboss/keycloak/standalone/configuration/spn_user.keytab

USER root

RUN microdnf install -y krb5-workstation && \
    mkdir /krb5 && chmod 755 /krb5 

USER jboss

VOLUME ["/krb5","/dev/shm","/etc/krb5.conf.d"]

USER 1000


