@echo off

REM mevcut container ve image'leri sil
echo Cleaning up existing containers and images...
docker stop print_value_container 2>nul
docker rm print_value_container 2>nul
docker rmi print_value_image 2>nul

docker stop decrease_value_container 2>nul
docker rm decrease_value_container 2>nul
docker rmi decrease_value_image 2>nul

docker stop increase_value_container 2>nul
docker rm increase_value_container 2>nul
docker rmi increase_value_image 2>nul

REM mevcut hacmi sil ve yeniden oluştur
echo Checking for existing volume...
docker volume rm my_volume 2>nul
docker volume create my_volume

REM print_value için işlemler
echo Starting print_value operations...
docker build -t print_value_image ./print_value
docker run -d --name print_value_container -v my_volume:/app/data print_value_image

REM decrease_value için işlemler
echo Starting decrease_value operations...
docker build -t decrease_value_image ./decrease_value
docker run -d --name decrease_value_container -v my_volume:/app/data decrease_value_image

REM increase_value için işlemler
echo Starting increase_value operations...
docker build -t increase_value_image ./increase_value
docker run -d --name increase_value_container -v my_volume:/app/data increase_value_image

echo All operations completed.
