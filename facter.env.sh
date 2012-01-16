

export FACTER_foo1="1 lowcase foo"
export FACTER_FOO2="2 upercase foo"
export facter_bar3="3 lower bar"
export facter_BAR4="4 upper bar"

puppet apply -e '
    notice("foo: ${foo1}")
    notice("FOO: ${FOO2}")
    notice("bar: ${bar3}")
    notice("bar: ${BAR4}")
'


role:
    - apache
    - ssl
    - memcached

app-veja/



veja/git-veja/
    config/
        deploy/
        deploy.rb
        puppet/
            app-veja.pp
                : $app = 'veja'
            location_abril.yml
            location_tw.yml
            app_veja.yml
            env_dev.yml
            env_qa.yml
            env_stage.yml
            env_prod.yml


