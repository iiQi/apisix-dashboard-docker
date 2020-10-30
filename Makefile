VERSION := $(if $(VERSION),$(VERSION),"dev")

all:
	api
	web

# Example:
#   make api
#   VERSION=2.0.0 make api
.PHONY: api
api:

	docker build -t iiqi/apisix-manager:$(VERSION) -f Dockerfile.api .
	
# Example:
#   make web
#   VERSION=2.0.0 make web
.PHONY: web
web:
	docker build -t iiqi/apisix-dashboard:$(VERSION) -f Dockerfile.web .
	