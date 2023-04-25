# Fly-Offsite-Backup-Manager

Easily automate off-site backup generation for databases hosted on Fly.io. It's a small Laravel application based
on [spatie/laravel-backup](https://github.com/spatie/laravel-backup).

## Getting Started

Fork this repository and clone it to your local machine. Then, create a new Fly.io app.

### Create a Fly.io app

Create a new Fly.io app using the [Fly CLI](https://fly.io/docs/flyctl/installing/):

```bash
fly apps create
```

Configure it in your `fly.toml` file.

### Configure your databases

Configure your databases in `config/databases.php`. These connections you will need to specify in `config/backup.php` in
the `backup.source.databases` key.

### Configure the backup schedule

In `app/Console/Kernel.php` you can configure the backup schedule. By default, it will run every day at 03:00AM.

### Notifications

Notifications are currently by default configured to be sent to Slack. You can configure this in `config/backup.php`.

## On-Demand Backups

Create on-demand backups by running `just backup`. To use this command, you need to
install [just](https://github.com/casey/just). Alternatively, you can SSH into the server and
run `php artisan backup:run` manually to create a backup.
