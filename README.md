# Script Details
1. Installs docker (Ubuntu)
2. Takes input for plex token > adds to docker-compose.yml
3. Takes input for real-debrid token > adds to config.yml
4. Runs docker containers
5. Attaches to plex_debrid for guided setup

Tested Ubuntu 24.04

# Setup
>git clone https://github.com/Dyl459/plex_debrid_zurg-docker/ && cd plex_debrid_zurg-docker && sudo chmod +x script.sh && sudo ./script.sh

## Plex Setup
1. Open [IP]:32400
2. Add Movies/Films library, folder /movies
3. Add TV Shows library, folder /tv

## Plex Debrid Setup
1. Follow plex_debrid guided setup (select plex where relevant)
   - Enter real-debrid API token when prompted, this allows plex_debrid to add torrents.
   - Server address may not work as http://localhost:32400, use http://127.0.0.1:32400 or the internal IP of the host.
   - Select the two libraries created above
   - Obtain Plex user token as per instructions at https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/


