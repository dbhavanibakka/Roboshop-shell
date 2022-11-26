echo -e "\e[36minstall the nginx\e[0m"
yum install nginx -y

echo -e "\e[31menable the nginx\e[0m"
systemctl enable nginx

echo -e "\e[32mstart the nginx\e[0m"
systemctl start nginx

echo -e "\e[33mdownload the nginx\e[0m"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

cd /usr/share/nginx/html
rm -rf *

echo -e "\e[34frontendunzip\e[0m"
unzip -o /tmp/frontend.zip

mv frontend-main/static/* .
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf

echo -e "\e[35restart the nginx\e[0m"
systemctl restart nginx
