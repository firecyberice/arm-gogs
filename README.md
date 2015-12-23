# rpi-gogs


Raspberry Pi compatible Docker Image with a minimal `gogs git` server.

## Details
- [BLOG with tutorial](http://blog.hypriot.com/post/run-your-own-github-like-service-with-docker/)
- [Source Project Page](https://github.com/hypriot)
- [Source Repository](https://github.com/hypriot/rpi-gogs-raspbian)
- [Dockerfile](https://github.com/firecyberice/arm-gogs)

## Start a gogs git server
```bash
docker run -d --name my-go-git-server --publish 8022:22 --publish 3000:3000 --volume $(pwd)/gogs-data/:/data firecyberice/armhf-gogs
```
Now you can access the new gogs installation by opening `http://< IP of your Raspberry Pi>:3000` in your browser


## License

The MIT License (MIT)

Copyright (c) 2015 firecyberice
