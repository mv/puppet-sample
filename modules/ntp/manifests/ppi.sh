perl -pi -e 's/datadir/data_dir/g'                   *.*
perl -pi -e 's/logdir/log_dir/g'                     *.*
perl -pi -e 's/packagename/pkg_name/g'               *.*
perl -pi -e 's/servicename/service_name/g'           *.*
perl -pi -e 's/processname/process_name/g'           *.*
perl -pi -e 's/hasstatus/has_status/g'               *.*
perl -pi -e 's/configfile/config_file/g'             *.*
perl -pi -e 's/configfile_mode/config_file_mode/g'   *.*
perl -pi -e 's/configfile_owner/config_file_owner/g' *.*
perl -pi -e 's/configfile_group/config_file_group/g' *.*
perl -pi -e 's/configdir/config_dir/g'               *.*
perl -pi -e 's/initconfigfile/init_config_file/g'    *.*
perl -pi -e 's/pidfile/pid_file/g'                   *.*

