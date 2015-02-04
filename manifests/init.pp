# /etc/puppet/modules/hadoop/manafests/init.pp

class hadoop {
  require hadoop::params

  group { "${hadoop::params::hadoop_group}":
    ensure => present,
    gid => "800"
  }

  user { "${hadoop::params::hadoop_user}":
    ensure => present,
    comment => "Hadoop",
    password => "!!",
    uid => "800",
    gid => "800",
    shell => "/bin/bash",
    home => "${hadoop::params::hadoop_user_path}",
    require => Group["hadoop"],
  }

  user { "${hadoop::params::hdfs_user}":
    ensure => present,
    comment => "Hadoop",
    password => "!!",
    uid => "801",
    gid => "800",
    shell => "/bin/bash",
    home => "${hadoop::params::hdfs_user_path}",
    require => Group["hadoop"],
  }

  user { "${hadoop::params::yarn_user}":
    ensure => present,
    comment => "Hadoop",
    password => "!!",
    uid => "802",
    gid => "800",
    shell => "/bin/bash",
    home => "${hadoop::params::yarn_user_path}",
    require => Group["hadoop"],
  }

  user { "${hadoop::params::mapred_user}":
    ensure => present,
    comment => "Hadoop",
    password => "!!",
    uid => "803",
    gid => "800",
    shell => "/bin/bash",
    home => "${hadoop::params::mapred_user_path}",
    require => Group["hadoop"],
  }

#  file { "/etc/profile.d/hadoop.sh":
#    ensure => present,
#    owner => "root",
#    group => "root",
#    alias => "profile-hadoop",
#    content => template("hadoop/home/bash_profile.erb"),
#  }
#
#  file { "${hadoop::params::hadoop_user_path}/.bashrc":
#    ensure => present,
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "${hadoop::params::hadoop_user}-bashrc",
#    content => template("hadoop/home/bashrc.erb"),
#    require => User["${hadoop::params::hadoop_user}"]
#  }
#
#  file { "${hadoop::params::hdfs_user_path}/.bashrc":
#    ensure => present,
#    owner => "${hadoop::params::hdfs_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "${hadoop::params::hdfs_user}-bashrc",
#    content => template("hadoop/home/bashrc.erb"),
#    require => User["${hadoop::params::hdfs_user}"]
#  }
#
#  file { "${hadoop::params::yarn_user_path}/.bashrc":
#    ensure => present,
#    owner => "${hadoop::params::yarn_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "${hadoop::params::yarn_user}-bashrc",
#    content => template("hadoop/home/bashrc.erb"),
#    require => User["${hadoop::params::yarn_user}"]
#  }
#
#  file { "${hadoop::params::mapred_user_path}/.bashrc":
#    ensure => present,
#    owner => "${hadoop::params::mapred_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "${hadoop::params::mapred_user}-bashrc",
#    content => template("hadoop/home/bashrc.erb"),
#    require => User["${hadoop::params::mapred_user}"]
#  }
#
#  file { "${hadoop::params::hadoop_user_path}":
#    ensure => "directory",
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "${hadoop::params::hadoop_user}-home",
#    require => [ User["${hadoop::params::hadoop_user}"], Group["hadoop"] ]
#  }
#
#  file { "${hadoop::params::hdfs_user_path}":
#    ensure => "directory",
#    owner => "${hadoop::params::hdfs_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "${hadoop::params::hdfs_user}-home",
#    require => [ User["${hadoop::params::hdfs_user}"], Group["hadoop"] ]
#  }
#
#  file { "${hadoop::params::yarn_user_path}":
#    ensure => "directory",
#    owner => "${hadoop::params::yarn_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "${hadoop::params::yarn_user}-home",
#    require => [ User["${hadoop::params::yarn_user}"], Group["hadoop"] ]
#  }
#
#  file { "${hadoop::params::mapred_user_path}":
#    ensure => "directory",
#    owner => "${hadoop::params::mapred_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "${hadoop::params::mapred_user}-home",
#    require => [ User["${hadoop::params::mapred_user}"], Group["hadoop"] ]
#  }
#
#  file {"${hadoop::params::hadoop_tmp_path}":
#    ensure => "directory",
#    mode => "g=rwx,o=r",
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "hadoop-tmp-dir",
#    require => File["${hadoop::params::hadoop_user}-home"]
#  }
#
#  file {"${hadoop::params::mapred_log_dir}":
#    ensure => "directory",
#    mode => "g=rwx,o=r",
#    owner => "${hadoop::params::hadoop_path_owner}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "mapre-log-dir",
#    require => [ File["hadoop-base"], Exec["untar-hadoop"], File["hadoop-symlink"] ],
#  }
#
#  file {"${hadoop::params::hadoop_log_dir}":
#    ensure => "directory",
#    mode => "g=rwx,o=r",
#    owner => "${hadoop::params::hdfs_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "hadoop-log-dir",
#    require => [ File["hadoop-base"], Exec["untar-hadoop"], File["hadoop-symlink"] ],
#  }
#
#  file {"${hadoop::params::yarn_log_dir}":
#    ensure => "directory",
#    mode => "g=rwx,o=r",
#    owner => "${hadoop::params::yarn_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "yarn-log-dir",
#    require => [ File["hadoop-base"], Exec["untar-hadoop"], File["hadoop-symlink"] ],
#  }
#
#  #file {"${hadoop::params::yarn_nodemanager_localdirs}":
#  #    ensure => "directory",
#  #    owner => "${hadoop::params::yarn_user}",
#  #    group => "${hadoop::params::hadoop_group}",
#  #    alias => "hadoop-tmp-dir",
#  #    require => File["${hadoop::params::yarn_user}-home"]
#  #}
#  #
#  #file {"${hadoop::params::yarn_nodemanager_logdirs}":
#  #    ensure => "directory",
#  #    owner => "${hadoop::params::yarn_user}",
#  #    group => "${hadoop::params::hadoop_group}",
#  #    alias => "hadoop-tmp-dir",
#  #    require => File["${hadoop::params::yarn_user}-home"]
#  #}
#
#  file {"${hadoop::params::hadoop_base}":
#    ensure => "directory",
#    owner => "${hadoop::params::hadoop_path_owner}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "hadoop-base",
#    mode => 0755,
#  }
#
#  file {"${hadoop::params::hadoop_conf}":
#    ensure => "directory",
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "hadoop-conf",
#    require => [File["hadoop-base"], Exec["untar-hadoop"], File["hadoop-symlink"]],
#    before => [ File["core-site-xml"], File["hdfs-site-xml"], File["mapred-site-xml"], File["yarn-site-xml"], File["yarn-env-sh"], File["hadoop-env-sh"], File["capacity-scheduler-xml"], File["hadoop-master"], File["hadoop-slave"] ]
#  }
#
#  exec { "download hadoop-${hadoop::params::version}.tar.gz":
#    timeout => 0,
#    command => "wget ${hadoop::params::download_url}/hadoop-${hadoop::params::version}.tar.gz",
#    cwd => "${hadoop::params::hadoop_base}",
#    alias => "download-hadoop",
#    user => "${hadoop::params::hadoop_path_owner}",
#    require => File["hadoop-base"],
#    path => ["/bin", "/usr/bin", "/usr/sbin"],
#    #onlyif => "test -d ${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}",
#    creates => "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}.tar.gz",
#    before => [Exec["untar-hadoop"], File["hadoop-symlink"], File["hadoop-app-dir"]],
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}.tar.gz":
#    mode => 0664,
#    ensure => present,
#    owner => "${hadoop::params::hadoop_path_owner}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "hadoop-source-tgz",
#    before => Exec["untar-hadoop"],
#    require => [File["hadoop-base"], Exec["download-hadoop"]],
#  }
#
#  exec { "untar hadoop-${hadoop::params::version}.tar.gz":
#    command => "tar xfvz hadoop-${hadoop::params::version}.tar.gz",
#    cwd => "${hadoop::params::hadoop_base}",
#    creates => "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}",
#    alias => "untar-hadoop",
#    onlyif => "test 0 -eq $(ls -al ${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version} | grep -c bin)",
#    user => "${hadoop::params::hadoop_path_owner}",
#    before => [ File["hadoop-symlink"], File["hadoop-app-dir"] ],
#    path => ["/bin", "/usr/bin", "/usr/sbin"],
#    require => File["hadoop-source-tgz"]
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}":
#    ensure => "directory",
#    mode => 0755,
#    owner => "${hadoop::params::hadoop_path_owner}",
#    group => "${hadoop::params::hadoop_group}",
#    alias => "hadoop-app-dir",
#    require => Exec["untar-hadoop"],
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop":
#    force => true,
#    ensure => "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}",
#    alias => "hadoop-symlink",
#    owner => "${hadoop::params::hadoop_path_owner}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => 0755,
#    require => [Exec["untar-hadoop"], File["hadoop-app-dir"]],
#    before => [ File["core-site-xml"], File["hdfs-site-xml"], File["mapred-site-xml"], File["yarn-site-xml"], File["yarn-env-sh"], File["hadoop-env-sh"], File["capacity-scheduler-xml"], File["hadoop-master"], File["hadoop-slave"] ]
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}/conf/core-site.xml":
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "664",
#    alias => "core-site-xml",
#    content => template("hadoop/conf/core-site.xml.erb"),
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}/conf/capacity-scheduler.xml":
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "664",
#    alias => "capacity-scheduler-xml",
#    content => template("hadoop/conf/capacity-scheduler.xml.erb"),
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}/conf/hdfs-site.xml":
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "664",
#    alias => "hdfs-site-xml",
#    content => template("hadoop/conf/hdfs-site.xml.erb"),
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}/conf/yarn-env.sh":
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "664",
#    alias => "yarn-env-sh",
#    content => template("hadoop/conf/yarn-env.sh.erb"),
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}/conf/hadoop-env.sh":
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "664",
#    alias => "hadoop-env-sh",
#    content => template("hadoop/conf/hadoop-env.sh.erb"),
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}/conf/mapred-site.xml":
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "664",
#    alias => "mapred-site-xml",
#    content => template("hadoop/conf/mapred-site.xml.erb"),
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}/conf/yarn-site.xml":
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "664",
#    alias => "yarn-site-xml",
#    content => template("hadoop/conf/yarn-site.xml.erb"),
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}/conf/masters":
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "664",
#    alias => "hadoop-master",
#    content => template("hadoop/conf/masters.erb"),
#  }
#
#  file { "${hadoop::params::hadoop_base}/hadoop-${hadoop::params::version}/conf/slaves":
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "664",
#    alias => "hadoop-slave",
#    content => template("hadoop/conf/slaves.erb"),
#  }
#
#  file { "${hadoop::params::hadoop_user_path}/.ssh/":
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "700",
#    ensure => "directory",
#    alias => "${hadoop::params::hadoop_user}-ssh-dir",
#  }
#
#  file { "${hadoop::params::hdfs_user_path}/.ssh/":
#    owner => "${hadoop::params::hdfs_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "700",
#    ensure => "directory",
#    alias => "${hadoop::params::hdfs_user}-ssh-dir",
#  }
#
#  file { "${hadoop::params::yarn_user_path}/.ssh/":
#    owner => "${hadoop::params::yarn_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "700",
#    ensure => "directory",
#    alias => "${hadoop::params::yarn_user}-ssh-dir",
#  }
#
#  file { "${hadoop::params::mapred_user_path}/.ssh/":
#    owner => "${hadoop::params::mapred_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "700",
#    ensure => "directory",
#    alias => "${hadoop::params::mapred_user}-ssh-dir",
#  }
#
#  file { "${hadoop::params::hadoop_user_path}/.ssh/id_rsa.pub":
#    ensure => present,
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "644",
#    source => "puppet:///modules/hadoop/ssh/id_rsa.pub",
#    require => File["${hadoop::params::hadoop_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::hadoop_user_path}/.ssh/id_rsa":
#    ensure => present,
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "600",
#    source => "puppet:///modules/hadoop/ssh/id_rsa",
#    require => File["${hadoop::params::hadoop_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::hdfs_user_path}/.ssh/id_rsa.pub":
#    ensure => present,
#    owner => "${hadoop::params::hdfs_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "644",
#    source => "puppet:///modules/hadoop/ssh/id_rsa.pub",
#    require => File["${hadoop::params::hdfs_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::hdfs_user_path}/.ssh/id_rsa":
#    ensure => present,
#    owner => "${hadoop::params::hdfs_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "600",
#    source => "puppet:///modules/hadoop/ssh/id_rsa",
#    require => File["${hadoop::params::hdfs_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::yarn_user_path}/.ssh/id_rsa.pub":
#    ensure => present,
#    owner => "${hadoop::params::yarn_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "644",
#    source => "puppet:///modules/hadoop/ssh/id_rsa.pub",
#    require => File["${hadoop::params::yarn_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::yarn_user_path}/.ssh/id_rsa":
#    ensure => present,
#    owner => "${hadoop::params::yarn_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "600",
#    source => "puppet:///modules/hadoop/ssh/id_rsa",
#    require => File["${hadoop::params::yarn_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::mapred_user_path}/.ssh/id_rsa.pub":
#    ensure => present,
#    owner => "${hadoop::params::mapred_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "644",
#    source => "puppet:///modules/hadoop/ssh/id_rsa.pub",
#    require => File["${hadoop::params::mapred_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::mapred_user_path}/.ssh/id_rsa":
#    ensure => present,
#    owner => "${hadoop::params::mapred_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "600",
#    source => "puppet:///modules/hadoop/ssh/id_rsa",
#    require => File["${hadoop::params::mapred_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::hadoop_user_path}/.ssh/config":
#    ensure => present,
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "600",
#    source => "puppet:///modules/hadoop/ssh/config",
#    require => File["${hadoop::params::hadoop_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::hdfs_user_path}/.ssh/config":
#    ensure => present,
#    owner => "${hadoop::params::hdfs_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "600",
#    source => "puppet:///modules/hadoop/ssh/config",
#    require => File["${hadoop::params::hdfs_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::yarn_user_path}/.ssh/config":
#    ensure => present,
#    owner => "${hadoop::params::yarn_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "600",
#    source => "puppet:///modules/hadoop/ssh/config",
#    require => File["${hadoop::params::yarn_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::mapred_user_path}/.ssh/config":
#    ensure => present,
#    owner => "${hadoop::params::mapred_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "600",
#    source => "puppet:///modules/hadoop/ssh/config",
#    require => File["${hadoop::params::mapred_user}-ssh-dir"],
#  }
#
#  if $hadoop::params::kerberos_mode == "yes" {
#
#    file { "/root/.ssh/id_rsa":
#      ensure => present,
#      owner => "root",
#      group => "root",
#      mode => "600",
#      source => "puppet:///modules/hadoop/ssh/root/id_rsa",
#    }
#
#    file { "/root/.ssh/config":
#      ensure => present,
#      owner => "root",
#      group => "root",
#      mode => "600",
#      source => "puppet:///modules/hadoop/ssh/config",
#    }
#
#    file { "/root/.ssh/authorized_keys":
#      ensure => present,
#      owner => "root",
#      group => "root",
#      mode => "644",
#      source => "puppet:///modules/hadoop/ssh/root/id_rsa.pub",
#    }
#
#    file { "/root/.bashrc":
#      ensure => present,
#      owner => "root",
#      group => "root",
#      content => template("hadoop/home/bashrc.erb"),
#    }
#
#  }
#
#  file { "${hadoop::params::hadoop_user_path}/.ssh/authorized_keys":
#    ensure => present,
#    owner => "${hadoop::params::hadoop_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "644",
#    source => "puppet:///modules/hadoop/ssh/id_rsa.pub",
#    require => File["${hadoop::params::hadoop_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::hdfs_user_path}/.ssh/authorized_keys":
#    ensure => present,
#    owner => "${hadoop::params::hdfs_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "644",
#    source => "puppet:///modules/hadoop/ssh/id_rsa.pub",
#    require => File["${hadoop::params::hdfs_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::yarn_user_path}/.ssh/authorized_keys":
#    ensure => present,
#    owner => "${hadoop::params::yarn_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "644",
#    source => "puppet:///modules/hadoop/ssh/id_rsa.pub",
#    require => File["${hadoop::params::yarn_user}-ssh-dir"],
#  }
#
#  file { "${hadoop::params::mapred_user_path}/.ssh/authorized_keys":
#    ensure => present,
#    owner => "${hadoop::params::mapred_user}",
#    group => "${hadoop::params::hadoop_group}",
#    mode => "644",
#    source => "puppet:///modules/hadoop/ssh/id_rsa.pub",
#    require => File["${hadoop::params::mapred_user}-ssh-dir"],
#  }
#
#  if $hadoop::params::kerberos_mode == "yes" {
#    file {"${hadoop::params::common_base}":
#      ensure => "directory",
#      owner => "${hadoop::params::hadoop_user}",
#      group => "${hadoop::params::hadoop_group}",
#      alias => "commons-base",
#    }
#
#    exec { "download apache commons ${hadoop::params::common_version}.tar.gz":
#      timeout => 0,
#      command => "wget http://ftp.tc.edu.tw/pub/Apache//commons/daemon/source/commons-daemon-${hadoop::params::common_version}-src.tar.gz",
#      cwd => "${hadoop::params::common_base}",
#      alias => "download-commons",
#      user => "${hadoop::params::hadoop_user}",
#      require => File["commons-base"],
#      path => ["/bin", "/usr/bin", "/usr/sbin"],
#      creates => "${hadoop::params::common_base}/commons-daemon-${hadoop::params::common_version}-src.tar.gz",
#    }
#
#    file { "${hadoop::params::common_base}/commons-daemon-${hadoop::params::common_version}-src.tar.gz":
#      mode => 0664,
#      ensure => present,
#      owner => "${hadoop::params::hadoop_user}",
#      group => "${hadoop::params::hadoop_group}",
#      alias => "commons-source-tgz",
#      before => Exec["untar-commons"],
#      require => [File["commons-base"], Exec["download-commons"]],
#    }
#
#    exec { "untar commons-daemon-${hadoop::params::common_version}-src.tar.gz":
#      command => "tar xfvz commons-daemon-${hadoop::params::common_version}-src.tar.gz",
#      cwd => "${hadoop::params::common_base}",
#      creates => "${hadoop::params::common_base}/commons-daemon-${hadoop::params::common_version}-src",
#      alias => "untar-commons",
#      onlyif => "test 0 -eq $(ls -al ${hadoop::params::common_base}/commons-daemon-${hadoop::params::common_version}-src | grep -c bin)",
#      user => "${hadoop::params::hadoop_user}",
#      before => [ File["commons-symlink"], File["commons-dir"] ],
#      path => ["/bin", "/usr/bin", "/usr/sbin"],
#      require => File["commons-source-tgz"]
#    }
#
#    file { "${hadoop::params::common_base}/commons-daemon-${hadoop::params::common_version}-src":
#      ensure => "directory",
#      mode => 0664,
#      owner => "${hadoop::params::hadoop_user}",
#      group => "${hadoop::params::hadoop_group}",
#      alias => "commons-dir",
#      require => Exec["untar-commons"],
#    }
#
#    file { "${hadoop::params::common_base}/jsvc":
#      force => true,
#      ensure => "${hadoop::params::common_base}/commons-daemon-${hadoop::params::common_version}-src",
#      alias => "commons-symlink",
#      owner => "${hadoop::params::hadoop_user}",
#      group => "${hadoop::params::hadoop_group}",
#      require => [Exec["untar-commons"], File["commons-dir"]],
#      before => [ Package["make"], Package["gcc"]],
#    }
#
#    package { ["make", "gcc"]:
#      ensure => installed,
#      require => [File["commons-symlink"]],
#    }
#
#    exec { "make jsvc":
#      command => "./configure --with-java=${hadoop::params::java_home}; make",
#      cwd => "${hadoop::params::common_base}/jsvc/src/native/unix",
#      alias => "make-jsvc",
#      user => "${hadoop::params::hadoop_user}",
#      require => [ Package["make"], Package["gcc"] ],
#      path => ["/bin", "/usr/bin", "/usr/sbin", "${hadoop::params::common_base}/jsvc/src/native/unix"],
#      creates => "${hadoop::params::common_base}/jsvc/src/native/unix/jsvc",
#    }
#
#    file { "/etc/sudoers.d/secure-hadoop-user":
#      ensure => present,
#      owner => "root",
#      group => "root",
#      alias => "secure-hadoop-user",
#      content => template("hadoop/sudoers/hadoop.erb"),
#    }
#
#    file { "${hadoop::params::hadoop_base}/hadoop/bin/container-executor":
#      ensure => present,
#      owner => "${hadoop::params::hadoop_path_owner}",
#      group => "${hadoop::params::hadoop_group}",
#      mode => "6050",
#      source => "puppet:///modules/hadoop/hadoop/container-executor",
#      require => [ File["hadoop-symlink"], File["hadoop-app-dir"] ],
#    }
#
#    file { "${hadoop::params::hadoop_base}/hadoop/bin/test-container-executor":
#      ensure => present,
#      owner => "${hadoop::params::hadoop_path_owner}",
#      group => "${hadoop::params::hadoop_group}",
#      mode => "6050",
#      source => "puppet:///modules/hadoop/hadoop/test-container-executor",
#      require => [ File["hadoop-symlink"], File["hadoop-app-dir"] ],
#    }
#
#    file { "${hadoop::params::hadoop_base}/hadoop/lib/native/libhadoop.so.1.0.0":
#      ensure => present,
#      owner => "${hadoop::params::hadoop_user}",
#      group => "${hadoop::params::hadoop_group}",
#      mode => "0755",
#      source => "puppet:///modules/hadoop/hadoop/libhadoop.so.1.0.0",
#      require => [ File["hadoop-symlink"], File["hadoop-app-dir"] ],
#    }
#
#    file { "${hadoop::params::hadoop_base}/hadoop/bin/libhdfs.so.0.0.0":
#      ensure => present,
#      owner => "${hadoop::params::hadoop_user}",
#      group => "${hadoop::params::hadoop_group}",
#      mode => "0755",
#      source => "puppet:///modules/hadoop/hadoop/libhdfs.so.0.0.0",
#      require => [ File["hadoop-symlink"], File["hadoop-app-dir"] ],
#    }
#
#    file { "${hadoop::params::hadoop_base}/hadoop/etc/hadoop/container-executor.cfg":
#      ensure => present,
#      owner => "root",
#      group => "${hadoop::params::hadoop_group}",
#      mode => "644",
#      content => template("hadoop/conf/container-executor.cfg.erb"),
#      require => [ File["hadoop-symlink"], File["hadoop-app-dir"] ],
#    }
#
#    file { "${hadoop::params::hadoop_base}/hadoop/etc/hadoop":
#      ensure => present,
#      owner => "root",
#      group => "${hadoop::params::hadoop_group}",
#      mode => "755",
#      require => [ File["hadoop-symlink"], File["hadoop-app-dir"] ],
#    }
#
#    file { "${hadoop::params::hadoop_base}/hadoop/etc":
#      ensure => present,
#      owner => "root",
#      group => "${hadoop::params::hadoop_group}",
#      mode => "755",
#      require => [ File["hadoop-symlink"], File["hadoop-app-dir"] ],
#    }
#
#    #file { "${hadoop::params::hadoop_base}/hadoop":
#    #    ensure => present,
#    #    owner => "root",
#    #    group => "${hadoop::params::hadoop_group}",
#    #    mode => "755",
#    #    require => [ File["hadoop-symlink"], File["hadoop-app-dir"] ],
#    #}
#  }
#
#  if $hadoop::params::qjm_ha_mode == "yes" {
#    file { "${hadoop::params::journal_data_dir}":
#      ensure => "directory",
#      owner => "${hadoop::params::hdfs_user}",
#      group => "${hadoop::params::hadoop_group}",
#      mode => "750",
#      alias => "journal-datapath",
#    }
#
#    file { "${hadoop::params::hdfs_user_path}/zk-auth.txt":
#      ensure => present,
#      owner => "${hadoop::params::hdfs_user}",
#      group => "${hadoop::params::hadoop_group}",
#      mode => "644",
#      content => template("hadoop/conf/zk-auth.txt.erb"),
#      require => [ User["${hadoop::params::hdfs_user}"], File["${hadoop::params::hdfs_user_path}"] ],
#    }
#
#    file { "${hadoop::params::hdfs_user_path}/zk-acl.txt":
#      ensure => present,
#      owner => "${hadoop::params::hdfs_user}",
#      group => "${hadoop::params::hadoop_group}",
#      mode => "644",
#      content => template("hadoop/conf/zk-acl.txt.erb"),
#      require => [ User["${hadoop::params::hdfs_user}"], File["${hadoop::params::hdfs_user_path}"] ],
#    }
#  }
}
