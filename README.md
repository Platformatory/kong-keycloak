# Scaffold for Kong and Keycloak

This serves as a sandbox to play with Kong hybrid and Keycloak.


# Prerequisites

Tools needed:
1. docker, docker-compose
2. make
3. jq(optional)

Clone the [Keycloak OIDC OSS plugin](https://github.com/Platformatory/kong-plugin-jwt-keycloak) and run `make build`. This will create the `telekom-digioss/kong-plugin-jwt-keycloak:3.7.1` image.

# How to setup

```
$ docker-compose up -d
```

This will bring up Kong CP, DP, keycloak and 1 Postgres instance each for Kong and Keycloak.

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

## Testing

```bash
./setup_kong.sh
sleep 60
./setup_keycloak.sh
./test_flow.sh
```

# Accessing Keycloak

Keycloak UI can be accessed at `http://localhost:8080` with the credentials `admin/keycloak`.


# TODO
- [ ] multiple KC instances
- [x] How to integrate with OSS OIDC plugin
- [ ] multiple DPs 
