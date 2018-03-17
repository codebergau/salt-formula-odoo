{%- from "odoo9/map.jinja" import server with context %}
{%- if server.enabled %}

odoo9_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

{{ server.source.address }}:
  git.latest:
  - target: /opt/odoo9/app
  - branch: {{ server.source.get("branch", "9.0") }}
  - depth: 1
  - fetch_tags: False
  - require:
    - pkg: odoo9_packages
    - file: odoo9_directories

odoo9_requirements:
  virtualenv.manage:
  - name: /opt/odoo9
  - requirements: /opt/odoo9/app/requirements.txt
  - require:
    - pkg: odoo9_packages

odoo9_doc_requirements:
  virtualenv.manage:
  - name: /opt/odoo9
  - requirements: /opt/odoo9/app/doc/requirements.txt
  - require:
    - pkg: odoo9_packages

odoo9:
  user.present:
  - name: odoo9
  - shell: /bin/bash
  - home: /opt/odoo9

odoo9_directories:
  file.directory:
  - names:
    - /var/log/odoo9
    - /opt/odoo9
  - user: odoo9
  - group: odoo9
  - makedirs: true
  - require:
    - user: odoo9

/etc/odoo9-server.conf:
  file.managed:
  - source: salt://odoo9/files/odoo9.conf
  - user: odoo9
  - mode: 640
  - template: jinja

/etc/init.d/odoo9-server:
  file.managed:
  - source: salt://odoo9/files/init
  - mode: 755
  - template: jinja

chown_odoo9:
  cmd.run:
  - name: "chown odoo9: /opt/odoo9/ -R"
  - require:
    - file: /opt/odoo9

odoo9-server:
  service.enabled:
  - name: odoo9-server

{%- endif %}
