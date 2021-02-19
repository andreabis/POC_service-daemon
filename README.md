# POC_service-daemon

Il processo corretto  contenuto in POC2, ed è composto da 4 file

cpu_usage_controller rappresentà l'unit file e contiene i percorsi dei file e le varie impostazioni del servizio. Future work: aggiungere un file di environment invece che usare il restart con un time fisso

test_cpu_usage è lo script che viene runnato dal controllore e che salva effettivamente i dati nel file di log sotto /var/log/test_cpu_usage/log.txt 

# Installazione e start
copiare POC2 in locale e entrare nella cartella.

per far partire il servizio: eseguire dare i permssi si esecuzione al file installation_script e poi eseguirlo con
"sudo ./installation_script.sh" 
"systemctl start cpu_usage_controller" Usate sudo se non volete reinserire la password
Questo file di installazione ripulisce eventuali file già presenti come log o il controllore, quindi attenzione perchè è un comando distruttivo.


# Checking status e log

Per vedere lo status usare il comando 
"systemctl status cpu_usage_controller.service"
Per fermarlo o farlo ripartire sostituire status nel comando precedente con "start" o "stop"

Per visualizzare i log basta far riferimento al file di log /var/log/test_cpu_usage/log.txt 

# Unistall 

Per disinstallare dalla dentro la cartella POC2 eseguire il comando come root, dategli i permessi di esecuzione
"sudo ./unistall.sh" 

Verranno rimossi tutti i file legati al servizio, log compresi