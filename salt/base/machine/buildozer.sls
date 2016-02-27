https://github.com/kivy/buildozer.git:
  git.latest:
    - target: /home/vagrant/buildozer
    - require: 
      - pkg: buildozer_packages

Run install:
    cmd.run:
      - name: /srv/salt/base/machine/scripts/install_buildozer.sh
      - cwd: /home/vagrant
      - user: vagrant
      - require:
        - git: "https://github.com/kivy/buildozer.git"
