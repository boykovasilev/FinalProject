curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $1"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/bobn3n/testrepo/keys \
  -d '{"title":"dev","key":"'"$(cat ~/.ssh/id_rsa.pub)"'","read_only":true}'