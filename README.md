# Docker Ghost

Run Ghost blogging platform in Docker, I'm using this for my personal blog

Git clone the repository: 

<code>git clone git@github.com:joselo/docker-ghost.git</code>

Build the docker image:

<code>docker build -t ghost</code>

Run the docker image:

<code>docker docker run -d -p 80:2368 ghost</code>