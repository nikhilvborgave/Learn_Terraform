#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "y" | ufw enable
sudo ufw allow 22
sudo ufw allow 80

cat <<EOF > /var/www/html/index.html
<html>
  <head><title>My Terraform Project1</title></head>
  <body>
    <h1>Deployed via Terraform + User Data </h1>
  </body>
</html>
EOF