

setup_app(){

    export APP_ROOT="${HOME}"
    export ALERT_MANGER_FLAGS="${ALERT_MANAGER_FLAGS:-}"
    export ENABLE_CLUSTER_MODE="${ENABLE_CLUSTER_MODE:-false}"
    export CLUSTER_LISTEN_ADDRESS="${CLUSTER_LISTEN_ADDRESS:-}"
    export EXTERNAL_DOMAIN=${EXTERNAL_DOMAIN:-$(jq -r '.uris[0]' <<<"${VCAP_APPLICATION}")}
}

replace_vars(){

    env | while IFS='=' read -r key val; do
            if grep -q "\\\${$key}" "${APP_ROOT}/alertmanager.yml" > /dev/null 2>&1
            then
                if echo ${val} | grep -q http
                then 
                    val=$(perl -ne 'print quotemeta($_)' <<< ${val})
                    val=${val::-1}
                fi
                sed -i 's@${'"${key}"'}@'"${val}"'@g' "${APP_ROOT}/alertmanager.yml"
            fi
        done
}

main(){
    setup_app
    replace_vars
}

main