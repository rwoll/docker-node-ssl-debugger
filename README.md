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
sha256:3ce3ad87ad5ea4761bf47bd429f7825702160135b34eced55b540502684fbec8
=== [DOCKER] Running WITH NODE_EXTRA_CA_CERTS ===
[CURL] Verifying URL: https://example.com/
[CURL] Status code: 200
[NODE] Fetched https://example.com/ - Status: 200
[CURL] Verifying URL: https://marketplace.visualstudio.com/_apis/public/gallery/publishers/github/vsextensions/copilot-chat/0.33.2025110604/vspackage
[CURL] Status code: 200
[NODE] Fetched https://marketplace.visualstudio.com/_apis/public/gallery/publishers/github/vsextensions/copilot-chat/0.33.2025110604/vspackage - Status: 200
=== [DOCKER] Running WITHOUT NODE_EXTRA_CA_CERTS ===
[CURL] Verifying URL: https://example.com/
[CURL] Status code: 200
[NODE] Error fetching https://example.com/: TypeError: fetch failed
    at node:internal/deps/undici/undici:14902:13
    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)
    at async file:///app/fetch.mjs:3:22 {
  [cause]: Error: unable to get local issuer certificate
      at TLSSocket.onConnectSecure (node:_tls_wrap:1697:34)
      at TLSSocket.emit (node:events:519:28)
      at TLSSocket._finishInit (node:_tls_wrap:1095:8)
      at ssl.onhandshakedone (node:_tls_wrap:881:12) {
    code: 'UNABLE_TO_GET_ISSUER_CERT_LOCALLY'
  }
}
[CURL] Verifying URL: https://marketplace.visualstudio.com/_apis/public/gallery/publishers/github/vsextensions/copilot-chat/0.33.2025110604/vspackage
[CURL] Status code: 200
[NODE] Fetched https://marketplace.visualstudio.com/_apis/public/gallery/publishers/github/vsextensions/copilot-chat/0.33.2025110604/vspackage - Status: 200
```

