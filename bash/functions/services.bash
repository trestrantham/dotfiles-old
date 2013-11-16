start() {
  case "$1" in
    mysql)
      mysql.server start
      ;;
    postgresql)
      pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
      ;;
    mongo)
      mongod run --config /usr/local/etc/mongod.conf
      ;;
    redis)
      redis-server /usr/local/etc/redis.conf
      ;;
    sunspot-solr)
      rake sunspot:solr:start
      ;;
    memcached)
      /usr/local/bin/memcached -d
      ;;
    elasticsearch)
      elasticsearch -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml
      ;;
  esac
}

stop() {
  case "$1" in
    mysql)
      mysql.server stop
      ;;
    postgresql)
      pg_ctl -D /usr/local/var/postgres stop -s -m fast
      ;;
    mongo)
      /usrr/local/bin/mongo --nodb --eval "connect('localhost:27017/admin').shutdownServer()"
      ;;
    redis)
      killall -SIGTERM redis-server
      ;;
    sunspot-solr)
      rake sunspot:solr:stop
      ;;
  esac
}
