Docker Node SSL Debugger
========================

Get and run the code:

```
git clone https://github.com/rwoll/docker-node-ssl-debugger.git
cd docker-node-ssl-debugger
./verify_setup.sh
```

Then copy+paste the output in your issue report.

The script will ping URLs outside the container and then re-run inside a container.

## Expected Output

```
$ ./verify_setup.sh 
[CURL] Verifying URL: https://example.com/
[CURL] Status code: 200
[NODE] Fetched https://example.com/ - Status: 200
[CURL] Verifying URL: https://marketplace.visualstudio.com/_apis/public/gallery/publishers/github/vsextensions/copilot-chat/0.33.2025110604/vspackage
[CURL] Status code: 200
[NODE] Fetched https://marketplace.visualstudio.com/_apis/public/gallery/publishers/github/vsextensions/copilot-chat/0.33.2025110604/vspackage - Status: 200
=== [DOCKER] Running in Docker environment ===
sha256:3ce3ad87ad5ea4761bf47bd429f7825702160135b34eced55b540502684fbec8
[CURL] Verifying URL: https://example.com/
[CURL] Status code: 200
[NODE] Fetched https://example.com/ - Status: 200
[CURL] Verifying URL: https://marketplace.visualstudio.com/_apis/public/gallery/publishers/github/vsextensions/copilot-chat/0.33.2025110604/vspackage
[CURL] Status code: 200
[NODE] Fetched https://marketplace.visualstudio.com/_apis/public/gallery/publishers/github/vsextensions/copilot-chat/0.33.2025110604/vspackage - Status: 200
```