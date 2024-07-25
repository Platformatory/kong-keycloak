# Scaffold for Kong and Keycloak

This serves as a sandbox to play with Kong hybrid and Keycloak.

# How to setup

```
$ docker-compose build
$ docker-compose up
```

# Accessing kong

Kong admin UI can be accessed at `http://localhost:8002/`.

Admin API can be accessed on 8001 port.

```
$ curl --request GET \
  --url http://localhost:8001/consumers \
  --header 'accept: application/json' |  jq .
```

Proxy can be accessed at 8000.

```
$ curl -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" http://localhost:8000/app/anything/hello
```

# Accessing Keycloak

Keycloak UI can be accessed at `http://localhost:8080` with the credentials `admin/keycloak`.


# TODO
- [ ] multiple KC instances
- [ ] How to integrate with OSS OIDC plugin
- [ ] multiple DPs 
