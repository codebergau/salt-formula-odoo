
====
odoo9
====

A comprehensive Enterprise Resource Planning (ERP) suite.

Sample pillars
==============

Single odoo9 service

.. code-block:: yaml

    odoo9:
      server:
        enabled: true
        workers: 1
        bind:
          address: localhost
          protocol: tcp
          port: 8888
        enabled: true
        admin_password: password
        source:
          engine: git
          address: https://github.com/codebergau/odoo9-community
        database:
          engine: postgres
          host: 127.0.0.1
          name: odoo9
          password: password
          user: odoo9
        mail:
          engine: console

Openstack odoo9 service

.. code-block:: yaml
    insert later

Read more
=========

* https://www.odoo9.com
