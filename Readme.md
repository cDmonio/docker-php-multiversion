# Running Multiple PHP Versions Simultaneously with Docker

This repository allows you to run multiple versions of PHP simultaneously using Docker. In addition to PHP, we provide containers for MYSQL, Composer, and Node.js.

## Setup Instructions

### Adding a Fake Domain to the Hosts File

You have the option to add a fake domain to your hosts file.

#### Inside Containers

**Database:**

You can copy scripts to the `./scripts` directory.

1. Access the MySQL container:
   ```
   docker exec -it mysql bash
   ```

2. Login to MySQL:
   ```
   mysql -u root -p
   ```

3. Import a database without logging in:
   a. Change to the `docker-entrypoint-initdb.d` directory:
      ```
      cd docker-entrypoint-initdb.d
      ```
   b. Run the following command to import a database from a script file:
      ```
      mysql -u root -p DATABASE < script.sql
      ```

**PHP:**

To access a specific PHP container, use a command like the following:
```
docker exec -it php7.3 bash
```

- To run PHP scripts, use the `php` command followed by the script name (e.g., `php script.php`).
- Install Composer by running:
  ```
  composer install
  ```
- To use Laravel's Artisan commands, run:
  ```
  php artisan
  ```

**NGINX:**

Navigate to the `./nginx/conf.d/` directory and copy or edit the `default.conf` file. Replace occurrences of `yourdomain.test` with an IP address or domain name and the version of PHP you are using (e.g., `php7.2`, `php7.3`, `php7.4`, `php8.2`).

- Update the `fastcgi_pass` directive in the config file to point to the corresponding PHP container (e.g., `fastcgi_pass php7.4:9000`).

After making changes, you can check the NGINX configuration with:
```
docker exec -it nginx nginx -t
```

If the configuration is correct, reload NGINX with:
```
docker exec -it nginx nginx -s reload
```

#### Managing Hosts File (Linux and Windows)

To add the fake domain `.test` to your hosts file, follow these steps:

**Linux (as admin/sudo):**

1. Open the hosts file in a text editor (e.g., Nano):
   ```
   sudo nano /etc/hosts
   ```

2. Add the following line to the file:
   ```
   127.0.0.1 yourdomain.test
   ```

3. Save and exit the editor.

**Windows:**

1. Open the hosts file located at `C:\WINDOWS\System32\drivers\etc\hosts` using any text editor. You may need administrative privileges to edit this file.

2. Add the following line to the file:
   ```
   127.0.0.1 yourdomain.test
   ```

3. Save the file.
