# README

Repositorio del ejercicio PCI Laboratorio Web Service

# Requerimientos


    Ruby 2.4+ recommended
    Mongodb
    Rails 5
    Rspec
 
 # Pruebas unitarias.
 
 Para correr las pruebas de integración se pueden ejecutar de la siguiente manera:
 
 rspec spec spec/models/card.rb
 
 # Pruebas de integración.
 
 Para correr las pruebas de integración se pueden ejecutar de la siguiente manera:
 
 rspec spec spec/controllers/log_controller.rb
 rspec spec spec/controllers/transaction_controller.rb
 
# Ejecución con cURL

El servidor recibe 2 peticiones:

1) log.- Enviando los datos de la tarjeta retorna un token serializado.
2) execute.- Enviando el token obtiene los datos de la tarjeta para su uso en pagos.

Ejemplo log:
curl --data "name_card=%20Fernando%20&number_bin=123&number_card=411111111111111&expiration_date=%2020/18%20&schema=%20DEBIT%20&mark_card=%20MasterCard%20"  https://pcitestjob.herokuapp.com/log

Ejemplo execute:
curl --data "token=eyJhbGciOiJIUzI1NiJ9.eyJpZCI6IjViYjMxNmY3NWVhMmViMDAwNDRiZmVmOSIsImV4cCI6MTUzODU0OTg3OX0.bbjg5O0A5sEaEsSBNZF23KMswLyyi_gohqEHLUScJIE"  https://pcitestjob.herokuapp.com/execute

El último ejemplo debe de enviar el token correcto, solo es valido durante 10 mins.

Servidor de pruebas montado en Heroku
