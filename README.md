A Static Site Generating CMS Thingy
====================================

## Getting up and running with [Docker](https://www.docker.com/)
1. Run `docker-compose up` and wait until the container is up and rails has started, this should be the terminal output:

    ```
    db_1   | 2019-02-17 15:11:35.130 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
    db_1   | 2019-02-17 15:11:35.131 UTC [1] LOG:  listening on IPv6 address "::", port 5432
    db_1   | 2019-02-17 15:11:35.138 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
    db_1   | 2019-02-17 15:11:35.335 UTC [26] LOG:  database system was shut down at 2019-02-17 14:45:09 UTC
    db_1   | 2019-02-17 15:11:35.380 UTC [1] LOG:  database system is ready to accept connections
    ```

    ```
    app_1  | => Booting Puma
    app_1  | => Rails 5.1.4 application starting in development 
    app_1  | => Run `rails server -h` for more startup options
    app_1  | Puma starting in single mode...
    app_1  | * Version 3.10.0 (ruby 2.4.0-p0), codename: Russell's Teapot
    app_1  | * Min threads: 5, max threads: 5
    app_1  | * Environment: development
    app_1  | * Listening on tcp://0.0.0.0:3000
    app_1  | Use Ctrl-C to stop
    ```

2. Now, in a new terminal, run `docker-compose run app rake db:create && docker-compose run app rake db:migrate` then wait for the migration to complete
3. Head over to `localhost:3000/portfolios`