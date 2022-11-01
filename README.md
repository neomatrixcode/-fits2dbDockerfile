# fits2dbDockerfile


docker run --rm -it -v C:\Users\Neomatrix\Desktop\data:/data -w /data neomatrixcode/fits2db bash

```bash
fits2db --debug true --sql=postgres --create *.fits

for i in *.sql; do
    [ -f "$i" ] || break
    cat "$i" | psql "postgresql://username:password@host/dbname"
done
```

Image in Docker hub
https://hub.docker.com/repository/docker/neomatrixcode/fits2db
