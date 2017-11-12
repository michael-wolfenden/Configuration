function Ubunutu
{
    . docker run -it --rm -v ${pwd}:/src -w /src node:8.8.0 /bin/bash
}