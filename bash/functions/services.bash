start() {
  case "$1" in
    mysql)
      # mysql.server start
      brew services start mysql
      ;;
    postgresql)
      # pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
      # brew services start postgres
      launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
      ;;
    mongo)
      mongod run --config /usr/local/etc/mongod.conf
      ;;
    redis)
      # redis-server /usr/local/etc/redis.conf
      brew services start redis
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
      # mysql.server stop
      brew services stop mysql
      ;;
    postgresql)
      # pg_ctl -D /usr/local/var/postgres stop -s -m fast
      brew services stop postgres
      ;;
    mongo)
      /usrr/local/bin/mongo --nodb --eval "connect('localhost:27017/admin').shutdownServer()"
      ;;
    redis)
      # killall -SIGTERM redis-server
      brew services stop redis
      ;;
    sunspot-solr)
      rake sunspot:solr:stop
      ;;
  esac
}
