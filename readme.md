Build image: 
`docker build -t engie_merit_order:latest .`

Run image: 
`docker run -p 8888:8888 engie_merit_order`

From the terminal : 
`curl -X POST -H "Content-Type: application/json" -d @payload1.json http://localhost:8888/productionplan`
`curl -X POST -H "Content-Type: application/json" -d @payload2.json http://localhost:8888/productionplan`
`curl -X POST -H "Content-Type: application/json" -d @payload3.json http://localhost:8888/productionplan`

Output : 

(gl-env) lio@MacBook-Pro-de-lionel engie % curl -X POST -H "Content-Type: application/json" -d @payload1.json http://localhost:8888/productionplan
{"gasfiredbig1":124.5,"gasfiredbig2":243.8,"windpark1":90.0,"windpark2":21.5}
(gl-env) lio@MacBook-Pro-de-lionel engie % curl -X POST -H "Content-Type: application/json" -d @payload2.json http://localhost:8888/productionplan
{"gasfiredbig1":236.2,"gasfiredbig2":243.8,"windpark1":0.0,"windpark2":0.0}
(gl-env) lio@MacBook-Pro-de-lionel engie % curl -X POST -H "Content-Type: application/json" -d @payload3.json http://localhost:8888/productionplan
"Required demand can not be met, load: 910 total_power: 681.7"
(gl-env) lio@MacBook-Pro-de-lionel engie %
