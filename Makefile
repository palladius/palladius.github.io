
APPNAME = sreccardo-blog
VERSION = $(shell cat blog/VERSION)
PROJECT_ID = 7eptober

run-locally-2024:
	bundle exec jekyll serve

entrypoint-test:
	RICCARDO_BLOG_URL=https://sreccardo-blog.netlify.app/ RICCARDO_FAVORITE_COLOR=fuxia ./entrypoint-8080.sh
# run-locally:
# 	cd blog && make run

# docker-run-stateless:
# 	./docker-run.sh

docker-build:
	docker build -t $(APPNAME):v$(VERSION) . | tee t.docker-latest-run.log
	docker tag $(APPNAME):v$(VERSION) gcr.io/7eptober/$(APPNAME):v$(VERSION)
docker-push:
	docker push gcr.io/$(PROJECT_ID)/$(APPNAME):v$(VERSION)
docker-run:
	docker run -it -p 8080:8080  --env-file docker-prod.env -t $(APPNAME):v$(VERSION) jekyll serve -P 8080 -s ./
docker-run-bash:
	docker run -it -p 8080:8080  --env-file docker-prod.env -t $(APPNAME):v$(VERSION) bash


# create-alcumbs-automagically:
# 	bin/enable-conda-env.sh

# galleries:
# 	~/miniconda/envs/sreccardo-blog-env/bin/python bin/opieters_gallery_creator.py

run-in-prod-on-gce:
	JEKYLL_ENV=production cd blog && bundle exec jekyll serve --port 8080 --host 0.0.0.0
	#JEKYLL_ENV=production jekyll serve --watch --source ~/git/palladius.github.io/blog -B


clean:
	rm -rf _site/
