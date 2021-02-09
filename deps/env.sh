

setup_app(){

    export APP_ROOT="${HOME}"
    export ALERT_MANGER_FLAGS="${ALERT_MANAGER:-}"
    export ENABLE_CLUSTER_MODE="${ENABLE_CLUSTER_MODE:-false}"
    export CLUSTER_LISTEN_ADDRESS="${CLUSTER_LISTEN_ADDRESS:-}"
}

main(){
    setup_app
}

main