

run-locally:
	cd blog && make run

docker-run:
	./docker-run.sh


create-alcumbs-automagically:
	bin/enable-conda-env.sh 
	~/miniconda/envs/sreccardo-blog-env/bin/python bin/opieters_gallery_creator.py 
