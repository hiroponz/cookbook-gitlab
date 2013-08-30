# Package
if platform_family?("rhel")
  packages = %w{
    libicu-devel
  }
else
  packages = %w{
    build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev
    curl openssh-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev
  }
end

# production or development
env = "development"

if env = "production"
  envs = %w{production}
else
  envs = %w{development test}
end

# Default user/group id for vagrant
user = "git"
group = "git"
host_user_id = user
host_group_id = group

if RUBY_PLATFORM =~ /linux|darwin/ && env != "production"
  host_user_id = Process.euid
  host_group_id = Process.egid
end

default['gitlab']['packages'] = packages
default['gitlab']['ruby'] = "1.9.3-p392"

# User
default['gitlab']['user'] = user
default['gitlab']['group'] = group
default['gitlab']['home'] = "/home/git"
default['gitlab']['host_user_id'] = host_user_id
default['gitlab']['host_group_id'] = host_group_id

# GitLab shell
default['gitlab']['shell_repository'] = "git://github.com/gitlabhq/gitlab-shell.git"
default['gitlab']['shell_revision'] = "v1.7.0"
default['gitlab']['shell_path'] = "/vagrant/gitlab-shell"

# GitLab hq
default['gitlab']['repository'] = "git://github.com/gitlabhq/gitlabhq.git"
default['gitlab']['revision'] = "master"
default['gitlab']['path'] = "/vagrant/gitlab"

# GitLab shell config
default['gitlab']['url'] = "http://localhost/"
default['gitlab']['repos_path'] = "/vagrant/repositories"
default['gitlab']['redis_path'] = "/usr/local/bin/redis-cli"
default['gitlab']['redis_host'] = "127.0.0.1"
default['gitlab']['redis_port'] = "6379"
default['gitlab']['namespace']  = "resque:gitlab"

# GitLab hq config
default['gitlab']['satellites_path'] = "/vagrant/gitlab-satellites"
default['gitlab']['git_path'] = "/usr/local/bin/git"
default['gitlab']['host'] = "localhost"
default['gitlab']['port'] = "80"
default['gitlab']['email_from'] = "gitlab@localhost"
default['gitlab']['support_email'] = "support@localhost"

# Gems
default['gitlab']['bundle_install'] = "bundle install --deployment"
default['gitlab']['env'] = env
default['gitlab']['envs'] = envs
