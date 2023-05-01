# Flyio-off-site

Easily automate off-site backup generation for databases hosted on Fly.io.

## Introduction

Installing `spatie/laravel-backup` to back up your app DB works great, but having to install it in every app can be
tedious.
Also, this approach doesn't work for apps that don't use Laravel. This app solves these problem by
running `spatie/laravel-backup` on a separate Fly.io VM dedicated to making backups. This way your apps don't need to
run `spatie/laravel-backup`, that's now taken care of by a single Fly.io VM.

## Getting Started

Fork this repository and clone it to your local machine. Then, create a new Fly.io app.

### Create a Fly.io app

Create a new Fly.io app using the [Fly CLI](https://fly.io/docs/flyctl/installing/):

```bash
fly apps create
```

Configure it in your `fly.toml` file.

### Configure your databases

Set up your databases in `config/databases.php`. Specify the database connections you want to back up in
`config/backup.php`, under the `backup.source.databases` key.

### Configure the backup schedule

In `app/Console/Kernel.php` you can configure the backup schedule. By default, it will run every day at 03:00AM. Here's
more info on scheduling: https://spatie.be/docs/laravel-backup/v8/installation-and-setup#content-scheduling

### Notifications

Notifications are currently by default configured to be sent to Slack. You can configure this in `config/backup.php`.
For this to work you just need to configure the webhook url. For more advanced configuration options, I'll refer you to
Spatie docs configuring
notifications: [Sending Notifications](https://spatie.be/docs/laravel-backup/v8/sending-notifications/overview)

### Deploy

Run `fly deploy` to deploy the app to Fly.io. You can check the status of the deployment by running `fly status`.

## On-Demand Backups

Create on-demand backups by running `just backup`. To use this command, you need to
install [just](https://github.com/casey/just). Alternatively, you can SSH into the server and
run `php artisan backup:run` manually to create a backup.
