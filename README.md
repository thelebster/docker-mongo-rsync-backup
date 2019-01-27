# Mongo Backup

Allows to run mongdb + rsync as a separate backup service via cron.

Copy `example.env` to `.env`.

```
cp example.env .env
```

Replace with a real credentials.
```
MONGODB_DATABASE=mongo
MONGODB_HOST=127.0.0.1
MONGODB_PORT=27017
MONGODB_USERNAME=root
MONGODB_PASSWORD=password
MONGODB_AUTH_DATABASE=admin
```

Check the https://crontab.guru to find more crontab expressions.

Create a private key
```
touch private-key

chmod 400 private-key
```
