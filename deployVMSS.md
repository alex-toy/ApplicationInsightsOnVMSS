Deploy the App to VMSS Instance
=

1. Run the **commands\steps.ps1** to create the VMSS and related resources.

2. List the connection information of the VMSS instances.
```
az vmss list-instance-connection-info \
--resource-group myResourceGroup \
--name udacity-vmss
```
The output will be like:
```
{
    "instance 0": "52.151.44.227:50000",
    "instance 1": "52.151.44.227:50001"
}
```
The 52.151.44.227 is the public IP of the load balancer. 
Port 50000 is one of the ports connecting the load balancer to one of the instances

3. Log in to the VMSS instance using one of the port numbers, using the ssh commands provided to you in the command line.

4. Once you log in successfully in your instance, install Python and update pip. By default, it will have Python 2 installed without pip.
```
sudo apt update
sudo apt install python3.7
python3 --version
sudo apt install python3-pip
sudo -H pip3 install --upgrade pip
```

5. Install and start the Redis server. It is the backend of your application.
```
wget https://download.redis.io/releases/redis-6.2.4.tar.gz
tar xzf redis-6.2.4.tar.gz
cd redis-6.2.4
sudo apt install make
sudo apt install make-guile
make
```


6. Ping your Redis server to verify if it is running. It will return "PONG". The server will start after make. 
```
src/redis-server
```
Otherwise, use :
```
redis-cli ping
```


7. Frontend starter code:
```
cd
git clone https://github.com/udacity/azure-voting-app-redis.git
cd azure-voting-app-redis/
git checkout Deploy_to_VMSS
```

8. Install dependencies
```
cd /home/udacityadmin/redis-6.2.4/azure-voting-app-redis
sudo apt install python-pip
pip install -r requirements.txt
pip uninstall flask && python -m pip install flask
```


9. Finally, run the app:
```
cd azure-vote/
python3 main.py
```

Copy the VMSS public IP address and test your application in the browser.