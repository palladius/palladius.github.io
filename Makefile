
APPNAME = sreccardo-blog
VERSION = $(shell cat blog/VERSION)

run-locally:
	cd blog && make run

docker-run-stateless:
	./docker-run.sh

docker-build:
	docker build -t $(APPNAME):v$(VERSION) .
docker-run:
	docker run -it -p 8080:8080 -t $(APPNAME):v$(VERSION) 
docker-run-bash:
	docker run -it -p 8080:8080 -t $(APPNAME):v$(VERSION) bash


create-alcumbs-automagically:
	bin/enable-conda-env.sh 

galleries:
	~/miniconda/envs/sreccardo-blog-env/bin/python bin/opieters_gallery_creator.py 
