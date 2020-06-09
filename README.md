~~~markdown
## Table of contents
* [Quick Reference](#quick-reference)
* [General info](#general-info)
* [Supported ArangoDB Versions](#arangodb_versions)
* [Run](#run)

## Quick Reference
* Docker hub url : https://hub.docker.com/r/omert08/arangodb-arm64
* Maintained by : omert08
* Where to get help: [Open an issue](https://github.com/omert08/arangodb-arm64/issues/new) or [email me](mailto:tabanyazilim@gmail.com).

## General Info
This docker image enables developes to run ArangoDB on ARM64V8 architecture. 
	
## Supported ArangoDB Versions
This docker image supports following arangodb versions :
* ArangoDB 3.4.10
	
## Run 
```
$ docker run -p 8529:8529 omert08/arangodb-arm64
```
## Run with persistent data
```
$ mkdir /tmp/arangodb
$ docker run -p 8529:8529 -v /tmp/arangodb:/var/lib/arangodb3 omert08/arangodb-arm64 
```
## Known Issues
* Official entrypoint integration is missing, environmental variables like ARANGO_RANDOM_ROOT_PASSWORD will not work. 
(*Not: You can set root password after running arangodb docker instance. )
~~~

