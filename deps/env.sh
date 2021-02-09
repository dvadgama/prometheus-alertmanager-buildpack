

setup_app(){

    export APP_ROOT="${HOME}"
    export ALERT_MANGER_FLAGS="${ALERT_MANAGER_FLAGS:-}"
    export ENABLE_CLUSTER_MODE="${ENABLE_CLUSTER_MODE:-false}"
    export CLUSTER_LISTEN_ADDRESS="${CLUSTER_LISTEN_ADDRESS:-}"
    export EXTERNAL_DOMAIN=${EXTERNAL_DOMAIN:-$(jq -r '.uris[0]' <<<"${VCAP_APPLICATION}")}
}

main(){
    setup_app
}

main