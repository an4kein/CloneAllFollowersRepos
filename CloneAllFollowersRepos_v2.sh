export GITHUB_TOKEN=your_token
followers=$(curl -H "Authorization: Bearer $GITHUB_TOKEN" -s "https://api.github.com/users/Minutrade/followers?per_page=100" | jq -r '.[].login')

for follower in $followers; do
  echo "Clonando repositórios do usuário $follower"
  mkdir -p "$follower" # Cria uma pasta para o seguidor
  cd "$follower" || exit # Muda para a pasta do seguidor, ou sai se falhar
  repos=$(curl -H "Authorization: Bearer $GITHUB_TOKEN" -s "https://api.github.com/users/$follower/repos?per_page=100&type=public" | jq -r '.[].clone_url')
  for repo in $repos; do
    git clone "$repo"
  done
  cd .. # Retorna para o diretório pai
done
