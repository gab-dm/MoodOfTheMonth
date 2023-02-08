sudo fuser -k 5432/tcp

mkdir /data //dans un fichier accessible en écriture
sudo docker run --name postgresql -e POSTGRES_USER=myusername -e POSTGRES_PASSWORD=mypassword -p 5432:5432 -v ~/Documents/MoodOfTheMonth/data:/var/lib/postgresql/data -d postgres
sudo docker rm $(sudo docker ps -aq)
sudo netstat -peanut
sudo netstat -peanut | grep 5432
