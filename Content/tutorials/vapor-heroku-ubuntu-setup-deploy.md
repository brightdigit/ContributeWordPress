---
date: 2019-03-19 07:51
---
It can be a real challenge [picking the right back
end](https://share.transistor.fm/s/ffcb9fc1?utm_source=learning-swift&utm_medium=web)
for your mobile app. For instance, Swift developers don\'t have anything
without needing to run on another language. Therefore, I decided to do
[a review of
Vapor](https://learningswift.brightdigit.com/vapor-swift-backend-review/?utm_medium=web&utm_source=learning-swift)
and whether it is really a right choice.

**What I found was that for Swift developers,**
[**Vapor**](https://vapor.codes) **is a really great choice and fairly
easy to work with**. In addition, Vapor has an effective community and a
great API if your development team is dedicated to Swift. Therefore,
rather than having your team hop from Xcode and Swift to VSCode or
Firebase etc\...

In this article I am going to cover how to get started, specifically:

-   **[Setup your Mac for Vapor Development](#macos-dev)**
-   Convert your project to **[use PostgreSQL
    Database](#macos-postgresql)**
-   Modify your project for **[Heroku Deployment](#heroku-vapor)**
-   Prepare an **[Ubuntu Server for Vapor](#ubuntu-vapor)**
-   Modify your project for **[Ubuntu deployment](#ubuntu-code)**

As a result, you\'ll have fully working backend with Postgres ready and
easily deployable.

::: {#mc_embed_signup}
::: {#mc_embed_signup_scroll}
## Want to Learn More? Get the Full Guide and Video Mini-Course Today

::: {.indicates-required}
[\*]{.asterisk} indicates required
:::

::: {.mc-field-group}
Email Address [\*]{.asterisk}
:::

::: {.mc-field-group}
First Name [\*]{.asterisk}
:::

::: {.mc-field-group}
Last Name [\*]{.asterisk}
:::

::: {.mc-field-group .input-group style="display:none"}
-   Swift
-   Productivity
-   Vapor
:::

::: {.mc-field-group .input-group style="display:none"}
**Products**

-   Speculid
:::

::: {#mergeRow-gdpr .mergeRow .gdpr-mergeRow .content__gdprBlock .mc-field-group}
::: {.content__gdpr}
Marketing Permissions

Please select all the ways you would like to hear from BrightDigit:

Email

You can unsubscribe at any time by clicking the link in the footer of
our emails. For information about our privacy practices, please visit
our website.
:::

::: {.content__gdprLegal}
We use Mailchimp as our marketing platform. By clicking below to
subscribe, you acknowledge that your information will be transferred to
Mailchimp for processing. [Learn more about Mailchimp\'s privacy
practices here.](https://mailchimp.com/legal/)
:::
:::

::: {#mce-responses .clear}
::: {#mce-error-response .response style="display:none"}
:::

::: {#mce-success-response .response style="display:none"}
:::
:::

::: {style="position: absolute; left: -5000px;" aria-hidden="true"}
:::

::: {.clear}
:::
:::
:::

## Setting Up Your Mac For Vapor Development {#macos-dev}

In order to start developing a Vapor application, we'll need to setup
our Mac. According to the Vapor docs, **you need Xcode 9.3 or greater**.
However for this tutorial, I used the latest version of macOS and Xcode
at the time of writing:

-   macOS **Mojave 10.14.3**
-   Xcode **10.1**

### Prerequisites For Vapor

I also have installed **[Homebrew](https://brew.sh/)**. To install
Homebrew, open your terminal application and type:

``` {.wp-block-code}
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
```

For more details you can go to **[the official Homebrew home
page](https://brew.sh/)**.

### Installing Vapor

Once you have Homebrew installed we can go ahead and install **Vapor**
on your Mac. Before we proceed, we'll need to add the Vapor repository
to Homebrew.

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=yYCxa6ev1Ng
:::

1.  Firstly, **add the Vapor repository** using the `tap` command:

``` {.wp-block-code}
brew tap vapor/tap
```

2.  Next, **install the Vapor toolkit**:

``` {.wp-block-code}
brew install vapor/tap/vapor
```

As a result of installing the Vapor toolkit, **we'll have access to the
Vapor CLI tool**. Therefore, you can get access to the list of commands
available by typing:

``` {.wp-block-code}
vapor --help
```

For example, **with the Vapor CLI tool**, you can:

-   **Build** the application
-   **Run** the application
-   setup for **Heroku** deployment later
-   Create the **Xcode** project and of course\...
-   Create the **new** Swift package

### Creating Your First Vapor Project

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=iZqHmFnisXQ
:::

Therefore, **we can create the Switch package which will contain the
dependencies needed to run our server application** with the command:

``` {.wp-block-code}
vapor new app-collection
```

Additionally, **we can create an Xcode project** from our Vapor
application Swift package by typing:

``` {.wp-block-code}
vapor xcode
```

As a result, we can open the newly created Xcode project.

![Switching the target to
*Run*](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2019/03/macos_xcode_switch_target.jpg){.wp-image-514}

![Building and running the *Run*
target](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2019/03/macos_xcode_run.jpg){.wp-image-515}

::: {.wp-block-embed__wrapper}
https://www.youtube.com/watch?v=kZKP2MiFaLQ
:::

After that, switch the target in the top left to *Run* and press the
*play button* to run the application. Consequently, you should see a log
message at the bottom stating that a http server is started at port
8080.

As a result, go to the terminal and run the command:

``` {.wp-block-code}
curl http://localhost:8080/hello
```

Therefore, you should receive the message:

``` {.wp-block-code}
Hello, world!%
```

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=bRXTT8K-lP8
:::

In conclusion, we've successfully used the provided Vapor templates with
the *new* and *xcode* commands to create the Swift package and build the
application in Xcode. However the application only used SQLite for our
database storage. Instead, let's switch to using a more common database:
PostgreSQL.

## Setting Up For PostgreSQL {#macos-postgresql}

PostgreSQL has been my favorite relational SQL based database server. As
a result, we are going to look at converting the current Vapor project
to use PostgreSQL rather than the default SQLite.

Therefore, make sure you already have PostgreSQL installed.
Consequently, if you don't you can use Homebrew to install PostgreSQL
with the following command:

``` {.wp-block-code}
brew install postgresql
```

::: {.wp-block-embed__wrapper}
https://www.youtube.com/watch?v=KeLHTQrZXNI
:::

Further, to run the server from the Terminal:

``` {.wp-block-code}
pg_ctl -D /usr/local/var/postgres start
```

Similarly, you can stop the server from the Terminal with:

``` {.wp-block-code}
pg_ctl -D /usr/local/var/postgres stop
```

On the other hand, if you wish to run PostgreSQL as background service
with launchd you can use the
[`brew services`](https://github.com/Homebrew/homebrew-services)
command:

``` {.wp-block-code}
brew services start postgresql
```

Most importantly, once PostgreSQL is started, we'll need to add the
database and user for our application to use.

### Setup Database and User

As a result of switching the PostgreSQL, we'll need to add the user and
database our Vapor application will use. Therefore, let's run the
PostgreSQL terminal-based front-end
[`psql`](https://www.postgresql.org/docs/11/index.html) by going to the
Terminal and typing:

``` {.wp-block-code}
psql -d postgres
```

After that, at the `psql` prompt, create the database with:

``` {.wp-block-code}
create database app_collection;
```

Likewise, we need to create a user. To clarify, we are creating a user
with no password by typing:

``` {.wp-block-code}
create user app_collection;
```

Subsequently grant that user the privileges it needs with:

``` {.wp-block-code}
grant all privileges on database app_collection to app_collection;
```

::: {.wp-block-embed__wrapper}
https://www.youtube.com/watch?v=gmKSy71PxWM
:::

As a result, our database should be ready for access. However, we'll
need to update the code and specifically the Swift package to use
PostgreSQL.

### Updating the Code For PostgreSQL

#### Update Package.swift with PostgreSQL

In order to use PostgreSQL in our backend application, we'll need to
update the Package.swift file to use PostgreSQL as opposed to SQLite.

Therefore, open the Package.swift and update `dependencies` by changing
the line from:

``` {.wp-block-code}
.package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0")
```

to the line:

``` {.wp-block-code}
.package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0")
```

To clarify, we'll be using
[Fluent](https://docs.vapor.codes/3.0/fluent/getting-started/), Vapor's
ORM Framework, along with PostgreSQL. In other words, we are swapping
the Fluent driver for SQLite with the one for PostgreSQL. Likewise, if
you can read more details on the different drivers and how their setup
works in Fluent's documentation.

Consequently, we need to also update the *App targets* to use the new
*FluentPostgreSQL* dependency. Therefore change the line:

``` {.wp-block-code}
 .target(name: "App", dependencies: ["FluentSQLite", "Vapor"]),
```

to the line:

``` {.wp-block-code}
 .target(name: "App", dependencies: ["FluentPostgreSQL", "Vapor"]),
```

::: {.wp-block-embed__wrapper}
https://www.youtube.com/watch?v=j3Z1HxSMVWU
:::

In addition to updating the *Package.swift* file, we need to actually
update our Xcode project to use the new dependencies.

#### Update Packages

Therefore, in order to fetch and update the package with the new
dependencies and update the Xcode project file, we can run the *xcode*
command again with:

``` {.wp-block-code}
vapor xcode
```

As a result, vapor has fetched the Fluent PostgreSQL driver and updated
the Xcode project. Therefore, we can move forward by updating the code.

#### Update the Code

Consequently, open the update Xcode project. Since we have removed the
Fluent SQLite driver, we should no longer be able to build the project.
As a result we need update our models to use PostgreSQL as well as the
Provider, Database, and Migration used in our configuration. Therefore,
open the *configure.swift*.

Firstly, let's update the import at the top of the file from:

``` {.wp-block-code}
import FluentSQLite
```

to:

``` {.wp-block-code}
import FluentPostgreSQL
```

Secondly, update the provider by updating the line:

``` {.wp-block-code}
try services.register(FluentSQLiteProvider())
```

to

``` {.wp-block-code}
try services.register(FluentPostgreSQLProvider())
```

Further, update the database used by changing the line from:

``` {.wp-block-code}
// Configure a SQLite database
let sqlite = try SQLiteDatabase(storage: .memory)

// Register the configured SQLite database to the database config.
var databases = DatabasesConfig()
databases.add(database: sqlite, as: .sqlite)
services.register(databases)
```

to:

``` {.wp-block-code}
// Configure a PostgreSQL database
let postgreSQLConfig = PostgreSQLDatabaseConfig(hostname: "localhost", username: "app_collection")
let postgreSQL = PostgreSQLDatabase(config: postgreSQLConfig)

// Register the configured PostreSQL database to the database config.
var databases = DatabasesConfig()
databases.add(database: postgreSQL, as: .psql)
services.register(databases)
```

In other words, we are replacing the memory based SQLite database with
the PostgreSQL local database configured with the user name
*app_collection*.

To clarify, the [`PostgreSQLDatabaseConfig`
initializer](https://api.vapor.codes/postgresql/latest/PostgreSQL/Structs/PostgreSQLDatabaseConfig.html#/s:10PostgreSQL0A17SQLDatabaseConfigVACSS8hostname_Si4portSS8usernameSSSg8databaseAG8passwordAA0A13SQLConnectionC09TransportD0V9transporttcfc)
can multiple parameters in this case we are using the default port
number and the default database name which matches with user name, in
this case *app_collection*.

Lastly, in the *configuration.swift*, update the migration for the
`Todo` model. To clarify,
[migrations](https://docs.vapor.codes/3.0/fluent/migrations/) are used
to create and update the tables and relationships used by Fluent.
Therefore, in this case we just need to change the parameter in this
line:

``` {.wp-block-code}
migrations.add(model: Todo.self, database: .sqlite)
```

to this line:

``` {.wp-block-code}
migrations.add(model: Todo.self, database: .psql)
```

In the same vein, we need to change the subclasses used by our model by
opening *Todo.swift*. After that change the import statement at the top
again and then update model subclass from:

``` {.wp-block-code}
final class Todo: SQLiteModel {
```

to

``` {.wp-block-code}
final class Todo: PostgreSQLModel {
```

::: {.wp-block-embed__wrapper}
https://www.youtube.com/watch?v=EL98HVIzV9M
:::

As a result, we can go ahead and run the Vapor application.

### Run the Code

To sum up, now that have setup the PostgreSQL database on our machine,
update the Swift package dependencies, and updated the code accordingly;
we can build and run the Vapor application. Therefore, in Xcode, run the
*Run* target again. After that, let's go to the Terminal app to test the
application. For example we can run again:

``` {.wp-block-code}
curl http://localhost:8080/hello
```

However, we can also add a `Todo` item by running:

``` {.wp-block-code}
curl -X POST -H "Content-Type: application/json" -d '{"title": "example"}' http://localhost:8080/todos
```

Consequently, we can verify the `Todo` item was added by calling:

``` {.wp-block-code}
curl http://localhost:8080/todos
```

As a result, we get the JSON response:

``` {.wp-block-code}
[{"id":1,"title":"example"}]
```

Subsequently, let's deploy this to the cloud. Firstly, we'll look into
Heroku.

## Deploying Vapor to Heroku {#heroku-vapor}

In addition to setting up our application for PostgreSQL, we will move
forward with deploying it Heroku. Above all, Heroku offers the easiest
way to get up and running. In addition, it offers enough plugins and
services on its free tier that we can simply get started. Therefore,
let's begin by setting up our project for Heroku.

### Preparing Vapor Package For Heroku

Importantly, make sure you have an account setup at Heroku. After that,
go to the Terminal again, and in the project directory, we can simply
run the command:

``` {.wp-block-code}
vapor heroku init
```

As a result, of running the command, we have created a Heroku
application and added :

-   Created a Heroku application in your account then
-   Vapor buildpack for Heroku deployment
-   git remote for Heroku
-   Procfile needed for Heroku to run the application

The Procfile, which you read about in [the Procfile
documentation](https://devcenter.heroku.com/articles/procfile), contains
the following line:

``` {.wp-block-code}
web: Run serve --env production --port $PORT --hostname 0.0.0.0
```

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=8piDsDi6PNo
:::

Moreover when you run the command, you do not need the supply any
customizations. However we will need to add PostgreSQL to our Heroku
application.

### Adding PostgreSQL To Heroku Instance

Similarly, as we have setup the Vapor application in Heroku via the
Terminal, we need to add PostgreSQL to our application. Therefore, we
can add the Heroku repo and install the *heroku* command with Homebrew
by running:

``` {.wp-block-code}
brew tap heroku/brew && brew install heroku
```

Consequently, we can add PostgreSQL by running the command:

``` {.wp-block-code}
heroku addons:create heroku-postgresql:hobby-dev
```

As a result of running this command, we've added a [free *hobby* level
instance of
PostgreSQL](https://www.heroku.com/postgres#heroku-postgres-hobby) to
our application.

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=rprznYi-kKQ
:::

Consequently, Heroku will add an environment variable for the database
called `DATABASE_URL`. Therefore, we'll need to update our code to use
this.

### Update Code For Heroku PostgreSQL

Since we have added PostgreSQL to our Heroku instance, we need to update
our code to use the environment the variable for the new database url,
`DATABASE_URL`. Therefore, open the *configure.swift*. After that,
change the lines where we setup the database from:

``` {.wp-block-code}
let postgreSQLConfig = PostgreSQLDatabaseConfig(hostname: "localhost", username: "app_collection")
```

to:

``` {.wp-block-code}
let postgreSQLConfig : PostgreSQLDatabaseConfig
  
if let url = Environment.get("DATABASE_URL") {
  postgreSQLConfig = PostgreSQLDatabaseConfig(url: url)!
} else {
  postgreSQLConfig = PostgreSQLDatabaseConfig(hostname: "localhost", username: "app_collection")
}
```

::: {.wp-block-embed__wrapper}
https://www.youtube.com/watch?v=J7VILggBt0Q
:::

As a result of changing the code, we will be checking if there is an
environment variable called `DATABASE_URL`. In other words, we are using
the static
method[`Environment.get(_:)`](https://docs.vapor.codes/3.0/getting-started/services/#environment)
to fetch the string value if it exists. Secondly, if the variable
doesn't exist we assume this is being run locally and it uses the
default settings. To clarify, we are using an unconditional unwrapping
since we'd rather it trigger a runtime error than attempt to use the
default settings. Lastly, let's move forward with deploying our
application.

### Deploying Vapor Package to Heroku

Similarly, we can deploy the application to Heroku in the terminal with
one of two commands. Firstly, you can push directly with git using the
command:

``` {.wp-block-code}
git push heroku master
```

Secondly, you can push with the Vapor CLI command:

``` {.wp-block-code}
vapor heroku push
```

In short, either command will:

-   Firstly, push your code to the Heroku
-   Secondly, build the Application
-   Lastly, run the application (based on the command in the Procfile)

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=J0-wLRCarzc
:::

Therefore, if our application instance is called *damp-spire-56788* , we
should be call our application with `curl`:

``` {.wp-block-code}
> curl http://damp-spire-56788.herokuapp.com/hello
Hello, world!%
> curl -X POST -H "Content-Type: application/json" -d '{"title": "example"}' http://damp-spire-56788.herokuapp.com/todos
{"id":1,"title":"example"}%
> curl http://damp-spire-56788.herokuapp.com/todos 
[{"id":1,"title":"example"}]%
```

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=a0IJUTOJafo
:::

In short, we can setup our app for Heroku by

-   Firstly, using the Vapor CLI to setup the instance, build pack,
    Procfile, and git remote
-   Secondly, using setting up a PostgreSQL instance in Heroku
-   After that, updating the code to use the environment variable for
    the database url to access the Heroku PostgreSQL instance
-   Lastly, pushing the code to Heroku and testing the application

Similarly, now that we know how to deploy to Heroku, let's look at what
we need to do to setup our own Ubuntu server for hosting our Vapor
application.

## Setting Up Vapor For Ubuntu {#ubuntu-vapor}

In the same way, I showed how to setup our Vapor application for Heroku;
we are going to look at what is needed to setup an Ubuntu server. In
this case, we are using the latest LTS version of Ubuntu which is Bionic
Beaver 18.04. However, according to the
[documentation](https://docs.vapor.codes/3.0/install/ubuntu/), Vapor
does support version 14.04 (Trusty Tahr) and up including 18.10 (Cosmic
Cuttlefish).

### Installing Prerequisites

With a new server setup, we need to install several package. However,
first we need add Vapor's APT repo. Therefore, on the server (as root),
run the following command:

``` {.wp-block-code}
eval "$(curl -sL https://apt.vapor.sh)"
```

After that, we can proceed with installing the software we'll be using
to setup our server:

-   **git** - for fetching the code of our application
-   **nginx** - our http server
-   **postgresql** - our database server
-   **supervisor** - which is used to monitor and execute the
    application
-   **swift** and **vapor** - which is used to build and run the
    application

Therefore, we can install the application with:

``` {.wp-block-code}
apt install git supervisor postgresql swift vapor nginx
```

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=Ul4hL9vP06g
:::

### Setting Up the PostgreSQL Database

Similarly to how we use the `DATABASE_URL` on Heroku, we are going to
setup environment variables in Ubuntu.

#### Updating the Code {#ubuntu-code}

Therefore, open up Xcode and in our project go back to
`configure.swift`. After that, between the `import` statements but
before the `configure` function add a struct to store the defaults for
PostgreSQL:

``` {.wp-block-code}
public struct PostgresDefaults {
  public static let hostname = "localhost"
  public static let username = "app_collection"
  public static let port = 5432
}
```

To clarify, this struct stores the default host name, user name, and
port, we use for PostgreSQL configuration

Moreover change the line in the else statement from:

``` {.wp-block-code}
postgreSQLConfig = PostgreSQLDatabaseConfig(hostname: "localhost", username: "app_collection")
```

to:

``` {.wp-block-code}
let hostname = Environment.get("DATABASE_HOSTNAME") ?? PostgresDefaults.hostname
let username = Environment.get("DATABASE_USERNAME") ?? PostgresDefaults.username
let database = Environment.get("DATABASE_DATABASE")
let password = Environment.get("DATABASE_PASSWORD")

let port : Int

if let portString = Environment.get("DATABASE_PORT") {
  port = Int(portString) ?? PostgresDefaults.port
} else {
  port = PostgresDefaults.port
}

postgreSQLConfig = PostgreSQLDatabaseConfig(hostname: hostname, port: port, username: username, database: database, password: password, transport: .cleartext)
```

To sum up, this code fetches from the environment variables for the host
name, user name, database, password, and port. Consequently, if any
value is invalid or does not exist it falls back to the default setup in
the `PostgresDefaults` struct or null and let's the
`PostgreSQLDatabaseConfig` use its default value. Likewise, this code
will still work on Heroku (with the `DATABASE_URL`) and on localhost
with the defaults setup.

::: {.wp-block-embed__wrapper}
https://www.youtube.com/watch?v=xb3LNa_eADo
:::

However, before we setup the environment variables for our application,
we need to setup the database.

#### Add Database and User

Therefore, as root, sudo in as the `postgres` user and run `psql`:

``` {.wp-block-code}
sudo -u postgres psql
```

After that, run the following sql statements:

``` {.wp-block-code}
create database app_collection;
create user app_collection with encrypted password 'app_collection_pw';
grant all privileges on database app_collection to app_collection;
```

To clarify, we are creating:

-   database named *app_collection*
-   user named *app_collection* with a password *app_collection_pw*
-   grant the user all privileges on the database, we've created

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=hY1gOcB4XbE
:::

As a result of setting up the database, we can begin to setup
*supervisor*.

### Setting Up Supervisor

Since we are using supervisor, we are going to be setting up a Linux
user to run the actual application.

#### Adding a Linux User

As root user again, run the following command:

``` {.wp-block-code}
adduser app_collection
```

To clarify, we are setting up user called `app_collection` which does
not need any other metadata (Full Name, Room Number, etc\...). Therefore
having setup the user, let's pull and build the code.

#### Pulling Repo

Having setup the user in Linux, go ahead and super user in as the new
user:

``` {.wp-block-code}
su -l app_collection
```

After that, as the new user, clone the repo:

``` {.wp-block-code}
git clone https://github.com/brightdigit/swift-vapor-app-collection-sample.git app
```

Subsequently, go to the directory and build the application:

``` {.wp-block-code}
cd app
vapor build
```

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=RU3jJUe66uE
:::

In short, we have cloned the code from our repo and built the
application. As a result, we can move forward with configuring
supervisor.

#### Configuring Supervisor

While our application will serve our Rest API and *nginx* will proxy
that connection, *supervisor* will monitor and control the actual Vapor
application process. Therefore, let's create a configuration for our
Vapor application. In other words, as root, create a file here:

``` {.wp-block-code}
/etc/supervisor/conf.d/app_collection.conf
```

After that, paste this text into the configuration file:

``` {.wp-block-code}
[program:app_collection]
environment =
        DATABASE_PASSWORD="app_collection_pw",
command=vapor run --port=3000 --env=production
directory=/home/app_collection/app/ 
autorestart=true
user=app_collection             
stdout_logfile=/var/log/supervisor/%(program_name)-stdout.log
stderr_logfile=/var/log/supervisor/%(program_name)-stderr.log
```

To clarify:

-   the name of this process will be *program:app_collection*
-   we setup an environment variable for the database password
-   the command is to run Vapor from our code's directory
-   auto restart if the app fails
-   run as our new user
-   lastly, we have setup a path for the application output and errors

Subsequently, we can go ahead and update supervisor by with the
following commands:

``` {.wp-block-code}
supervisorctl reread
supervisorctl update
```

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=-dCqEE3L0nk
:::

After that, you can test if supervisor was successful by calling the
application from port 3000:

``` {.wp-block-code}
curl http://localhost:3000/hello
```

In short, we've setup our Vapor application in supervisor to run on port
3000 with a database password setup as an environment variable. As a
result, let's setup *nginx* to proxy our application.

### Setting Up Nginx

For our http server, we'll be using *nginx*. Most importantly, we'll be
setting up a host name for our application. Therefore, we are using the
nginxconfig.io to setup the config files. Consequently, you can download
[the specific *nginx*
configuration](https://nginxconfig.io/?0.domain=app_collection.local&0.redirect=false&0.https=false&0.php=false&0.proxy&0.proxy_pass=http:%2F%2Flocalhost:3000&0.root=false)
we are using from
[here](https://nginxconfig.io/?0.domain=app_collection.local&0.redirect=false&0.https=false&0.php=false&0.proxy&0.proxy_pass=http:%2F%2Flocalhost:3000&0.root=false "specific nginx configuration for our example").
In addition, feel free to change host name before downloading.

After that, unzip the file:

``` {.wp-block-code}
unzip nginxconfig.io-app_collection.local.zip
```

Firstly, we can, as root, move the files to their proper locations:

``` {.wp-block-code}
mv nginx.conf /etc/nginx/nginx.conf
mv sites-available/app_collection.local.conf /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/app_collection.local.conf /etc/nginx/sites-enabled
mv nginxconfig.io /etc/nginx/
```

Secondly, now that we have moved the configuration files over, restart
nginx:

``` {.wp-block-code}
service nginx restart
```

::: {.wp-block-embed__wrapper}
https://m.youtube.com/watch?v=qUrDtoHI-zw
:::

Most importantly, if you are using a `.local` host name, make sure to
setup the host name on your network. That is to say, make sure the host
name is accessible from your local development computer. For instance,
on macOS or Linux, you would need to edit [the `/etc/hosts`
file](https://en.wikipedia.org/wiki/Hosts_(file)). On the other hand, if
this is to be a public host name, verify you have updated your dns
accordingly.

After you have verified the dns or hosts file is updated, we can proceed
if testing the application out:

``` {.wp-block-code}
> curl http://app_collection.local/hello
Hello, world!%
> curl -X POST -H "Content-Type: application/json" -d '{"title": "example"}' http://app_collection.local/todos
{"id":1,"title":"example"}%
> curl http://app_collection.local/todos 
[{"id":1,"title":"example"}]%
```

In short, we've successfully setup the application on an Ubuntu server.

::: {#mc_embed_signup}
::: {#mc_embed_signup_scroll}
## Want to Learn More? Get the Full Guide and Video Mini-Course Today

::: {.indicates-required}
[\*]{.asterisk} indicates required
:::

::: {.mc-field-group}
Email Address [\*]{.asterisk}
:::

::: {.mc-field-group}
First Name [\*]{.asterisk}
:::

::: {.mc-field-group}
Last Name [\*]{.asterisk}
:::

::: {.mc-field-group .input-group style="display:none"}
-   Swift
-   Productivity
-   Vapor
:::

::: {.mc-field-group .input-group style="display:none"}
**Products**

-   Speculid
:::

::: {#mergeRow-gdpr .mergeRow .gdpr-mergeRow .content__gdprBlock .mc-field-group}
::: {.content__gdpr}
Marketing Permissions

Please select all the ways you would like to hear from BrightDigit:

Email

You can unsubscribe at any time by clicking the link in the footer of
our emails. For information about our privacy practices, please visit
our website.
:::

::: {.content__gdprLegal}
We use Mailchimp as our marketing platform. By clicking below to
subscribe, you acknowledge that your information will be transferred to
Mailchimp for processing. [Learn more about Mailchimp\'s privacy
practices here.](https://mailchimp.com/legal/)
:::
:::

::: {#mce-responses .clear}
::: {#mce-error-response .response style="display:none"}
:::

::: {#mce-success-response .response style="display:none"}
:::
:::

::: {style="position: absolute; left: -5000px;" aria-hidden="true"}
:::

::: {.clear}
:::
:::
:::

## And There\'s More\...

In conclusion, we've successfully:

-   setup our **Mac for developing** server-side Swift application using
    Vapor
-   converted the beginner template to **use PostgreSQL** from SQLite
-   updated the code to **use environment variables** for different
    server environments
-   setup and deployed the application to **Heroku**
-   setup and deployed to an **Ubuntu** server

Vapor will will reduce friction in your Swift development and has
effective community support. To get a full guide and video mini-course,
fill out [this form](http://eepurl.com/gku85T) and **let me know what
other Vapor topics** you are interested in learning more about such as:

-   setting up **complicated database models** and relationships
-   how to configure **advanced Rest API routes**
-   writing **complex queries using Fluent ORM** and Futures in Swift
-   setting up for **authentication**

I look forward to hearing your feedback and I'll keep you posted on
updates.