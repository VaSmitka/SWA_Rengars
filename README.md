# SWA_Rengars
CVUT FEL SWA semestral project

## Tested on
* Docker desktop 3.3.3
* Engine 20.10.6
* Compose 1.29.1

## Run
1. Clone repository with all subrepositories
1. docker-compose build
1. docker-compose up

## PHPAdmin
| | |
|-|-|
|URL | http://localhost:8087 |
|Server | mysql |
|User | root |
|Password | root |

## Postgres
------------ | -------------
Host | postgres
Port | 5432
Database | swa_statistics
Username | swa_user
Password | swa_password

## pgAdmin
------------ | -------------
URL | http://localhost:8081
Email | user@swa.com
Password | swa_password

## MongoDB CLI
> mongo -u swa_root -p swa_password
*  Marketplace service
> use swa_marketplace
* Notification service
> use swa_notification

## RabbitMQ
------------ | -------------
URL | http://localhost:15672
User | guest 
Password | guest

## Eureka
------------ | -------------
URL | http://localhost:8761
Repository | https://github.com/agilehorse/rengars_eureka

## Users service
------------ | -------------
Repository | https://github.com/uhel97/swa-rengars-user-service
Swagger UI | http://localhost:8090/swagger-ui.html
Actuators |

## Markerplace service
------------ | -------------
Repository | https://github.com/agilehorse/rengars_marketplace
Swagger UI | http://localhost:8085/ui
Actuators |  http://localhost:8085/actuator/health, http://localhost:8085/actuator/info

## Statistics service
------------ | -------------
Repository | https://github.com/VaSmitka/Marketplace-Statistics
Swagger UI | http://localhost:8083/docs
Actuators | http://localhost:8083/health, http://localhost:8083/info, http://localhost:8083/metrics

## Notification service
------------ | -------------
Repository | https://github.com/strazovan/swa-rengars-notificator
Swagger UI | http://localhost:8084/swagger-ui.html
Actuators | http://localhost:8084/actuator/health, http://localhost:8084/actuator/info
