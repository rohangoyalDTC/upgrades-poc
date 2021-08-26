while [[  "1" == "1" ]]
do
echo `curl -s --location --request GET 'localhost:80/ssai/preplay' \
--header 'x-auth-ssai-endpoint: eC1hdXRoLXNzYWktZW5kcG9pbnQ=' \
--data-raw ''`
date
done