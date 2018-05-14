FROM couchdb

RUN curl -X PUT http://127.0.0.1:5984/_users

RUN curl -X PUT http://127.0.0.1:5984/_replicator

RUN curl -X PUT http://127.0.0.1:5984/_global_changes

RUN curl -X PUT http://localhost:5984/_users/org.couchdb.user:$ADMIN_NAME \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"name": "jan", "password": "'"$ADMIN_SECRET"'", "roles": [], "type": "user"}'

EXPOSE 5984