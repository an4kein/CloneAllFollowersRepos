# CloneAllFollowersRepos

Após o download de todos os repositórios de cada seguidor, é possível realizar um filtro minucioso por tokens, chaves RSA, senhas, endpoints, arquivos confidenciais e backups, entre outros dados sensíveis. A criatividade é o seu limite; utilize e explore essa riqueza de informações ao máximo.


`find /home/EduardoBarbosa/recon/EMPRESA/seguidores/ -maxdepth 1 -type d \( ! -name . \) -exec sh -c 'trufflehog filesystem --json "$1" > "/home/EduardoBarbosa/recon/EMPRESA/results-seguidores/$(basename "$1").json"' _ {} \;`
