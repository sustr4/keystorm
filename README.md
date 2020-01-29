<p align="center">
  <img alt="Keystorm" src="https://i.imgur.com/PsaUDCU.png" width="300"/>
</p>

# Keystorm
The federated authentication component for rOCCI-server.

Keystorm allows users to authenticate using several protocols, currently
OIDC(OpenID Connect) and VOMS(Virtual Organization Membership Service). After
successful authentication, user is given an unscoped token that is generated
from credentials received from authentication protocol. User can use unscoped
token to generate scoped token that is used to access cloud service.

# Requirements
- Ruby 2.2.7+
- OpenNebula 5.2+ (when using OpenNebula cloud provider)
- Memcache

# Installation
In production Keystorm must *NEVER* be accessible remotly. It should run under
Apache2 server that handles authentication and forwards credentials to Keystorm.

## Apache2
Default Apache2 configuration can be found in `example/apache2`

## Keystorm
### Docker
```bash
https://hub.docker.com/r/therocciproject/keystorm/
```

### Source
```bash
git clone https://github.com/the-rocci-project/keystorm.git
cd keystorm
bundle install --deployment --without development test

export RAILS_ENV=production
export HOST=127.0.0.1
export SECRET_KEY_BASE=$(head -c 69 /dev/urandom | base64 -w 0)
export KEYSTORM_OPENNEBULA_SECRET=oneadmin:opennebula
export KEYSTORM_TOKEN_KEY=$(head -c 12 /dev/urandom | base64 -w 0) # Must be 16 chars
export KEYSTORM_TOKEN_IV=$(head -c 12 /dev/urandom | base64 -w 0) # Must be 16 chars

bundle exec puma # --daemon
```

## Acknowledgements
This work is co-funded by the [EOSC-hub project](http://eosc-hub.eu/) (Horizon 2020) under Grant number 777536.
<img src="https://wiki.eosc-hub.eu/download/attachments/1867786/eu%20logo.jpeg?version=1&modificationDate=1459256840098&api=v2" height="24">
<img src="https://wiki.eosc-hub.eu/download/attachments/18973612/eosc-hub-web.png?version=1&modificationDate=1516099993132&api=v2" height="24">
