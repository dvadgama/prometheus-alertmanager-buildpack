# **Prometheus Alertmanager Buildpack**

This build pack deploys the specified version of Prometheus Alertmanager to your cloud foundry and, it is designed to work with GDS PaaS 

## **Features**
- It can install user specified version of Alertmanager

## **Example manifest.yml**

```yaml
---
applications:
  - buildpacks:
      - https://github.com/uktrade/prometheus-alertmanager-buildpack.git
```

cf v2 command
```bash
cf push 
```

cf v3 command
```bash
cf v3-push -b https://github.com/uktrade/prometheus-alertmanager-buildpack.git
```

*use **https://github.com/uktrade/prometheus-alertmanager-buildpack.git#dev** to deploy dev version*

## **Configu variables**

| Variable                | Default Value |
|:------------------------|:--------------|
| $ALERT_MANGER_FLAGS     | ""            |
| $ENABLE_CLUSTER_MODE    | false         |
| $CLUSTER_LISTEN_ADDRESS | ""            |
| $EXTERNAL_DOMAIN        | first url value in VCAP_APPLICATION |

## **Custom Config Files**
- **runtime.txt**: User can specify the version of Grafana that needs to be installed , current default version is 6.3.5

- **alertmanager.yml**: User can supply their own config file and use it with variable ( you must supply value for all environment variable specified in config file)

## Todo
- Make it work in cluster mode