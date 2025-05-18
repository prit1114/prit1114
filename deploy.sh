#!/bin/bash

# 1. Navigate to app directory
cd /home/ec2-user/app || exit

# 2. Remove previous deployment (if exists)
rm -rf ./*  # Clears the directory except hidden files

# 3. Unzip the new build
unzip -o /home/ec2-user/application.zip -d /home/ec2-user/app/

# 4. Install dependencies (if needed)
# For Node.js apps:
npm install --production

# For Python apps:
# pip3 install -r requirements.txt

# 5. Restart services
# Example for a Node.js app running with PM2:
# pm2 restart all

# 6. Set proper permissions
chown -R ec2-user:ec2-user /home/ec2-user/app
chmod -R 755 /home/ec2-user/app

# 7. Optional: Restart web server if needed
sudo systemctl restart httpd  # For Apache
# sudo systemctl restart nginx  # For Nginx
