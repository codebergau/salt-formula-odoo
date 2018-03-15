
====
odoo
====

A comprehensive Enterprise Resource Planning (ERP) suite.

Sample pillars
==============

Single odoo service

.. code-block:: yaml

    odoo:
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
          address: https://github.com/codebergau/odoo-community
        database:
          engine: postgres
          host: 127.0.0.1
          name: odoo
          password: password
          user: odoo
        mail:
          engine: console

Openstack odoo service

.. code-block:: yaml
    insert later

Read more
=========

* https://www.odoo.com
