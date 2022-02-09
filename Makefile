# Makefile

.PHONY: ubuntu2004
ubuntu2004:
	ansible-playbook playbooks/ubuntu2004_base.yml

.PHONY: prometheus-exporter
prometheus-exporter:
	ansible-playbook playbooks/prometheus_exporter.yml

.PHONY: prometheus-stack
prometheus-stack:
	ansible-playbook playbooks/prometheus_stack.yml

.PHONY: grafana-stack
grafana-stack:
	ansible-playbook playbooks/grafana_stack.yml

.PHONY: drone
drone:
	ansible-playbook playbooks/drone.yml

.PHONY: datadog
datadog:
	ansible-playbook playbooks/datadog.yml

.PHONY: dhcp
dhcp:
	ansible-playbook playbooks/dhcp.yml

.PHONY: complete
complete: ubuntu2004 monitoring-stack prometheus-exporter drone datadog dhcp
