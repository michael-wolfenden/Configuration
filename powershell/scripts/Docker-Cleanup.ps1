function Docker-Cleanup 
{
    docker rm -f $(docker ps -qa)
    docker rmi -f $(docker images -qa)
}
