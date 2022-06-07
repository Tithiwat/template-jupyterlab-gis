# template-jupyterlab-gis
Template Jupyerlab for GIS


### To use (docker command)
```
docker build -t tithiwat/template-jupyterlab-gis:latest .
docker run -p 8888:8888 tithiwat/template-jupyterlab-gis:latest
```

or
```
docker run -p 8888:8888 -v $(pwd):/usr/src tithiwat/template-jupyterlab-gis:latest 
```

* default port of jupyterlab is 8888



### To use (docker-compose command)
```
docker-compose up --build # if you need to build
or
docker-compose up
```

## For Authentication

```
jupyter-lab password
```
- Enter password 2 times then
- Modify docker-compose.yml in section volume. For example
```
version: '3'
services:
    test:
        build:
            context: .
            dockerfile: Dockerfile
        image: test
        restart: unless-stopped
        ports:
          - 8888:8888
        command: jupyter-lab --allow-root --ip 0.0.0.0
        volumes:
          - ./jupyter_server_config.json:/root/.jupyter/jupyter_server_config.json
          - .:/usr/src
```


### output while running
```
[I 2022-05-23 15:03:49.119 ServerApp] jupyterlab | extension was successfully linked.
[I 2022-05-23 15:03:49.139 ServerApp] nbclassic | extension was successfully linked.
[I 2022-05-23 15:03:49.141 ServerApp] Writing Jupyter server cookie secret to /root/.local/share/jupyter/runtime/jupyter_cookie_secret
[I 2022-05-23 15:03:49.426 ServerApp] notebook_shim | extension was successfully linked.
[I 2022-05-23 15:03:49.472 ServerApp] notebook_shim | extension was successfully loaded.
[I 2022-05-23 15:03:49.473 LabApp] JupyterLab extension loaded from /usr/local/lib/python3.8/dist-packages/jupyterlab
[I 2022-05-23 15:03:49.474 LabApp] JupyterLab application directory is /usr/local/share/jupyter/lab
[I 2022-05-23 15:03:49.480 ServerApp] jupyterlab | extension was successfully loaded.
[I 2022-05-23 15:03:49.485 ServerApp] nbclassic | extension was successfully loaded.
[I 2022-05-23 15:03:49.487 ServerApp] Serving notebooks from local directory: /usr/src
[I 2022-05-23 15:03:49.487 ServerApp] Jupyter Server 1.17.0 is running at:
[I 2022-05-23 15:03:49.487 ServerApp] http://34904ee7e5ef:8888/lab?token=355153c663e45d0a45ba5035bdc39d4826d814f5017c7770
[I 2022-05-23 15:03:49.487 ServerApp]  or http://127.0.0.1:8888/lab?token=355153c663e45d0a45ba5035bdc39d4826d814f5017c7770
[I 2022-05-23 15:03:49.487 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 2022-05-23 15:03:49.491 ServerApp] No web browser found: could not locate runnable browser.
[C 2022-05-23 15:03:49.491 ServerApp] 
    
    To access the server, open this file in a browser:
        file:///root/.local/share/jupyter/runtime/jpserver-7-open.html
    Or copy and paste one of these URLs:
        http://34904ee7e5ef:8888/lab?token=355153c663e45d0a45ba5035bdc39d4826d814f5017c7770
     or http://127.0.0.1:8888/lab?token=355153c663e45d0a45ba5035bdc39d4826d814f5017c7770
[W 2022-05-23 15:03:56.108 LabApp] Could not determine jupyterlab build status without nodejs
[W 2022-05-23 15:03:57.403 ServerApp] 404 GET /api/kernels/38b01841-305d-4c16-845c-54617f69eba6?1653318236811 (172.17.0.1): Kernel does not exist: 38b01841-305d-4c16-845c-54617f69eba6
[W 2022-05-23 15:03:57.430 ServerApp] Kernel does not exist: 38b01841-305d-4c16-845c-54617f69eba6
[W 2022-05-23 15:03:57.449 ServerApp] 404 GET /api/kernels/38b01841-305d-4c16-845c-54617f69eba6?1653318236811 (172.17.0.1) 58.01ms referer=http://127.0.0.1:8888/lab
```

# To access jupyter notebook

Please the output after you are running docker/docker-compose

http://127.0.0.1:8888/lab?token=xxxxxxxxx

change the url paramter ip address and token as you are getting the output from terminal