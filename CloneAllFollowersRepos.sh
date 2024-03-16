export GITHUB_TOKEN=your_token
followers=$(curl -H "Authorization: Bearer $GITHUB_TOKEN" -s "https://api.github.com/users/EMPRESA/followers?per_page=100" | jq -r '.[].login')

for follower in $followers; do
  echo "Clonando repositórios do usuário $follower"
  repos=$(curl -H "Authorization: Bearer $GITHUB_TOKEN" -s "https://api.github.com/users/$follower/repos?per_page=100&type=public" | jq -r '.[].clone_url')
  for repo in $repos; do
    git clone "$repo"
  done
done
