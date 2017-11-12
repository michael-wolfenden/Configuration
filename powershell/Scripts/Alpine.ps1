function Alpine
{
    . docker run -it --rm -v ${pwd}:/src -w /src node:8.8.0-alpine /bin/sh
}