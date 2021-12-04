# Example run gui applications in docker

1. All commands need sudo or root permissions
2. install docker 
3. start and enable docker service
4. Create custom image , size 1,4GB approximately

        `docker build --build-arg MWAPP_CONFIG=data.bkc -t imagename . `
                            or
        ``docker build --build-arg MWAPP_CONFIG=data.bkc -t imagename - < (full_path_to_dockerfile)/Dockerfile ``
5. run image in container disposable (it will be destroyed after finishing), there are other modes, I chose this one 

        `docker run -ti --rm -e MWAPP_CONFIG='data.bkc' -v /run/media/alex/mfile/mwneo:/home/alex -p 8080:8080 -p 5901:5901 -p 8000:8000 -p 9595:9595 imagename `
6. run vnc  ( set resolution your screen )

          `tightvncserver :1 -geometry 1920x1080 -depth 24  `
7. set password to vnc ( 8 digits )
8. open vncview and run yours applications
