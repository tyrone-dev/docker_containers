DOCKER_OPTS="-e HOME='${HOME}' "\
"-v ${HOME}:/home/ty "\
"--workdir=${HOME} "\
"-p 51502:51502 "\
"-p 51501:51501 "\
"-dt "\
"-h jupyter_docker"

docker run ${DOCKER_OPTS} --name jds_instance tyronevb/jupyter_data_science
docker exec -it -u 0 jds_instance /etc/init.d/ssh start
docker exec -d -u 0 jds_instance jupyterhub --port 51502
