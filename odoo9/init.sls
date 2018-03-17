{%- if pillar.odoo9 is defined %}
include:
{%- if pillar.odoo9.server is defined %}
- odoo9.server
{%- endif %}
{%- endif %}
